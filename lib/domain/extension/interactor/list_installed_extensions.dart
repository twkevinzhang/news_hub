import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/install_service.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionInstallService _installService;
  ListInstalledExtensions({
    required ExtensionInstallService installService,
  }): _installService = installService;

  Future<List<ExtensionWithBoards>> call() {
    return Future.value([
      ExtensionWithBoards(
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

class ExtensionWithBoards extends Extension {
  final Site site;
  final Set<Board> boards;
  ExtensionWithBoards({
    required super.repoBaseUrl,
    required super.pkgName,
    required super.displayName,
    required super.zipName,
    required super.address,
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required this.site,
    required this.boards,
  });
}