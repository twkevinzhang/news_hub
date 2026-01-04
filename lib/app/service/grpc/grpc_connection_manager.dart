import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

enum GrpcConnectionState {
  uninitialized,
  connecting,
  connected,
  failed,
  closed,
}

@singleton
class GrpcConnectionManager {
  ClientChannel? _channel;
  GrpcConnectionState _state = GrpcConnectionState.uninitialized;

  String _host = '127.0.0.1';
  int _port = 55001;

  final _stateController = StreamController<GrpcConnectionState>.broadcast();
  Timer? _reconnectTimer;
  Timer? _healthCheckTimer;

  Stream<GrpcConnectionState> get stateStream => _stateController.stream;
  GrpcConnectionState get state => _state;
  ClientChannel? get channel => _channel;

  void initialize({
    required String host,
    required int port,
    bool autoReconnect = true,
  }) {
    debugPrint('[GrpcConnectionManager] Initializing connection to $host:$port');

    _host = host;
    _port = port;

    _connect();

    if (autoReconnect) {
      _startHealthCheck();
    }
  }

  Future<void> _connect() async {
    if (_isConnectingOrConnected()) {
      debugPrint('[GrpcConnectionManager] Already connecting or connected, skipping');
      return;
    }

    _updateState(GrpcConnectionState.connecting);

    try {
      await _closeChannel();
      debugPrint('[GrpcConnectionManager] Creating new channel to $_host:$_port');

      _channel = ClientChannel(
        _host,
        port: _port,
        options: const ChannelOptions(
          credentials: ChannelCredentials.insecure(),
          connectTimeout: Duration(seconds: 5),
          idleTimeout: Duration(minutes: 5),
        ),
      );

      _updateState(GrpcConnectionState.connected);
      debugPrint('[GrpcConnectionManager] Connection established');
    } catch (e) {
      debugPrint('[GrpcConnectionManager] Connection failed: $e');
      _updateState(GrpcConnectionState.failed);
      _scheduleReconnect();
    }
  }

  bool _isConnectingOrConnected() {
    return _state == GrpcConnectionState.connecting || _state == GrpcConnectionState.connected;
  }

  void _updateState(GrpcConnectionState newState) {
    if (_state != newState) {
      _state = newState;
      _stateController.add(newState);
      debugPrint('[GrpcConnectionManager] State changed to: $newState');
    }
  }

  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      debugPrint('[GrpcConnectionManager] Attempting reconnect...');
      _connect();
    });
  }

  void _startHealthCheck() {
    _healthCheckTimer?.cancel();
    _healthCheckTimer = Timer.periodic(const Duration(seconds: 30), (_) async {
      if (_state != GrpcConnectionState.connected) {
        debugPrint('[GrpcConnectionManager] Not connected, skipping health check');
        return;
      }

      debugPrint('[GrpcConnectionManager] Health check tick');
    });
  }

  Future<void> reconnect() async {
    debugPrint('[GrpcConnectionManager] Manual reconnect requested');
    _reconnectTimer?.cancel();
    await _connect();
  }

  Future<void> updateConnection({
    required String host,
    required int port,
  }) async {
    if (_connectionConfigUnchanged(host, port)) {
      debugPrint('[GrpcConnectionManager] Connection config unchanged, skipping update');
      return;
    }

    debugPrint('[GrpcConnectionManager] Updating connection to $host:$port');
    _host = host;
    _port = port;

    await _connect();
  }

  bool _connectionConfigUnchanged(String host, int port) {
    return _host == host && _port == port;
  }

  Future<void> _closeChannel() async {
    if (_channel != null) {
      debugPrint('[GrpcConnectionManager] Closing existing channel');
      try {
        await _channel!.shutdown();
      } catch (e) {
        debugPrint('[GrpcConnectionManager] Error closing channel: $e');
      }
      _channel = null;
    }
  }

  Future<void> dispose() async {
    debugPrint('[GrpcConnectionManager] Disposing connection manager');

    _reconnectTimer?.cancel();
    _healthCheckTimer?.cancel();

    await _closeChannel();

    _updateState(GrpcConnectionState.closed);
    await _stateController.close();
  }

  ClientChannel getChannel() {
    if (_channelNotReady()) {
      throw StateError(
        'gRPC connection not available. Current state: $_state. '
        'Please ensure initialize() was called and connection is established.'
      );
    }
    return _channel!;
  }

  bool _channelNotReady() {
    return _channel == null || _state != GrpcConnectionState.connected;
  }

  Future<ClientChannel> getChannelSafe() async {
    if (_channelNotReady()) {
      debugPrint('[GrpcConnectionManager] Channel not ready, attempting to connect');
      await _connect();
    }
    return getChannel();
  }
}
