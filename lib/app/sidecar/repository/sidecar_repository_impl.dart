import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/grpc/grpc_connection_manager.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

/// Sidecar Repository 的實作類別
///
/// 實作 [SidecarRepository] 接口，使用 [ApiService] 作為底層資料來源。
/// 此類別位於 Data 層，負責將 Domain 層的抽象需求轉換為具體的 API 呼叫。
///
/// 依賴注入：
/// - 註冊為 [SidecarRepository] 的 LazySingleton
/// - 注入 [ApiService] 進行實際的 gRPC 通訊
/// - 注入 [GrpcConnectionManager] 管理連接生命週期
@LazySingleton(as: SidecarRepository)
class SidecarRepositoryImpl implements SidecarRepository {
  final ApiService _apiService;
  final GrpcConnectionManager _connectionManager;

  SidecarRepositoryImpl(
    this._apiService,
    this._connectionManager,
  );

  @override
  Stream<HealthCheckResult> watchHealth() async* {
    // 等待連接準備好
    await _ensureConnected();

    // 委託給 ApiService
    yield* _apiService.watchHealth();
  }

  @override
  Future<HealthCheckResult> getHealthStatus() async {
    // 等待連接準備好
    await _ensureConnected();

    // 委託給 ApiService
    return _apiService.healthCheck();
  }

  @override
  Stream<LogEntry> watchLogs({required LogLevel minLevel}) async* {
    // 等待連接準備好
    await _ensureConnected();

    // 委託給 ApiService
    yield* _apiService.watchLogs(minLevel: minLevel);
  }

  /// 確保 gRPC 連接已建立
  ///
  /// 如果連接未建立，會等待連接建立完成。
  /// 如果連接失敗，會拋出異常。
  Future<void> _ensureConnected() async {
    final state = _connectionManager.state;

    // 如果已連接，直接返回
    if (state == GrpcConnectionState.connected) {
      return;
    }

    // 如果正在連接，等待連接完成
    if (state == GrpcConnectionState.connecting) {
      await _waitForConnection();
      return;
    }

    // 如果未初始化或失敗，嘗試安全獲取連接（會觸發重連）
    await _connectionManager.getChannelSafe();
  }

  /// 等待連接建立完成
  ///
  /// 監聽連接狀態變化，直到連接成功或失敗。
  Future<void> _waitForConnection() async {
    final completer = Completer<void>();

    final subscription = _connectionManager.stateStream.listen((state) {
      if (state == GrpcConnectionState.connected) {
        if (!completer.isCompleted) {
          completer.complete();
        }
      } else if (state == GrpcConnectionState.failed || state == GrpcConnectionState.closed) {
        if (!completer.isCompleted) {
          completer.completeError(
            StateError('gRPC connection failed or closed while waiting'),
          );
        }
      }
    });

    try {
      // 設定超時時間為 10 秒
      await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw TimeoutException('Timeout waiting for gRPC connection');
        },
      );
    } finally {
      await subscription.cancel();
    }
  }
}
