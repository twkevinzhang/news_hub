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
  })  : _repository = repository,
        _boardRepository = boardRepository;

  Future<List<SingleImagePostWithExtension>> call({
    Pagination? pagination,
    ThreadsFilter? filter,
    required String collectionId,
    required String boardId,
  }) async {
    // 1. 找出 boardId 的 extensionPkgName 以及使用者設定的排序
    final board = await _boardRepository.getBoard(boardId: boardId, collectionId: collectionId);

    // 2. 呼叫 ThreadRepository.listThreads 並傳入排序，得到 board 的 threads
    final posts = await _repository.listThreads(
      extensionPkgName: board.extensionPkgName,
      boardId: board.id,
      sort: board.selectedSort,
      pagination: pagination,
      keywords: filter?.keywords,
    );

    return posts
        .map((t) => SingleImagePostWithExtension(
              post: t as SingleImagePost,
              board: board,
              // 注意：這裡假設 Extension 資訊在後續 UI 需要時可以再透過其他方式取得，
              // 或者我們需要調整 SingleImagePostWithExtension 的定義。
              // 但根據需求，主要是傳入排序並得到 threads。
              extension: Extension(
                pkgName: board.extensionPkgName,
                displayName: '', // 暫時留空，或視需要從 ExtensionRepository 取得
                version: 0,
                pythonVersion: 0,
                isNsfw: false,
              ),
            ))
        .toList();
  }
}
