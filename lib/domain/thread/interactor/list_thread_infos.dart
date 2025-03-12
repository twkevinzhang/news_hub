import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListThreadInfos {
  final ExtensionApiService _apiService;
  final ListInstalledExtensions _listInstalledExtensions;

  ListThreadInfos({
    required ExtensionApiService apiService,
    required ListInstalledExtensions listInstalledExtensions,
  })  : _apiService = apiService,
        _listInstalledExtensions = listInstalledExtensions;

  Future<List<PostWithExtension>> call({
    Pagination? pagination,
    ThreadsFilter? filter,
    ThreadsSorting? sorting,
  }) async {
    final extensions = await _listInstalledExtensions.withBoards();
    final boards = extensions.map((e) => e.boards).flatten();
    final sites = extensions.map((e) => e.site);

    final threads = (await Future.wait(extensions.map((e) =>
      _apiService.threadInfos(
        extensionPkgName: e.pkgName,
        siteId: e.site.id,
        boardsSorting: filter?.boardsSorting,
        pagination: pagination,
        keywords: filter?.keywords,
      )
    )))
        .flatten();

    return threads.map((t) {
      final e = extensions.firstWhere((e) => e.pkgName == t.extensionPkgName);
      final s = sites.firstWhere((s) => s.extensionPkgName == e.pkgName);
      final b = boards.firstWhere((b) => b.id == t.boardId);
      return PostWithExtension(post: t, board: b, extension: e, site: s);
    }).toList();
  }
}

