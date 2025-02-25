import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/extension_install_service.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListInstalledExtensions {
  final ExtensionApiService _apiService;
  final InstalledExtensionRepository _extensionRepo;
  ListInstalledExtensions({
    required ExtensionApiService apiService,
    required InstalledExtensionRepository extensionRepo,
  })  : _apiService = apiService,
        _extensionRepo = extensionRepo;

  Stream<List<Extension>> asStream() {
    return _extensionRepo.stream();
  }

  Future<List<Extension>> asFuture() {
    return _extensionRepo.list();
  }

  Future<List<ExtensionWithBoards>> withBoards() async {
    final extensions = await _extensionRepo.list();
    final promises = extensions.map((e) async {
      final site = await _apiService.site(extension: e);
      final boards = await _apiService.boards(extension: e, siteId: site.id);
      return ExtensionWithBoards(
        repoBaseUrl: e.repoBaseUrl,
        pkgName: e.pkgName,
        displayName: e.displayName,
        zipName: e.zipName,
        address: e.address,
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
    required super.address,
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required this.site,
    required this.boards,
  });
}
