import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart';

part 'collection_thread_list_cubit.freezed.dart';

@freezed
class CollectionThreadListState with _$CollectionThreadListState {
  const factory CollectionThreadListState({
    @Default([]) List<SingleImagePostWithExtension> threads,
    @Default(false) bool isLoading,
    String? error,
  }) = _CollectionThreadListState;
}

@injectable
class CollectionThreadListCubit extends Cubit<CollectionThreadListState> {
  final ListCollectionThreads _listCollectionThreads;
  final PagingController<int, SingleImagePostWithExtension> pagingController = PagingController(firstPageKey: 0);
  StreamSubscription? _subscription;

  CollectionThreadListCubit(this._listCollectionThreads) : super(const CollectionThreadListState());

  void init(String collectionId) {
    _subscription?.cancel();
    pagingController.value = const PagingState(
      nextPageKey: null,
      itemList: [],
    );

    emit(state.copyWith(isLoading: true, error: null));

    _subscription = _listCollectionThreads(
      collectionId: collectionId,
    ).listen(
      (threads) {
        pagingController.value = PagingState(
          nextPageKey: null,
          itemList: threads,
        );
        emit(state.copyWith(threads: threads, isLoading: false));
      },
      onError: (e) {
        emit(state.copyWith(isLoading: false, error: e.toString()));
        pagingController.error = e;
      },
    );
  }

  void refresh(String collectionId) {
    init(collectionId);
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    pagingController.dispose();
    return super.close();
  }
}
