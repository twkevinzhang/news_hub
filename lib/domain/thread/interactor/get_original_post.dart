import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class GetOriginalPost {
  final GetInstalledExtension _getInstalledExtension;
  final ThreadRepository _threadRepository;
  final BoardRepository _boardRepository;

  GetOriginalPost({
    required ThreadRepository threadRepository,
    required BoardRepository boardRepository,
    required GetInstalledExtension installedRepository,
  }) : _threadRepository = threadRepository,
       _boardRepository = boardRepository,
       _getInstalledExtension = installedRepository;

  Future<Result<ArticlePostWithExtension>> call({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    try {
      final extensionResF = _getInstalledExtension.get(extensionPkgName);
      final boardsF = _boardRepository.list(extensionPkgName);
      final threadF = _threadRepository.getOriginalPost(
        extensionPkgName: extensionPkgName,
        boardId: boardId,
        threadId: threadId,
        postId: postId,
      );
      final results = await Future.wait([extensionResF, boardsF, threadF]);

      final extensionRes = results[0] as Result<Extension>;
      final boards = results[1] as List<Board>;
      final post = results[2] as Post;

      if (extensionRes is ResultError<Extension>) {
        return Result.error(extensionRes.error);
      }

      final board = boards.firstWhere((b) => b.id == boardId);
      final data = ArticlePostWithExtension(
        post: post as ArticlePost,
        board: board,
        extension: (extensionRes as ResultCompleted<Extension>).data,
      );
      return Result.completed(data);
    } catch (e) {
      return Result.error(Failure.fromError(e));
    }
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
