import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class GetOriginalPost {
  final GetInstalledExtension _getInstalledExtension;
  final ThreadRepository _threadRepository;
  final BoardRepository _boardRepository;

  GetOriginalPost({
    required ThreadRepository threadRepository,
    required BoardRepository boardRepository,
    required GetInstalledExtension installedRepository,
  })  : _threadRepository = threadRepository,
        _boardRepository = boardRepository,
        _getInstalledExtension = installedRepository;

  Future<ArticlePostWithExtension> call({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    final extensionF = _getInstalledExtension.get(extensionPkgName);
    final boardsF = _boardRepository.list(extensionPkgName);
    final threadF = _threadRepository.getOriginalPost(
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
          latestReplyCreatedAt: post.latestReplyCreatedAt,
          repliesCount: post.repliesCount,
        );
}
