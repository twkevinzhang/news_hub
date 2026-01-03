import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
// TODO: 從 sidecar 取得已安裝 extension 清單
class ListInstalledExtensions {
  final ApiService _service;
  ListInstalledExtensions({
    required ApiService service,
  })  : _service = service;

  Future<List<Extension>> call() {
    return _service.listInstalledExtensions();
  }

  Future<List<ExtensionWithBoards>> withBoards() async {
    final extensions = await call();
    final promises = extensions.map((e) async {
      final site = await _service.getSite(extensionPkgName: e.pkgName);
      final boards = await _service.listBoards(extensionPkgName: e.pkgName, siteId: site.id);
      return ExtensionWithBoards(
        repoBaseUrl: e.repoBaseUrl,
        pkgName: e.pkgName,
        displayName: e.displayName,
        zipName: e.zipName,
        version: e.version,
        pythonVersion: e.pythonVersion,
        lang: e.lang,
        isNsfw: e.isNsfw,
        site: site,
        boards: boards.toSet(),
      );
    });
    return await Future.wait(promises);
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
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required this.site,
    required this.boards,
  });
}
