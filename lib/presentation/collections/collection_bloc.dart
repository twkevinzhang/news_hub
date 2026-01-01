import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/extension/collection_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

part 'collection_bloc.freezed.dart';

@freezed
class CollectionEvent with _$CollectionEvent {
  const factory CollectionEvent.load() = LoadCollections;
}

@freezed
class CollectionState with _$CollectionState {
  const factory CollectionState({
    @Default([]) List<Collection> collections,
    @Default(false) bool isLoading,
    String? errorMessage,
  }) = _CollectionState;
}

@injectable
class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository _repository;

  CollectionBloc(this._repository) : super(const CollectionState()) {
    on<LoadCollections>((event, emit) async {
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
