import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/grpc/grpc_connection_manager.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/repository/installed_extension_repository.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@LazySingleton(as: InstalledExtensionRepository)
class InstalledExtensionRepositoryImpl implements InstalledExtensionRepository {
  final ApiService _apiService;
  final GrpcConnectionManager _connectionManager;
  final ExtensionRepoRepository _repoRepository;

  InstalledExtensionRepositoryImpl(
    this._apiService,
    this._connectionManager,
    this._repoRepository,
  );

  @override
  Future<List<Extension>> listInstalled() async {
    await _ensureConnected();
    return _apiService.listInstalledExtensions();
  }

  @override
  Future<Extension> getInstalled(String extensionPkgName) async {
    await _ensureConnected();
    return _apiService.getInstalledExtension(extensionPkgName: extensionPkgName);
  }

  @override
  Stream<Pair<InstallStatus, double>> install(Extension extension) async* {
    await _ensureConnected();

    yield Pair(InstallStatus.installing, 0.0);
    try {
      await _apiService.installExtension(extension: extension);
      yield Pair(InstallStatus.completed, 1.0);
    } catch (e) {
      yield Pair(InstallStatus.failed, 0.0);
    }
  }

  @override
  Future<void> uninstall(Extension extension) async {
    await _ensureConnected();
    return _apiService.uninstallExtension(extension: extension);
  }

  @override
  Future<List<RemoteExtension>> listRemote() async {
    await _ensureConnected();

    final repos = await _repoRepository.list();
    final List<RemoteExtension> results = [];

    for (final repo in repos) {
      try {
        final remotes = await _apiService.listRemoteExtensions(repoBaseUrl: repo.baseUrl);
        results.addAll(remotes);
      } catch (e) {
        // Skip failed repos
      }
    }

    return results;
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
