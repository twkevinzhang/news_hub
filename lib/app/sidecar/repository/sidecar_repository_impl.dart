import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/grpc/grpc_connection_manager.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository/sidecar_repository.dart';

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
    await _ensureConnected();
    yield* _apiService.watchHealth();
  }

  @override
  Future<HealthCheckResult> getHealthStatus() async {
    await _ensureConnected();
    return _apiService.healthCheck();
  }

  @override
  Stream<LogEntry> watchLogs({required LogLevel minLevel}) async* {
    await _ensureConnected();
    yield* _apiService.watchLogs(minLevel: minLevel);
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
