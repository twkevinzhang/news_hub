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
    var boards = extensions.map((e) => e.boards).flatten();
    var sites = extensions.map((e) => e.site);
    if (boards.length > 3) {
      boards = boards.take(1).toList(); // for test
    }
    if (sorting != null) {
      boards = boards.sortedBy((b) => sorting.boardsOrder.indexOf(b.id));
    }
    if (filter != null) {
      if (filter.boardsSorting.isNotEmpty) {
        boards = boards.filter((b) => filter.boardsSorting.containsKey(b.id));
      }
    }

    // TODO: 將 filter by boards 邏輯搬到 python extension 裡面，注意：要篩選好 boards id 們歸於哪個 extension
    final threads = (await Future.wait(boards.map((b) {
      final e = extensions.firstWhere((e) => e.pkgName == b.extensionPkgName);
      return _apiService.threadInfos(GetThreadInfosParams(
        extensionPkgName: e.pkgName,
        siteId: e.site.id,
        boardId: b.id,
        pagination: pagination,
        sortBy: filter?.boardsSorting[b.id],
        keywords: filter?.keywords,
      ));
    })))
        .flatten();

    return threads.map((t) {
      final e = extensions.firstWhere((e) => e.pkgName == t.extensionPkgName);
      final b = boards.firstWhere((b) => b.id == t.boardId);
      final s = sites.firstWhere((s) => s.id == b.siteId);
      return PostWithExtension(post: t, board: b, extension: e, site: s);
    }).toList();
  }
}

