import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/board/interactor/get_board_sort_options.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

part 'collection_form_cubit.freezed.dart';

@freezed
class CollectionFormState with _$CollectionFormState {
  const factory CollectionFormState({
    @Default('') String name,
    @Default([]) List<Board> selectedBoards,
    @Default({}) Map<String, String> boardSorts, // boardId -> selectedSort
    @Default({}) Map<String, List<String>> boardSortOptions, // boardId -> options
    @Default(false) bool isSaving,
    @Default(false) bool isSuccess,
    String? errorMessage,
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
  final GetBoardSortOptions _getBoardSortOptions;

  CollectionFormCubit(this._collectionRepository, this._getBoardSortOptions) : super(const CollectionFormState());

  void init(Collection? collection) async {
    if (collection != null) {
      // 將 CollectionBoard 轉換為 Board 用於表單編輯
      final boards = collection.boards
          .map((cb) => Board(
                extensionPkgName: cb.identity.extensionPkgName,
                id: cb.identity.boardId,
                name: cb.identity.boardName,
                icon: '',
                largeWelcomeImage: '',
                url: '',
                sortOptions: {},
                selectedSort: cb.selectedSort,
                collectionId: cb.collectionId,
              ))
          .toList();

      final boardSorts = Map<String, String>.fromEntries(
        boards.map((b) => MapEntry(b.id, b.selectedSort ?? '')),
      );
      emit(state.copyWith(
        name: collection.name,
        selectedBoards: boards,
        boardSorts: boardSorts,
        editingCollectionId: collection.id,
      ));

      // Also fetch options to show in dropdown
      if (boards.isNotEmpty) {
        try {
          final options = await _getBoardSortOptions(boards);
          final updatedSorts = _getAutoSelectedSorts(options);
          emit(state.copyWith(
            boardSortOptions: options,
            boardSorts: updatedSorts,
          ));
        } catch (e) {
          // Silent
        }
      }
    }
  }

  void updateName(String name) {
    emit(state.copyWith(name: name, errorMessage: null));
  }

  void updateSelectedBoards(List<Board> boards) async {
    final newBoardSorts = Map<String, String>.from(state.boardSorts);
    // Remove sorts for boards that are no longer selected
    final boardIds = boards.map((e) => e.id).toSet();
    newBoardSorts.removeWhere((key, value) => !boardIds.contains(key));

    emit(state.copyWith(selectedBoards: boards, boardSorts: newBoardSorts, errorMessage: null));

    if (boards.isNotEmpty) {
      try {
        final options = await _getBoardSortOptions(boards);
        final updatedSorts = _getAutoSelectedSorts(options);
        emit(state.copyWith(
          boardSortOptions: options,
          boardSorts: updatedSorts,
        ));
      } catch (e) {
        // Silent error for options
      }
    }
  }

  Map<String, String> _getAutoSelectedSorts(Map<String, List<String>> options) {
    final updatedSorts = Map<String, String>.from(state.boardSorts);

    for (final board in state.selectedBoards) {
      final boardOptions = options[board.id];
      if (boardOptions != null && boardOptions.isNotEmpty) {
        final currentSort = updatedSorts[board.id];
        // If sort is not set or not in valid options, select the first one
        if (currentSort == null || currentSort.isEmpty || !boardOptions.contains(currentSort)) {
          updatedSorts[board.id] = boardOptions.first;
        }
      }
    }

    return updatedSorts;
  }

  void updateBoardSort(String boardId, String sort) {
    final newSorts = Map<String, String>.from(state.boardSorts);
    newSorts[boardId] = sort;
    emit(state.copyWith(boardSorts: newSorts));
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
        // 將 Board 轉換為 CollectionBoard
        final collectionBoards = state.selectedBoards
            .map((b) => CollectionBoard(
                  identity: BoardIdentity(
                    extensionPkgName: b.extensionPkgName,
                    boardId: b.id,
                    boardName: b.name,
                  ),
                  collectionId: state.editingCollectionId!,
                  selectedSort: state.boardSorts[b.id],
                ))
            .toList();

        await _collectionRepository.update(Collection(
          id: state.editingCollectionId!,
          name: finalName,
          boards: collectionBoards,
        ));
      } else {
        // 創建新 Collection：將 Board 轉換為 CollectionBoard
        // 注意：這裡 collectionId 會在 repository 中設定
        final tempCollectionId = 'temp'; // 臨時 ID，實際會被 repository 替換
        final collectionBoards = state.selectedBoards
            .map((b) => CollectionBoard(
                  identity: BoardIdentity(
                    extensionPkgName: b.extensionPkgName,
                    boardId: b.id,
                    boardName: b.name,
                  ),
                  collectionId: tempCollectionId,
                  selectedSort: state.boardSorts[b.id],
                ))
            .toList();

        await _collectionRepository.create(
          finalName,
          collectionBoards,
        );
      }

      emit(state.copyWith(isSaving: false, isSuccess: true));
    } catch (e) {
      emit(state.copyWith(isSaving: false, errorMessage: e.toString()));
    }
  }
}
