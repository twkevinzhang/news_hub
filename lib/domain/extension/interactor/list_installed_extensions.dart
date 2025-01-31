part of '../index.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionInstallService _installService;
  ListInstalledExtensions({
    required ExtensionInstallService installService,
  }): _installService = installService;

  Future<List<Extension>> call() {
    return Future.value([
      Extension(
        pkgName: 'twkevinzhan_beeceptor',
        displayName: 'beeceptor',
        zipName: 'beeceptor.zip',
        address: 'http://127.0.0.1:55001',
        version: 1,
        pythonVersion: 1,
        isNsfw: false,
        lang: 'zh_tw',
        site: Site(
          extensionPkgName: 'twkevinzhan_beeceptor',
          id: '1',
          name: 'Beeceptor',
          icon: 'beeceptor.png',
          url: 'https://beeceptor.com/',
        ),
        boards: {},
      ),
    ]);
  }
}
