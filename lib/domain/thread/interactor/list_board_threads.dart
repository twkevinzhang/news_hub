import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListBoardThreads {
  final BoardRepository _boardRepository;
  final ThreadRepository _repository;

  ListBoardThreads({
    required ThreadRepository repository,
    required BoardRepository boardRepository,
  }) : _repository = repository,
       _boardRepository = boardRepository;

  Future<Result<List<SingleImagePostWithExtension>>> call({
    Pagination? pagination,
    ThreadsFilter? filter,
    required String collectionId,
    required String boardId,
  }) async {
    try {
      // 1. 找出 boardId 的 extensionPkgName 以及使用者設定的排序
      final board = await _boardRepository.getBoard(
        boardId: boardId,
        collectionId: collectionId,
      );

      // 2. 呼叫 ThreadRepository.listThreads 並傳入排序，得到 board 的 threads
      final posts = await _repository.listThreads(
        extensionPkgName: board.extensionPkgName,
        boardId: board.id,
        sort: board.selectedSort,
        pagination: pagination,
        keywords: filter?.keywords,
      );

      final data = posts
          .map(
            (t) => SingleImagePostWithExtension(
              post: t as SingleImagePost,
              board: board,
              extension: Extension(
                pkgName: board.extensionPkgName,
                displayName: '',
                version: 0,
                pythonVersion: 0,
                isNsfw: false,
              ),
            ),
          )
          .toList();
      return Result.completed(data);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
