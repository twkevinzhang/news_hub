import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/installed_extension_repository.dart';
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

  Future<ArticlePostWithExtension> call({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    final extensionF = _installedExtensionRepository.get(extensionPkgName);
    final siteF = _apiService.site(extensionPkgName: extensionPkgName);
    final boardsF = _apiService.boards(extensionPkgName: extensionPkgName, siteId: siteId);
    final threadF = _apiService.thread(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
    );
    final (extension, site, boards, thread) = await (extensionF, siteF, boardsF, threadF).wait;
    final board = boards.firstWhere((b) => b.id == boardId);
    return ArticlePostWithExtension(
      post: thread as ArticlePost,
      board: board,
      site: site,
      extension: extension,
    );
  }
}

class ArticlePostWithExtension extends ArticlePost {
  final Extension extension;
  final Site site;
  final Board board;

  ArticlePostWithExtension({
    required ArticlePost post,
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
          contents: post.contents,
          tags: post.tags,
          latestRegardingPostCreatedAt: post.latestRegardingPostCreatedAt,
          regardingPostsCount: post.regardingPostsCount,
        );
}
