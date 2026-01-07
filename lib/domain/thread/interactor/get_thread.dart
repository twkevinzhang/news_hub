import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class GetThread {
  final GetInstalledExtension _getInstalledExtension;
  final ApiService _service;

  GetThread({
    required ApiService apiService,
    required GetInstalledExtension installedRepository,
  })  : _service = apiService,
        _getInstalledExtension = installedRepository;

  Future<ArticlePostWithExtension> call({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    final extensionF = _getInstalledExtension.get(extensionPkgName);
    final boardsF = _service.listBoards(extensionPkgName: extensionPkgName);
    final threadF = _service.getThread(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
    );
    final (extension, boards, thread) = await (extensionF, boardsF, threadF).wait;
    final board = boards.firstWhere((b) => b.id == boardId);
    return ArticlePostWithExtension(
      post: thread as ArticlePost,
      board: board,
      extension: extension,
    );
  }
}

class ArticlePostWithExtension extends ArticlePost {
  final Extension extension;
  final Board board;

  ArticlePostWithExtension({
    required ArticlePost post,
    required this.extension,
    required this.board,
  }) : super(
          extensionPkgName: post.extensionPkgName,
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
