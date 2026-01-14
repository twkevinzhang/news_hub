import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/interactor/get_collection.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart';

part 'collection_thread_list_cubit.freezed.dart';

@freezed
class CollectionThreadListState with _$CollectionThreadListState {
  const factory CollectionThreadListState({
    @Default(null) Collection? collection,
    @Default({}) Map<String, List<SingleImagePostWithExtension>> boardData,
    @Default({}) Set<String> loadingBoardIds,
    String? error,
  }) = _CollectionThreadListState;
}

@injectable
class CollectionThreadListCubit extends Cubit<CollectionThreadListState> {
  final GetCollection _getCollection;
  final ListCollectionThreads _listCollectionThreads;
  // Change type to dynamic to support Post + Skeleton
  final PagingController<int, dynamic> pagingController = PagingController(
    firstPageKey: 0,
  );
  StreamSubscription? _subscription;

  CollectionThreadListCubit(this._getCollection, this._listCollectionThreads)
    : super(const CollectionThreadListState());

  Future<void> init(String collectionId) async {
    _subscription?.cancel();
    pagingController.value = const PagingState(nextPageKey: null, itemList: []);

    final collectionRes = await _getCollection(collectionId);

    collectionRes.when(
      completed: (collection) {
        emit(state.copyWith(collection: collection));

        // 2. Start streaming chunks
        _subscription = _listCollectionThreads(collectionId: collectionId)
            .listen(
              (chunk) {
                _handleChunk(chunk);
              },
              onError: (e) {
                emit(state.copyWith(error: e.toString()));
                pagingController.error = e;
              },
            );
      },
      error: (e) {
        emit(state.copyWith(error: e.toString()));
        pagingController.error = e;
      },
      initial: () {},
      loading: () {},
    );
  }

  void _handleChunk(BoardDataChunk chunk) {
    // Update loading status for this board
    final newLoadingIds = Set<String>.from(state.loadingBoardIds);
    if (chunk.isLoading) {
      newLoadingIds.add(chunk.boardId);
    } else {
      newLoadingIds.remove(chunk.boardId);
    }

    // Update data for this board if available
    final newBoardData = Map<String, List<SingleImagePostWithExtension>>.from(
      state.boardData,
    );
    if (chunk.threads.isNotEmpty) {
      newBoardData[chunk.boardId] = chunk.threads;
    }

    emit(
      state.copyWith(loadingBoardIds: newLoadingIds, boardData: newBoardData),
    );

    _updateList();
  }

  void _updateList() {
    final collection = state.collection;
    if (collection == null) return;

    final flatList = <dynamic>[];

    for (final board in collection.boards) {
      final boardId = board.identity.boardId;
      final threads = state.boardData[boardId];
      final isAnyLoading = state.loadingBoardIds.contains(boardId);

      if (threads != null && threads.isNotEmpty) {
        flatList.addAll(threads);
      } else if (isAnyLoading) {
        // Show N skeletons for loading board
        flatList.addAll(
          List.generate(3, (_) => CollectionBoardSkeleton(boardId)),
        );
      }
    }

    pagingController.value = PagingState(nextPageKey: null, itemList: flatList);
  }

  void refresh(String collectionId) {
    // Clear data
    emit(state.copyWith(boardData: {}, loadingBoardIds: {}));
    init(collectionId);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    pagingController.dispose();
    return super.close();
  }
}

class CollectionBoardSkeleton {
  final String boardId;
  const CollectionBoardSkeleton(this.boardId);
}
