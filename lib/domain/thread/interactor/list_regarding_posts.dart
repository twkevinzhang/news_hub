import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListRegardingPosts {
  final GetInstalledExtension _getInstalledExtension;
  final ApiService _service;

  ListRegardingPosts({
    required ApiService apiService,
    required GetInstalledExtension installedRepository,
  })  : _service = apiService,
        _getInstalledExtension = installedRepository;

  Future<List<ArticlePostWithExtension>> call({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  }) async {
    final extensionF = _getInstalledExtension.get(extensionPkgName);
    final siteF = _service.getSite(extensionPkgName: extensionPkgName);
    final boardsF = _service.listBoards(extensionPkgName: extensionPkgName, siteId: siteId);
    final regardingPostsF = _service.listRegardingPosts(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      replyToId: replyToId,
      pagination: pagination,
    );
    final (extension, site, boards, regardingPosts) = await (extensionF, siteF, boardsF, regardingPostsF).wait;
    final board = boards.firstWhere((b) => b.id == boardId);

    return regardingPosts
        .map((p) => ArticlePostWithExtension(
              post: p as ArticlePost,
              board: board,
              site: site,
              extension: extension,
            ))
        .toList();
  }
}
