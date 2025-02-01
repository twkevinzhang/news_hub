import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/model/index.dart';

import '../install_service.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionInstallService _installService;
  ListInstalledExtensions({
    required ExtensionInstallService installService,
  }): _installService = installService;

  Future<List<Extension>> call() {
    return Future.value([
      Extension(
        repoBaseUrl: 'github.com/twkevinzhang/beeceptor',
        pkgName: 'twkevinzhang_beeceptor',
        displayName: 'Beeceptor Ex',
        zipName: 'beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
        site: Site(
          extensionPkgName: 'twkevinzhang_beeceptor',
          id: '1',
          name: 'Beeceptor',
          icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
          url: 'https://beeceptor.com/',
        ),
        boards: {},
      ),
    ]);
  }
}
