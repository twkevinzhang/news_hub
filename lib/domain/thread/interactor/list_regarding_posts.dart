import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/installed_extension_repository.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListRegardingPosts {
  final InstalledExtensionRepository _installedExtensionRepository;
  final ExtensionApiService _apiService;

  ListRegardingPosts({
    required ExtensionApiService apiService,
    required InstalledExtensionRepository installedExtensionRepository,
  })  : _apiService = apiService,
        _installedExtensionRepository = installedExtensionRepository;

  Future<List<ArticlePostWithExtension>> call({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  }) async {
    final extensionF = _installedExtensionRepository.get(extensionPkgName);
    final siteF = _apiService.site(extensionPkgName: extensionPkgName);
    final boardsF = _apiService.boards(extensionPkgName: extensionPkgName, siteId: siteId);
    final regardingPostsF = _apiService.regardingPosts(
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