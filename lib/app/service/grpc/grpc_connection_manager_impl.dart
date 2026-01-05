import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/service/sidecar_connection_manager.dart';
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
  final _logsController = ReplaySubject<LogEntry>(maxSize: 1000);

  @override
  Stream<LogEntry> get logsStream => _logsController.stream;

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

    await waitUntilConnected();
    _startHealthCheckSubscription();
    _startWatchingLogsSubscription();

    // Ensure we start emitting only when we have subscribers or just rely on buffer?
    // ReplaySubject buffers automatically.
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
    _stateSubscription = stateStream.startWith(state).where((s) => s == SidecarConnectionState.connected).switchMap((_) {
      debugPrint('[GrpcConnectionManager] [Health] Starting watchHealth stream');
      return _apiService.watchHealth().handleError((error) {
        // Log the error but let it propagate to onError for state management
        debugPrint('[GrpcConnectionManager] [Health] Stream error: $error');
        throw error; // Re-throw to trigger onError
      });
    }).listen(
      (healthCheckResult) {
        if (healthCheckResult.status == ServingStatus.serving) {
          _updateState(SidecarConnectionState.connected);
        } else {
          _updateState(SidecarConnectionState.failed);
        }
      },
      onError: (e) {
        debugPrint('[GrpcConnectionManager] [Health] [FATAL] Health check failed: $e');
        // Only update state to failed if we're currently connected
        // This prevents rapid state changes during reconnection attempts
        if (_stateSnapshot == SidecarConnectionState.connected) {
          _updateState(SidecarConnectionState.failed);
        }
      },
    );
  }

  Future<void> _startWatchingLogsSubscription() async {
    await _logsSubscription?.cancel();

    debugPrint('[GrpcConnectionManager] [Logs] Starting logs subscription');
    // Use a nested switchMap:
    // Outer: listens to connection state.
    // Inner: listens to log level changes ONLY when connected.
    _logsSubscription = stateStream.startWith(state).distinct().switchMap((s) {
      debugPrint('[GrpcConnectionManager] [Logs] State changed to: $s');
      if (s != SidecarConnectionState.connected) {
        debugPrint('[GrpcConnectionManager] [Logs] Not connected, idling stream');
        return const Stream<LogEntry>.empty();
      }

      debugPrint('[GrpcConnectionManager] [Logs] Connected! Starting preference observer');
      return Rx.concat([
        Stream.fromFuture(_sidecarPreferences.logLevel.get()),
        _sidecarPreferences.logLevel.changes(),
      ]).distinct().switchMap((level) {
        debugPrint('[GrpcConnectionManager] [Logs] [TRIGGER] Calling gRPC watchLogs (Level: $level)');
        return _apiService.watchLogs(minLevel: level.toLogLevel()).handleError((error) {
          debugPrint('[GrpcConnectionManager] [Logs] [ERROR] gRPC stream error: $error');
          // If log stream fails, connection is likely dead.
          // Trigger failure state to update UI immediately
          if (_stateSnapshot == SidecarConnectionState.connected) {
            debugPrint('[GrpcConnectionManager] [Logs] Connection broken, updating state to failed');
            _updateState(SidecarConnectionState.failed);
          }
          throw error;
        });
      });
    }).listen(
      (logEntry) {
        debugPrint('[GrpcConnectionManager] [Logs] Received log: ${logEntry.level.name} - ${logEntry.message}');
        _updateLogEntry(logEntry);
      },
      onError: (error) {
        debugPrint('[GrpcConnectionManager] [Logs] [FATAL] Subscription error: $error');
        // REDUNDANT but safe: ensure state is failed
        if (_stateSnapshot == SidecarConnectionState.connected) {
          _updateState(SidecarConnectionState.failed);
        }
      },
    );
    debugPrint('[GrpcConnectionManager] [Logs] Subscription setup complete');
  }

  void _updateState(SidecarConnectionState newState) {
    if (_stateSnapshot != newState) {
      _stateSnapshot = newState;
      _stateController.add(newState);
    }
  }

  void _updateLogEntry(LogEntry logEntry) {
    _logsController.add(logEntry);
  }

  @override
  Future<void> reconnect() async {
    _reconnectTimer?.cancel();
    await _connect();
  }

  Future<void> _closeChannel() async {
    if (_channel == null) {
      return;
    }
    await _channel!.shutdown();
    _channel = null;
  }

  @override
  Future<void> dispose() async {
    _reconnectTimer?.cancel();
    await _logsSubscription?.cancel();
    await _stateSubscription?.cancel();

    await _closeChannel();

    _updateState(SidecarConnectionState.closed);
    await _stateController.close();
    await _logsController.close();
  }

  ClientChannel getChannel() {
    if (_channelNotReady()) {
      throw StateError('gRPC connection not available. Current state: $_stateSnapshot. '
          'Please ensure initialize() was called and connection is established.');
    }
    return _channel!;
  }

  bool _channelNotReady() {
    return _channel == null || _stateSnapshot != SidecarConnectionState.connected;
  }

  Future<ClientChannel> getChannelSafe() async {
    if (_channelNotReady()) {
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
      if (state == SidecarConnectionState.uninitialized || state == SidecarConnectionState.failed || state == SidecarConnectionState.closed) {
        await _connect();
      }
      await completer.future.timeout(const Duration(seconds: 10));
    } finally {
      await subscription.cancel();
    }
  }
}
