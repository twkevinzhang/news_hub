import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/app/service/connection/interface.dart';

@LazySingleton(as: ExtensionRepository)
class InstalledRepositoryImpl implements ExtensionRepository {
  final ApiService _apiService;
  final SidecarConnectionManager _connectionManager;

  InstalledRepositoryImpl(
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
    return _apiService.listRemoteExtensions();
  }

  Future<void> _ensureConnected() async {
    await _connectionManager.waitUntilConnected();
  }
}
