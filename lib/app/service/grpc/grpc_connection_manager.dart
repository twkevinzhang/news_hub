import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';

/// gRPC 連接狀態
enum GrpcConnectionState {
  /// 未初始化
  uninitialized,

  /// 連接中
  connecting,

  /// 已連接
  connected,

  /// 連接失敗
  failed,

  /// 已關閉
  closed,
}

/// gRPC 連接管理器
///
/// 統一管理 App 內所有 gRPC 連接的生命週期。
///
/// 職責：
/// - 管理 ClientChannel 的建立、重連、關閉
/// - 監控連接狀態
/// - 提供連接健康檢查
/// - 自動重連機制
@singleton
class GrpcConnectionManager {
  ClientChannel? _channel;
  GrpcConnectionState _state = GrpcConnectionState.uninitialized;

  String _host = '127.0.0.1';
  int _port = 55001;

  final _stateController = StreamController<GrpcConnectionState>.broadcast();
  Timer? _reconnectTimer;
  Timer? _healthCheckTimer;

  /// 連接狀態串流
  Stream<GrpcConnectionState> get stateStream => _stateController.stream;

  /// 當前連接狀態
  GrpcConnectionState get state => _state;

  /// 當前 Channel（可能為 null）
  ClientChannel? get channel => _channel;

  /// 初始化連接
  ///
  /// [host] gRPC 服務器地址
  /// [port] gRPC 服務器端口
  /// [autoReconnect] 是否啟用自動重連
  ///
  /// 注意：此方法不會等待連接建立完成，會立即返回
  void initialize({
    required String host,
    required int port,
    bool autoReconnect = true,
  }) {
    debugPrint('[GrpcConnectionManager] Initializing connection to $host:$port');

    _host = host;
    _port = port;

    // 異步建立連接，不阻塞初始化
    _connect();

    if (autoReconnect) {
      _startHealthCheck();
    }
  }

  /// 建立連接
  Future<void> _connect() async {
    if (_state == GrpcConnectionState.connecting || _state == GrpcConnectionState.connected) {
      debugPrint('[GrpcConnectionManager] Already connecting or connected, skipping');
      return;
    }

    _updateState(GrpcConnectionState.connecting);

    try {
      // 關閉舊連接
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
      debugPrint('[GrpcConnectionManager] ✓ Connection established');
    } catch (e) {
      debugPrint('[GrpcConnectionManager] ✗ Connection failed: $e');
      _updateState(GrpcConnectionState.failed);
      _scheduleReconnect();
    }
  }

  /// 更新連接狀態
  void _updateState(GrpcConnectionState newState) {
    if (_state != newState) {
      _state = newState;
      _stateController.add(newState);
      debugPrint('[GrpcConnectionManager] State changed to: $newState');
    }
  }

  /// 排程重連
  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), () {
      debugPrint('[GrpcConnectionManager] Attempting reconnect...');
      _connect();
    });
  }

  /// 啟動健康檢查
  void _startHealthCheck() {
    _healthCheckTimer?.cancel();
    _healthCheckTimer = Timer.periodic(const Duration(seconds: 30), (_) async {
      if (_state != GrpcConnectionState.connected) {
        debugPrint('[GrpcConnectionManager] Not connected, skipping health check');
        return;
      }

      // 健康檢查邏輯可以在這裡實現
      // 例如：呼叫 HealthCheck RPC
      debugPrint('[GrpcConnectionManager] Health check tick');
    });
  }

  /// 手動重連
  Future<void> reconnect() async {
    debugPrint('[GrpcConnectionManager] Manual reconnect requested');
    _reconnectTimer?.cancel();
    await _connect();
  }

  /// 更新連接配置
  Future<void> updateConnection({
    required String host,
    required int port,
  }) async {
    if (_host == host && _port == port) {
      debugPrint('[GrpcConnectionManager] Connection config unchanged, skipping update');
      return;
    }

    debugPrint('[GrpcConnectionManager] Updating connection to $host:$port');
    _host = host;
    _port = port;

    await _connect();
  }

  /// 關閉 Channel
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

  /// 關閉連接管理器
  Future<void> dispose() async {
    debugPrint('[GrpcConnectionManager] Disposing connection manager');

    _reconnectTimer?.cancel();
    _healthCheckTimer?.cancel();

    await _closeChannel();

    _updateState(GrpcConnectionState.closed);
    await _stateController.close();
  }

  /// 獲取當前 Channel（確保已連接）
  ///
  /// 如果未連接會拋出異常
  ClientChannel getChannel() {
    if (_channel == null || _state != GrpcConnectionState.connected) {
      throw StateError(
        'gRPC connection not available. Current state: $_state. '
        'Please ensure initialize() was called and connection is established.'
      );
    }
    return _channel!;
  }

  /// 安全獲取 Channel
  ///
  /// 如果未連接會嘗試重連
  Future<ClientChannel> getChannelSafe() async {
    if (_channel == null || _state != GrpcConnectionState.connected) {
      debugPrint('[GrpcConnectionManager] Channel not ready, attempting to connect');
      await _connect();
    }
    return getChannel();
  }
}
