import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/extension_install_service.dart'
    as installer;
import 'package:news_hub/domain/extension/extension_instance_manager.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

enum InstallStatus {
  downloading,
  reading,
  extracting,
  testing,
  cleaning,
}

@lazySingleton
class InstallExtension {
  final ExtensionInstanceManager _extensionInstanceManager;
  final ExtensionApiService _extensionApiService;
  final installer.ExtensionInstallService _installService;
  final InstalledExtensionRepository _extensionRepository;
  InstallExtension({
    required ExtensionInstanceManager extensionInstanceManager,
    required ExtensionApiService extensionApiService,
    required installer.ExtensionInstallService installService,
    required InstalledExtensionRepository extensionRepository,
  })  : _installService = installService,
        _extensionApiService = extensionApiService,
        _extensionInstanceManager = extensionInstanceManager,
        _extensionRepository = extensionRepository;

  Stream<Pair<InstallStatus, double>> downloadAndInstall(
      String zipUrl, Extension extension) async* {
    yield Pair(InstallStatus.downloading, 0.0);
    await _installService.removeZip(extension);
    await for (final status in _installService.download(zipUrl, extension)) {
      yield Pair(InstallStatus.downloading, status.toDouble());
    }
    await installAndTest(extension).last;
  }

  Future<void> uninstall(Extension extension) async {
    await _extensionInstanceManager.close(extension);
    await _installService.uninstall(extension);
    await _extensionRepository.delete(extension.pkgName);
  }

  Stream<Pair<InstallStatus, double>> installAndTest(Extension extension) async* {
    await for (final status in _installService.install(extension)) {
      if (status == installer.ZipStatus.reading) {
        yield Pair(InstallStatus.reading, 0.0);
      } else if (status == installer.ZipStatus.extracting) {
        yield Pair(InstallStatus.extracting, 0.0);
      }
    }
    yield Pair(InstallStatus.testing, 0.0);
    await _extensionInstanceManager.runNew(extension);
    final site = await _extensionApiService.site(extensionPkgName: extension.pkgName);
    await _extensionInstanceManager.close(extension);
    await _extensionRepository.insert(
      repoBaseUrl: extension.repoBaseUrl,
      pkgName: extension.pkgName,
      displayName: extension.displayName,
      zipName: extension.zipName,
      address: extension.address,
      version: extension.version,
      pythonVersion: extension.pythonVersion,
      lang: extension.lang,
      isNsfw: extension.isNsfw,
    );
    yield Pair(InstallStatus.cleaning, 0.0);
    await _installService.removeZip(extension);
  }

  Stream<Pair<InstallStatus, double>> installOnly(Extension extension) async* {
    await for (final status in _installService.install(extension)) {
      if (status == installer.ZipStatus.reading) {
        yield Pair(InstallStatus.reading, 0.0);
      } else if (status == installer.ZipStatus.extracting) {
        yield Pair(InstallStatus.extracting, 0.0);
      }
    }
    yield Pair(InstallStatus.testing, 0.0);
    await _extensionRepository.insert(
      repoBaseUrl: extension.repoBaseUrl,
      pkgName: extension.pkgName,
      displayName: extension.displayName,
      zipName: extension.zipName,
      address: extension.address,
      version: extension.version,
      pythonVersion: extension.pythonVersion,
      lang: extension.lang,
      isNsfw: extension.isNsfw,
    );
    yield Pair(InstallStatus.cleaning, 0.0);
    await _installService.removeZip(extension);
  }
}
