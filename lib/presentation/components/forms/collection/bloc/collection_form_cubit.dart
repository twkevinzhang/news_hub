import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

part 'collection_form_cubit.freezed.dart';

@freezed
class CollectionFormState with _$CollectionFormState {
  const factory CollectionFormState({
    @Default('') String name,
    @Default([]) List<Board> selectedBoards,
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    String? errorMessage,
    // Add validation checks or existing ID
    String? editingCollectionId,
  }) = _CollectionFormState;
}

extension CollectionFormStateEx on CollectionFormState {
  String get defaultName {
    if (selectedBoards.isEmpty) return '';
    final firstBoardName = selectedBoards.first.name;
    if (selectedBoards.length > 1) {
      return '$firstBoardName...等${selectedBoards.length}個';
    } else {
      return firstBoardName;
    }
  }

  bool get isEditing => editingCollectionId != null;
}

@injectable
class CollectionFormCubit extends Cubit<CollectionFormState> {
  final CollectionRepository _collectionRepository;

  CollectionFormCubit(this._collectionRepository) : super(const CollectionFormState());

  void init(Collection? collection) {
    if (collection != null) {
      emit(state.copyWith(
        name: collection.name,
        selectedBoards: collection.boards,
        editingCollectionId: collection.id,
      ));
    }
  }

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
        finalName = state.defaultName;
      }

      if (state.isEditing) {
        await _collectionRepository.update(Collection(
          id: state.editingCollectionId!,
          name: finalName,
          boards: state.selectedBoards,
        ));
      } else {
        await _collectionRepository.create(finalName, state.selectedBoards);
      }

      emit(state.copyWith(isSaving: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSaving: false, errorMessage: e.toString()));
    }
  }
}
