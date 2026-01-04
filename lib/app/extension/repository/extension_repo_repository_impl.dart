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
    await _ensureConnected();
    return await _apiService.listExtensionRepos();
  }

  @override
  Future<void> insert(String url) async {
    await _ensureConnected();
    await _apiService.addExtensionRepo(url: url);
  }

  @override
  Future<void> delete(String baseUrl) async {
    await _ensureConnected();
    await _apiService.removeExtensionRepo(url: baseUrl);
  }

  Future<void> _ensureConnected() async {
    final state = _connectionManager.state;

    if (state == GrpcConnectionState.connected) {
      return;
    }

    if (state == GrpcConnectionState.connecting) {
      await _waitForConnection();
      return;
    }

    await _connectionManager.getChannelSafe();
  }

  Future<void> _waitForConnection() async {
    final completer = Completer<void>();

    final subscription = _connectionManager.stateStream.listen((state) {
      if (_shouldCompleteSuccessfully(state)) {
        _completeIfNeeded(completer);
      } else if (_shouldCompleteFailed(state)) {
        _completeErrorIfNeeded(completer, 'gRPC connection failed or closed while waiting');
      }
    });

    try {
      await completer.future.timeout(
        const Duration(seconds: 10),
        onTimeout: () => throw TimeoutException('Timeout waiting for gRPC connection'),
      );
    } finally {
      await subscription.cancel();
    }
  }

  bool _shouldCompleteSuccessfully(GrpcConnectionState state) {
    return state == GrpcConnectionState.connected;
  }

  bool _shouldCompleteFailed(GrpcConnectionState state) {
    return state == GrpcConnectionState.failed || state == GrpcConnectionState.closed;
  }

  void _completeIfNeeded(Completer<void> completer) {
    if (!completer.isCompleted) {
      completer.complete();
    }
  }

  void _completeErrorIfNeeded(Completer<void> completer, String message) {
    if (!completer.isCompleted) {
      completer.completeError(StateError(message));
    }
  }
}
