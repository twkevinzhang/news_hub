import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/interactor/get_collection_board.dart';
import 'package:news_hub/domain/collection/interactor/get_collection.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_board_threads.dart';
import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';

part 'collection_board_thread_list_cubit.freezed.dart';

@freezed
class CollectionBoardThreadListState with _$CollectionBoardThreadListState {
  const factory CollectionBoardThreadListState({
    @Default(null) Collection? collection,
    @Default(null) CollectionBoard? board,
    @Default([]) List<SingleImagePostWithExtension> threads,
    @Default(false) bool isLoading,
    Failure? error,
    @Default(ThreadsFilter(boardSorts: {}, keywords: ''))
    ThreadsFilter activeFilter,
    @Default(false) bool isSearchOverlayVisible,
  }) = _CollectionBoardThreadListState;
}

@injectable
class CollectionBoardThreadListCubit
    extends Cubit<CollectionBoardThreadListState> {
  final GetCollection _getCollection;
  final GetCollectionBoard _getCollectionBoard;
  final ListBoardThreads _listBoardThreads;
  final HomeCubit _homeCubit;
  final PagingController<int, SingleImagePostWithExtension> pagingController =
      PagingController(firstPageKey: 0);

  CollectionBoardThreadListCubit(
    this._getCollection,
    this._getCollectionBoard,
    this._listBoardThreads,
    this._homeCubit,
  ) : super(const CollectionBoardThreadListState());

  Future<void> init({
    required String collectionId,
    required String boardId,
  }) async {
    pagingController.value = const PagingState(nextPageKey: null, itemList: []);
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final results = await Future.wait([
        _getCollection(collectionId),
        _getCollectionBoard(collectionId: collectionId, boardId: boardId),
        _listBoardThreads(
          collectionId: collectionId,
          boardId: boardId,
          filter: state.activeFilter,
        ),
      ]);

      final collectionRes = results[0] as Result<Collection>;
      final boardRes = results[1] as Result<CollectionBoard>;
      final threadsRes =
          results[2] as Result<List<SingleImagePostWithExtension>>;

      if (collectionRes is ResultError<Collection> ||
          boardRes is ResultError<CollectionBoard> ||
          threadsRes is ResultError<List<SingleImagePostWithExtension>>) {
        final error =
            (collectionRes as ResultError<Collection>?)?.error ??
            (boardRes as ResultError<CollectionBoard>?)?.error ??
            (threadsRes as ResultError<List<SingleImagePostWithExtension>>)
                .error;

        emit(state.copyWith(isLoading: false, error: error as Failure?));
        pagingController.error = error;
        return;
      }

      if (collectionRes is ResultCompleted<Collection> &&
          boardRes is ResultCompleted<CollectionBoard> &&
          threadsRes is ResultCompleted<List<SingleImagePostWithExtension>>) {
        final threads = threadsRes.data;
        pagingController.value = PagingState(
          nextPageKey: null,
          itemList: threads,
        );
        emit(
          state.copyWith(
            collection: collectionRes.data,
            board: boardRes.data,
            threads: threads,
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      final failure = Failure.fromError(e);
      emit(state.copyWith(isLoading: false, error: failure));
      pagingController.error = failure;
    }
  }

  void refresh({required String collectionId, required String boardId}) {
    init(collectionId: collectionId, boardId: boardId);
  }

  void toggleSearchMode() {
    final newState = !state.isSearchOverlayVisible;
    emit(state.copyWith(isSearchOverlayVisible: newState));
    _homeCubit.setSearchMode(newState);
  }

  void applyFilter(ThreadsFilter filter) {
    emit(state.copyWith(activeFilter: filter, isSearchOverlayVisible: false));
    _homeCubit.setSearchMode(false);
    // 搜尋現在跳轉到新頁面
  }

  void clearFilter() {
    emit(
      state.copyWith(
        activeFilter: const ThreadsFilter(boardSorts: {}, keywords: ''),
        isSearchOverlayVisible: false,
      ),
    );
    _homeCubit.setSearchMode(false);
    final collectionId = state.collection?.id;
    final boardId = state.board?.identity.boardId;
    if (collectionId != null && boardId != null) {
      refresh(collectionId: collectionId, boardId: boardId);
    }
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
