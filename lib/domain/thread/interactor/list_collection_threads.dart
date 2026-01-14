import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListCollectionThreads {
  final CollectionRepository _collectionRepository;
  final ThreadRepository _repository;

  ListCollectionThreads({
    required ThreadRepository repository,
    required CollectionRepository collectionRepository,
  }) : _repository = repository,
       _collectionRepository = collectionRepository;

  Stream<BoardDataChunk> call({
    required String collectionId,
    Pagination? pagination,
    ThreadsFilter? filter,
  }) async* {
    // 1. 找出 Collection 與對應的 Boards
    final collections = await _collectionRepository.list();
    final collection = collections
        .where((c) => c.id == collectionId)
        .firstOrNull; // Use native Dart 3 method

    if (collection == null || collection.boards.isEmpty) {
      return;
    }

    // 2. 先 Yield 所有 Board 的 Loading 狀態以顯示 Skeleton
    for (final b in collection.boards) {
      yield BoardDataChunk(boardId: b.identity.boardId, isLoading: true);
    }

    // 3. 使用 StreamController 合併多個並行的 Request
    final controller = StreamController<BoardDataChunk>();
    int pendingStreams = collection.boards.length;

    for (final b in collection.boards) {
      // 每個 Board 建立一個自己的非同步任務
      _fetchBoardThreads(b, pagination, filter).listen(
        (chunk) => controller.add(chunk),
        onError: (e) => controller.addError(e),
        onDone: () {
          pendingStreams--;
          if (pendingStreams <= 0) {
            controller.close();
          }
        },
      );
    }

    // 4. 監聽合併後的流，直接將 Chunk 往外送
    yield* controller.stream;
  }

  // 封裝單一 Board 的抓取邏輯，轉化為單次發送的 Stream
  Stream<BoardDataChunk> _fetchBoardThreads(
    CollectionBoard b,
    Pagination? pagination,
    ThreadsFilter? filter,
  ) async* {
    try {
      final rawThreads = await _repository.listThreads(
        extensionPkgName: b.identity.extensionPkgName,
        boardId: b.identity.boardId,
        sort: b.selectedSort, // 使用使用者設定的排序
        pagination: pagination,
        keywords: filter?.keywords,
      );

      final results = rawThreads.map((t) {
        // TODO: 未來需要重構 SingleImagePostWithExtension 使用 CollectionBoard
        final tempBoard = Board(
          extensionPkgName: b.identity.extensionPkgName,
          id: b.identity.boardId,
          name: b.identity.boardName,
          icon: '',
          largeWelcomeImage: '',
          url: '',
          sortOptions: {},
          selectedSort: b.selectedSort,
          collectionId: b.collectionId,
        );
        return SingleImagePostWithExtension(
          post: t as SingleImagePost,
          board: tempBoard,
          extension: Extension(
            pkgName: b.identity.extensionPkgName,
            displayName: '',
            version: 0,
            pythonVersion: 0,
            isNsfw: false,
          ),
        );
      }).toList();

      yield BoardDataChunk(
        boardId: b.identity.boardId,
        threads: results,
        isLoading: false,
      );
    } catch (e) {
      yield BoardDataChunk(
        boardId: b.identity.boardId,
        error: e.toString(),
        isLoading: false,
      );
    }
  }
}
