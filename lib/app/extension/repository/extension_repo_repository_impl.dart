import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/grpc/grpc_connection_manager.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

@LazySingleton(as: ExtensionRepoRepository)
class ExtensionRepoRepositoryImpl implements ExtensionRepoRepository {
  final ApiService _apiService;
  final GrpcConnectionManager _connectionManager;

  ExtensionRepoRepositoryImpl(
    this._apiService,
    this._connectionManager,
  );

  @override
  Future<List<domain.ExtensionRepo>> list() async {
    // 等待連接準備好
    await _ensureConnected();

    return await _apiService.listExtensionRepos();
  }

  @override
  Future<void> insert(String url) async {
    // 等待連接準備好
    await _ensureConnected();

    await _apiService.addExtensionRepo(url: url);
  }

  @override
  Future<void> delete(String baseUrl) async {
    // 等待連接準備好
    await _ensureConnected();

    await _apiService.removeExtensionRepo(url: baseUrl);
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
