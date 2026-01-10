import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/app/service/connection/interface.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class GrpcConnectionManagerImpl implements SidecarConnectionManager {
  final SidecarPreferences _sidecarPreferences;
  final ApiService _apiService;

  GrpcConnectionManagerImpl(this._sidecarPreferences, this._apiService);

  Timer? _reconnectTimer;
  int retryCount = 0;

  final _stateController = StreamController<SidecarConnectionState>.broadcast();
  StreamSubscription<HealthCheckResult>? _stateSubscription;
  SidecarConnectionState _stateSnapshot = SidecarConnectionState.uninitialized;

  @override
  SidecarConnectionState get state => _stateSnapshot;

  @override
  Stream<SidecarConnectionState> get stateStream => _stateController.stream;

  StreamSubscription<LogEntry>? _logsSubscription;
  StreamSubscription<int>? _logLimitSubscription;

  // Wrapper to hold the current ReplaySubject, allowing us to switch it when maxSize changes
  final _logsSubjectWrapper = BehaviorSubject<ReplaySubject<LogEntry>>();

  @override
  Stream<LogEntry> get logsStream => _logsSubjectWrapper.switchMap((subject) => subject.stream);

  String _host = '127.0.0.1';
  int _port = 55001;

  ClientChannel? _channel;
  ClientChannel? get channel => _channel;

  @override
  Future<void> initialize({
    bool autoReconnect = true,
    required String host,
    required int port,
  }) async {
    _host = host;
    _port = port;

    // Initialize logs subject with current preference
    final initialLimit = await _sidecarPreferences.maxLogEntries.get();
    _logsSubjectWrapper.add(ReplaySubject<LogEntry>(maxSize: initialLimit));

    // Listen for limit changes
    _logLimitSubscription = _sidecarPreferences.maxLogEntries.changes().listen((newLimit) {
      _resizeLogBuffer(newLimit);
    });

    await waitUntilConnected();
    _startHealthCheckSubscription();
    _startWatchingLogsSubscription();
  }

  void _resizeLogBuffer(int newLimit) {
    final oldSubject = _logsSubjectWrapper.valueOrNull;
    if (oldSubject == null) return;

    final newSubject = ReplaySubject<LogEntry>(maxSize: newLimit);

    // Migrate existing logs
    // We only take the last 'newLimit' logs to respect the new size immediately
    final existingLogs = oldSubject.values;
    final logsToKeep = existingLogs.length > newLimit ? existingLogs.sublist(existingLogs.length - newLimit) : existingLogs;

    for (var log in logsToKeep) {
      newSubject.add(log);
    }

    _logsSubjectWrapper.add(newSubject);
    oldSubject.close();
  }

  Future<void> _connect() async {
    _updateState(SidecarConnectionState.connecting);
    await _closeChannel();

    _channel = ClientChannel(
      _host,
      port: _port,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectTimeout: Duration(seconds: 5),
        idleTimeout: Duration(minutes: 5),
      ),
    );
    _updateState(SidecarConnectionState.connected);
    debugPrint('[GrpcConnectionManager] Connection ${_host}:${_port} established');
    retryCount = 0;
  }

  void _startHealthCheckSubscription() {
    _stateSubscription?.cancel();
    _stateSubscription = stateStream.startWith(state).where((s) => s == SidecarConnectionState.connected).switchMap((_) => _apiService.watchHealth()).listen(
      (healthCheckResult) {
        if (healthCheckResult.status == ServingStatus.serving) {
          _updateState(SidecarConnectionState.connected);
        } else {
          _updateState(SidecarConnectionState.failed);
        }
      },
      onError: (e) {
        debugPrint('[GrpcConnectionManager] [Health] [ERROR] Health check failed: $e');
        _updateState(SidecarConnectionState.failed);
      },
    );
  }

  Future<void> _startWatchingLogsSubscription() async {
    await _logsSubscription?.cancel();
    // Use a nested switchMap:
    // Outer: listens to connection state.
    // Inner: listens to log level changes ONLY when connected.
    _logsSubscription = stateStream.startWith(state).distinct().switchMap((s) {
      if (s != SidecarConnectionState.connected) {
        return const Stream<LogEntry>.empty();
      }

      return Rx.concat([
        Stream.fromFuture(_sidecarPreferences.logLevel.get()),
        _sidecarPreferences.logLevel.changes(),
      ]).distinct().switchMap((level) {
        return _apiService.watchLogs(minLevel: level.toLogLevel()).handleError((error) {
          _updateState(SidecarConnectionState.failed);
          throw error;
        });
      });
    }).listen(
      (logEntry) {
        _updateLogEntry(logEntry);
      },
      onError: (error) {
        _updateState(SidecarConnectionState.failed);
      },
    );
  }

  void _updateState(SidecarConnectionState newState) {
    if (_stateSnapshot != newState) {
      _stateSnapshot = newState;
      _stateController.add(newState);
    }
  }

  void _updateLogEntry(LogEntry logEntry) {
    // Add to current subject
    _logsSubjectWrapper.valueOrNull?.add(logEntry);
  }

  @override
  Future<void> dispose() async {
    _reconnectTimer?.cancel();
    await _logsSubscription?.cancel();
    await _logLimitSubscription?.cancel();
    await _stateSubscription?.cancel();

    await _closeChannel();

    _updateState(SidecarConnectionState.closed);
    await _stateController.close();

    // Close current subject and wrapper
    await _logsSubjectWrapper.valueOrNull?.close();
    await _logsSubjectWrapper.close();
  }

  @override
  Future<void> reconnect() async {
    _reconnectTimer?.cancel();
    if (![
      SidecarConnectionState.uninitialized,
      SidecarConnectionState.connecting,
      SidecarConnectionState.retrying,
      SidecarConnectionState.closed,
    ].contains(state)) {
      await _connect();
    }
  }

  Future<void> _closeChannel() async {
    if (_channel == null) {
      return;
    }
    await _channel!.shutdown();
    _channel = null;
  }

  ClientChannel getChannel() {
    if (_channel == null || _stateSnapshot != SidecarConnectionState.connected) {
      throw StateError('gRPC connection not available. Current state: $_stateSnapshot. '
          'Please ensure initialize() was called and connection is established.');
    }
    return _channel!;
  }

  Future<ClientChannel> getChannelSafe() async {
    if (_channel == null || _stateSnapshot != SidecarConnectionState.connected) {
      await _connect();
    }
    return getChannel();
  }

  @override
  Future<void> waitUntilConnected() async {
    if (state == SidecarConnectionState.connected) return;

    final completer = Completer<void>();
    final subscription = stateStream.listen((domainState) {
      if (domainState == SidecarConnectionState.connected) {
        if (!completer.isCompleted) completer.complete();
      } else if (domainState == SidecarConnectionState.failed || domainState == SidecarConnectionState.closed) {
        if (!completer.isCompleted) completer.completeError(StateError('Connection failed: $domainState'));
      }
    });

    try {
      if (![
        SidecarConnectionState.connecting,
        SidecarConnectionState.retrying,
        SidecarConnectionState.closed,
      ].contains(state)) {
        await _connect();
      }
      await completer.future.timeout(const Duration(seconds: 5));
    } finally {
      await subscription.cancel();
    }
  }
}
