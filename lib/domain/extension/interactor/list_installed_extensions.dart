import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionRepository _repository;
  final ApiService _apiService;

  ListInstalledExtensions({
    required ExtensionRepository repository,
    required ApiService apiService,
  })  : _repository = repository,
        _apiService = apiService;

  Future<List<Extension>> call() {
    return _repository.listInstalled();
  }

  Future<List<ExtensionWithBoards>> withBoards() async {
    final extensions = await call();
    final promises = extensions.map((e) async {
      final site = await _apiService.getSite(extensionPkgName: e.pkgName);
      final boards = await _apiService.listBoards(extensionPkgName: e.pkgName, siteId: site.id);
      return ExtensionWithBoards(
        pkgName: e.pkgName,
        displayName: e.displayName,
        zipName: e.zipName,
        version: e.version,
        pythonVersion: e.pythonVersion,
        lang: e.lang,
        isNsfw: e.isNsfw,
        repoUrl: e.repoUrl,
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
    required super.pkgName,
    required super.displayName,
    required super.zipName,
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required super.repoUrl,
    required this.site,
    required this.boards,
  });
}
