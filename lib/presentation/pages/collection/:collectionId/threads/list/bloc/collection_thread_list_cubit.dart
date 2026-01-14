import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/interactor/get_collection.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';

part 'collection_thread_list_cubit.freezed.dart';

@freezed
class CollectionThreadListState with _$CollectionThreadListState {
  const factory CollectionThreadListState({
    @Default(null) Collection? collection,
    @Default({}) Map<String, List<SingleImagePostWithExtension>> boardData,
    @Default({}) Set<String> loadingBoardIds,
    String? error,
    @Default(ThreadsFilter(boardSorts: {}, keywords: ''))
    ThreadsFilter activeFilter,
    @Default(false) bool isSearchOverlayVisible,
  }) = _CollectionThreadListState;
}

@injectable
class CollectionThreadListCubit extends Cubit<CollectionThreadListState> {
  final GetCollection _getCollection;
  final ListCollectionThreads _listCollectionThreads;
  final HomeCubit _homeCubit;
  // Change type to dynamic to support Post + Skeleton
  final PagingController<int, dynamic> pagingController = PagingController(
    firstPageKey: 0,
  );
  StreamSubscription? _subscription;

  CollectionThreadListCubit(
    this._getCollection,
    this._listCollectionThreads,
    this._homeCubit,
  ) : super(const CollectionThreadListState());

  Future<void> init(String collectionId) async {
    _subscription?.cancel();
    pagingController.value = const PagingState(nextPageKey: null, itemList: []);

    final collectionRes = await _getCollection(collectionId);

    collectionRes.when(
      completed: (collection) {
        emit(state.copyWith(collection: collection));
        _loadThreads();
      },
      error: (e) {
        emit(state.copyWith(error: e.toString()));
        pagingController.error = e;
      },
      initial: () {},
      loading: () {},
    );
  }

  void _loadThreads() {
    final collectionId = state.collection?.id;
    if (collectionId == null) return;

    _subscription?.cancel();
    // Reset paging controller for new data
    pagingController.value = const PagingState(nextPageKey: null, itemList: []);
    // Reset board data
    emit(state.copyWith(boardData: {}, loadingBoardIds: {}));

    _subscription =
        _listCollectionThreads(
          collectionId: collectionId,
          filter: state.activeFilter,
        ).listen(
          (chunk) {
            _handleChunk(chunk);
          },
          onError: (e) {
            emit(state.copyWith(error: e.toString()));
            pagingController.error = e;
          },
        );
  }

  void toggleSearchMode() {
    final newState = !state.isSearchOverlayVisible;
    emit(state.copyWith(isSearchOverlayVisible: newState));
    _homeCubit.setSearchMode(newState);
  }

  void applyFilter(ThreadsFilter filter) {
    emit(state.copyWith(activeFilter: filter, isSearchOverlayVisible: false));
    _homeCubit.setSearchMode(false);
    // 搜尋現在跳轉到新頁面，這裡不再需要 _loadThreads()
  }

  void clearFilter() {
    emit(
      state.copyWith(
        activeFilter: const ThreadsFilter(boardSorts: {}, keywords: ''),
        isSearchOverlayVisible: false,
      ),
    );
    _homeCubit.setSearchMode(false);
    _loadThreads();
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
