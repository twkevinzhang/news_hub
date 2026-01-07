import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

part 'collection_cubit.freezed.dart';

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState({
    @Default([]) List<Collection> collections,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CollectionState;
}

@injectable
class CollectionCubit extends Cubit<CollectionState> {
  final CollectionRepository _repository;

  CollectionCubit(this._repository) : super(const CollectionState());

  StreamSubscription? _subscription;

  Future<void> load() async {
    emit(state.copyWith(isLoading: true));
    await _subscription?.cancel();
    _subscription = _repository.watchList().listen(
      (collections) {
        emit(state.copyWith(
          collections: collections,
          isLoading: false,
          errorMessage: null,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          isLoading: false,
          errorMessage: error.toString(),
        ));
      },
    );
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Future<void> deleteCollection(String id) async {
    try {
      await _repository.delete(id);
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> reorderCollections(int oldIndex, int newIndex) async {
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final collections = List<Collection>.from(state.collections);
    final item = collections.removeAt(oldIndex);
    collections.insert(newIndex, item);

    // Optimistic update
    emit(state.copyWith(collections: collections));

    try {
      await _repository.reorder(collections.map((e) => e.id).toList());
    } catch (e) {
      // Revert is handled by watchList stream update usually, but we could handle error explicitly
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
