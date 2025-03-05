import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/extension_repository.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class GetThread {
  final InstalledExtensionRepository _installedExtensionRepository;
  final ExtensionApiService _apiService;

  GetThread({
    required ExtensionApiService apiService,
    required InstalledExtensionRepository installedExtensionRepository,
  })  : _apiService = apiService,
        _installedExtensionRepository = installedExtensionRepository;

  Future<PostWithExtension> call({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String id,
    String? postId,
  }) async {
    final extensionF = _installedExtensionRepository.get(extensionPkgName);
    final siteF = _apiService.site(GetSiteParams(extensionPkgName: extensionPkgName));
    final boardsF = _apiService.boards(GetBoardsParams(extensionPkgName: extensionPkgName, siteId: siteId));
    final threadF = _apiService.thread(GetThreadParams(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      id: id,
      postId: postId,
    ));
    final (extension, site, boards, thread) = await (extensionF, siteF, boardsF, threadF).wait;
    final board = boards.firstWhere((b) => b.id == boardId);
    return PostWithExtension(
      post: thread,
      board: board,
      site: site,
      extension: extension,
    );
  }

  Future<List<PostWithExtension>> listRegardingPosts({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    final extensionF = _installedExtensionRepository.get(extensionPkgName);
    final siteF = _apiService.site(GetSiteParams(extensionPkgName: extensionPkgName));
    final boardsF = _apiService.boards(GetBoardsParams(extensionPkgName: extensionPkgName, siteId: siteId));
    final regardingPostsF = _apiService.regardingPosts(GetRegardingPostsParams(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
    ));
    final (extension, site, boards, regardingPosts) = await (extensionF, siteF, boardsF, regardingPostsF).wait;
    final board = boards.firstWhere((b) => b.id == boardId);

    return regardingPosts
        .map((p) => PostWithExtension(
              post: p,
              site: site,
              board: board,
              extension: extension,
            ))
        .toList();
  }
}

class PostWithExtension extends Post {
  final Extension extension;
  final Site site;
  final Board board;

  PostWithExtension({
    required Post post,
    required this.site,
    required this.extension,
    required this.board,
  }) : super(
          extensionPkgName: post.extensionPkgName,
          siteId: post.siteId,
          boardId: post.boardId,
          threadId: post.threadId,
          id: post.id,
          title: post.title,
          url: post.url,
          createdAt: post.createdAt,
          authorId: post.authorId,
          authorName: post.authorName,
          liked: post.liked,
          disliked: post.disliked,
          comments: post.comments,
          contents: post.contents,
          tags: post.tags,
          latestRegardingPostCreatedAt: post.latestRegardingPostCreatedAt,
          regardingPostsCount: post.regardingPostsCount,
        );
}
