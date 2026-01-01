import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/extension_install_service.dart'
    as installer;
import 'package:news_hub/domain/extension/installed_extension_repository.dart';
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
// TODO: 呼叫 sidecar 自行從 github 下載 class 並安裝
class InstallExtension {
  final ExtensionApiService _extensionApiService;
  final installer.ExtensionInstallService _installService;
  final InstalledExtensionRepository _extensionRepository;
  InstallExtension({
    required ExtensionApiService extensionApiService,
    required installer.ExtensionInstallService installService,
    required InstalledExtensionRepository extensionRepository,
  })  : _installService = installService,
        _extensionApiService = extensionApiService,
        _extensionRepository = extensionRepository;

  Stream<Pair<InstallStatus, double>> downloadAndInstall(
      String zipUrl, Extension extension) async* {
    await _installService.downloadAndInstall(zipUrl, extension).first;
    await _extensionRepository.insertByModel(extension);
  }
}
