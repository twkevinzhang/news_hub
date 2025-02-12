import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/extension/extension_install_service.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

enum InstallStatus {
  downloading,
  installing,
}

@lazySingleton
class InstallExtension {
  final ExtensionInstallService _installService;
  final ExtensionRepository _extensionRepository;
  InstallExtension({
    required ExtensionInstallService installService,
    required ExtensionRepository extensionRepository,
  })  : _installService = installService,
        _extensionRepository = extensionRepository;

  Stream<Pair<InstallStatus, double>> downloadAndInstall(
      String zipUrl, Extension extension) {
    return _installService.download(zipUrl, extension).asyncMap((second) async {
      return Pair(InstallStatus.downloading, second.toDouble());
    }).asyncExpand((status) async* {
      if (status.second == 100.0) {
        yield Pair(InstallStatus.installing, 0.0);
        yield* _installService
            .install(extension)
            .map((e) => Pair(InstallStatus.installing, 100.0));
        _extensionRepository.insert(
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
      }
    });
  }
}
