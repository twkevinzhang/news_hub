import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListRegardingPosts {
  final InstalledExtensionRepository _installedExtensionRepository;
  final ExtensionApiService _apiService;

  ListRegardingPosts({
    required ExtensionApiService apiService,
    required InstalledExtensionRepository installedExtensionRepository,
  })  : _apiService = apiService,
        _installedExtensionRepository = installedExtensionRepository;

  Future<List<PostWithExtension>> call({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  }) async {
    final extensionF = _installedExtensionRepository.get(extensionPkgName);
    final siteF = _apiService.site(GetSiteParams(extensionPkgName: extensionPkgName));
    final boardsF = _apiService.boards(GetBoardsParams(extensionPkgName: extensionPkgName, siteId: siteId));
    final regardingPostsF = _apiService.regardingPosts(GetRegardingPostsParams(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      replyToId: replyToId,
      pagination: pagination,
    ));
    final (extension, site, boards, regardingPosts) = await (extensionF, siteF, boardsF, regardingPostsF).wait;
    final board = boards.firstWhere((b) => b.id == boardId);

    return regardingPosts
        .map((p) => PostWithExtension(
              post: p,
              board: board,
              site: site,
              extension: extension,
            ))
        .toList();
  }

  Future<void> refresh() async {
    await _apiService.refreshRegardingPosts();
  }
}