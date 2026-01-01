import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/collection_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

abstract class CollectionEvent {}
class LoadCollections extends CollectionEvent {}

class CollectionState {
  final List<Collection> collections;
  final bool isLoading;

  CollectionState({required this.collections, this.isLoading = false});
}

@injectable
class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  final CollectionRepository _repository;

  CollectionBloc(this._repository) : super(CollectionState(collections: [])) {
    on<LoadCollections>((event, emit) async {
      emit(CollectionState(collections: state.collections, isLoading: true));
      final collections = await _repository.getCollections();
      emit(CollectionState(collections: collections, isLoading: false));
    });
  }
}
