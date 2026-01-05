import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/collection/collection_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

part 'collection_list_bloc.freezed.dart';

@freezed
class CollectionListEvent with _$CollectionListEvent {
  const factory CollectionListEvent.load() = LoadCollectionList;
}

@freezed
class CollectionListState with _$CollectionListState {
  const factory CollectionListState({
    @Default([]) List<Collection> collections,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CollectionListState;
}

@injectable
class CollectionListBloc extends Bloc<CollectionListEvent, CollectionListState> {
  final CollectionRepository _repository;

  CollectionListBloc(this._repository) : super(const CollectionListState()) {
    on<LoadCollectionList>((event, emit) async {
      emit(state.copyWith(isLoading: true));
      try {
        final collections = await _repository.getCollections();
        emit(state.copyWith(collections: collections, isLoading: false));
      } catch (e) {
        emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
      }
    });
  }
}
