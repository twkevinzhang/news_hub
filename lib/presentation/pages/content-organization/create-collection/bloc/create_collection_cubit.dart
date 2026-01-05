import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/collection_repository.dart';
import 'package:news_hub/domain/models/models.dart';

part 'create_collection_cubit.freezed.dart';

@freezed
class CreateCollectionState with _$CreateCollectionState {
  const factory CreateCollectionState({
    @Default('') String name,
    @Default([]) List<Board> selectedBoards,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    String? errorMessage,
  }) = _CreateCollectionState;
}

@injectable
class CreateCollectionCubit extends Cubit<CreateCollectionState> {
  final CollectionRepository _collectionRepository;

  CreateCollectionCubit(this._collectionRepository) : super(const CreateCollectionState());

  void updateName(String name) {
    emit(state.copyWith(name: name, errorMessage: null));
  }

  void updateSelectedBoards(List<Board> boards) {
    emit(state.copyWith(selectedBoards: boards, errorMessage: null));
  }

  Future<void> submit() async {
    if (state.selectedBoards.isEmpty) {
      emit(state.copyWith(errorMessage: '請至少選擇一個版塊'));
      return;
    }

    emit(state.copyWith(isSaving: true, errorMessage: null));

    try {
      String finalName = state.name.trim();
      if (finalName.isEmpty) {
        final firstBoardName = state.selectedBoards.first.name;
        if (state.selectedBoards.length > 1) {
          finalName = '$firstBoardName...等 (${state.selectedBoards.length})';
        } else {
          finalName = firstBoardName;
        }
      }

      await _collectionRepository.createCollection(finalName, state.selectedBoards);
      emit(state.copyWith(isSaving: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSaving: false, errorMessage: e.toString()));
    }
  }
}
