import 'dart:async';
import 'package:collection/collection.dart';
import 'package:async/async.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListCollectionThreads {
  final CollectionRepository _collectionRepository;
  final ThreadRepository _repository;

  ListCollectionThreads({
    required ThreadRepository repository,
    required CollectionRepository collectionRepository,
  })  : _repository = repository,
        _collectionRepository = collectionRepository;

  Stream<BoardDataChunk> call({
    required String collectionId,
    Pagination? pagination,
    ThreadsFilter? filter,
  }) async* {
    // 1. 找出 Collection 與對應的 Boards
    final collections = await _collectionRepository.list();
    final collection = collections.firstWhereOrNull((c) => c.id == collectionId);

    if (collection == null || collection.boards.isEmpty) {
      return;
    }

    // 2. 先 Yield 所有 Board 的 Loading 狀態以顯示 Skeleton
    for (final b in collection.boards) {
      yield BoardDataChunk(
        boardId: b.identity.boardId,
        isLoading: true,
      );
    }

    // 3. 使用 StreamGroup 合併多個並行的 Request
    final group = StreamGroup<BoardDataChunk>();

    for (final b in collection.boards) {
      // 每個 Board 建立一個自己的非同步任務
      final boardStream = _fetchBoardThreads(b, pagination, filter);
      group.add(boardStream);
    }

    // 關閉 group 表示不再有新的 Stream 加入
    unawaited(group.close());

    // 4. 監聽合併後的流，直接將 Chunk 往外送
    yield* group.stream;
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

class BoardDataChunk {
  final String boardId;
  final List<SingleImagePostWithExtension> threads;
  final bool isLoading;
  final String? error;

  const BoardDataChunk({
    required this.boardId,
    this.threads = const [],
    this.isLoading = false,
    this.error,
  });
}
