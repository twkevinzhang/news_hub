import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/search/search.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListThreads {
  final ExtensionApiService _apiService;
  final ListInstalledExtensions _listInstalledExtensions;
  ListThreads({
    required ExtensionApiService apiService,
    required ListInstalledExtensions listInstalledExtensions,
  })  : _apiService = apiService,
        _listInstalledExtensions = listInstalledExtensions;

  Future<List<ThreadWithExtension>> call(
      {Pagination? pagination, SearchConfigForm? searchConfigForm}) async {
    final extensions = await _listInstalledExtensions.call();
    List<Board> boards = (await Future.wait(extensions
            .map((e) => _apiService.boards(extension: e, siteId: e.site.id))))
        .flatten();
    if (searchConfigForm != null) {
      boards =
          boards.sortedBy((b) => searchConfigForm.boardsOrder.indexOf(b.id));
    }
    final threads = (await Future.wait(boards.map((b) {
      final e = extensions
          .firstWhere((element) => element.pkgName == b.extensionPkgName);
      return _apiService.threads(
        extension: e,
        siteId: e.site.id,
        boardId: b.id,
        pagination: pagination,
        sortBy: searchConfigForm?.threadsSorting[b.id],
        keywords: searchConfigForm?.keywords,
      );
    })))
        .flatten();

    return threads.map((t) {
      final e = extensions
          .firstWhere((element) => element.pkgName == t.extensionPkgName);
      final b = boards.firstWhere((element) => element.id == t.boardId);
      return ThreadWithExtension(thread: t, board: b, extension: e);
    }).toList();
  }
}

class ThreadWithExtension extends Thread {
  final Board board;
  final Extension extension;

  ThreadWithExtension({
    required Thread thread,
    required this.board,
    required this.extension,
  }) : super(
          extensionPkgName: thread.extensionPkgName,
          siteId: thread.siteId,
          boardId: thread.boardId,
          boardName: thread.boardName,
          id: thread.id,
          url: thread.url,
          masterPost: thread.masterPost,
        );
}
