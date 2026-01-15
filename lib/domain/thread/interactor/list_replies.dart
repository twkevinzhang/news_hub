import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';

import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListReplies {
  final GetInstalledExtension _getInstalledExtension;
  final ThreadRepository _threadRepository;
  final BoardRepository _boardRepository;

  ListReplies({
    required ThreadRepository threadRepository,
    required BoardRepository boardRepository,
    required GetInstalledExtension installedRepository,
  }) : _threadRepository = threadRepository,
       _boardRepository = boardRepository,
       _getInstalledExtension = installedRepository;

  Future<Result<List<ArticlePostWithExtension>>> call({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? parentId,
    Pagination? pagination,
  }) async {
    try {
      final extensionResF = _getInstalledExtension.get(extensionPkgName);
      final boardsF = _boardRepository.list(extensionPkgName);
      final repliesF = _threadRepository.listReplies(
        extensionPkgName: extensionPkgName,
        boardId: boardId,
        threadId: threadId,
        parentId: parentId,
        pagination: pagination,
      );
      final results = await Future.wait([extensionResF, boardsF, repliesF]);

      final extensionRes = results[0] as Result<Extension>;
      final boards = results[1] as List<Board>;
      final replies = results[2] as List<Post>;

      if (extensionRes is ResultError<Extension>) {
        return Result.error(extensionRes.error);
      }

      final extension = (extensionRes as ResultCompleted<Extension>).data;
      final board = boards.firstWhere((b) => b.id == boardId);

      final data = replies
          .map(
            (p) => ArticlePostWithExtension(
              post: p as ArticlePost,
              board: board,
              extension: extension,
            ),
          )
          .toList();
      return Result.completed(data);
    } catch (e) {
      return Result.error(Failure.fromError(e));
    }
  }
}
