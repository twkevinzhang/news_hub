import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/api/api_service.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/app/service/connection/interface.dart';

@LazySingleton(as: ExtensionRepository)
class ExtensionRepositoryImpl implements ExtensionRepository {
  final ApiService _apiService;
  final SidecarConnectionManager _connectionManager;

  ExtensionRepositoryImpl(
    this._apiService,
    this._connectionManager,
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

    yield const Pair(InstallStatus.installing, 0.0);
    try {
      bool finished = false;
      String? error;

      // Start installation in parallel
      final installFuture = _apiService.installExtension(extension: extension).then((_) {
        finished = true;
      }).catchError((e) {
        finished = true;
        error = e.toString();
      });

      // Poll progress
      while (!finished) {
        await Future.delayed(500.milliseconds);
        if (finished) break;

        try {
          final progress = await _apiService.getInstallProgress(
            extensionPkgName: extension.pkgName,
          );
          yield Pair(InstallStatus.installing, progress / 100.0);
        } catch (e) {
          // Ignore polling errors if we are still installing
        }
      }

      await installFuture;

      if (error != null) {
        yield const Pair(InstallStatus.failed, 0.0);
      } else {
        yield const Pair(InstallStatus.completed, 1.0);
      }
    } catch (e) {
      yield const Pair(InstallStatus.failed, 0.0);
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
    return _apiService.listRemoteExtensions();
  }

  Future<void> _ensureConnected() async {
    await _connectionManager.waitUntilConnected();
  }
}
