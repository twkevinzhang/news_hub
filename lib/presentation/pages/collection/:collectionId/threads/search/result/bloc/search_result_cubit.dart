import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart';

part 'search_result_cubit.freezed.dart';

@freezed
class SearchResultState with _$SearchResultState {
  const factory SearchResultState({
    required String collectionId,
    required ThreadsFilter filter,
    @Default(false) bool isLoading,
    String? error,
  }) = _SearchResultState;
}

@injectable
class SearchResultCubit extends Cubit<SearchResultState> {
  final ListCollectionThreads _listCollectionThreads;
  final PagingController<int, SingleImagePostWithExtension> pagingController =
      PagingController(firstPageKey: 0);
  StreamSubscription? _subscription;

  SearchResultCubit(this._listCollectionThreads)
    : super(
        const SearchResultState(
          collectionId: '',
          filter: ThreadsFilter(boardSorts: {}, keywords: ''),
        ),
      );

  void init(String collectionId, ThreadsFilter filter) {
    emit(state.copyWith(collectionId: collectionId, filter: filter));
    _loadResults();
  }

  void _loadResults() {
    _subscription?.cancel();
    pagingController.value = const PagingState(nextPageKey: null, itemList: []);
    emit(state.copyWith(isLoading: true, error: null));

    _subscription =
        _listCollectionThreads(
          collectionId: state.collectionId,
          filter: state.filter,
        ).listen(
          (chunk) {
            final currentItems = pagingController.itemList ?? [];
            pagingController.value = PagingState(
              nextPageKey: null,
              itemList: [...currentItems, ...chunk.threads],
            );
            // chunk.isLoading can be used if we want to show global loading till all boards done
          },
          onDone: () {
            emit(state.copyWith(isLoading: false));
          },
          onError: (e) {
            emit(state.copyWith(isLoading: false, error: e.toString()));
            pagingController.error = e;
          },
        );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    pagingController.dispose();
    return super.close();
  }
}
