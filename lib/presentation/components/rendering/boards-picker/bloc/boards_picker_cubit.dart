import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

import 'package:news_hub/domain/models/models.dart';

part 'boards_picker_cubit.freezed.dart';

@freezed
abstract class BoardsPickerState with _$BoardsPickerState {
  const factory BoardsPickerState({
    required Result<List<ExtensionWithBoards>> extensionBoards,
    required Map<String, String> chosenBoards,
    required Map<String, String> submittedChosenBoards,
  }) = _BoardsPickerState;
}

class BoardsPickerResult {
  final Map<String, String> chosenBoards;
  final List<Board> boards;

  BoardsPickerResult({required this.chosenBoards, required this.boards});
}

extension BoardsPickerStateEx on BoardsPickerState {
  Set<String> get chosenBoardIds => chosenBoards.keys.toSet();

  List<Board> get chosenBoardsList => extensionBoards.maybeWhen(
    completed: (extensions) => extensions
        .expand((e) => e.boards)
        .where((b) => chosenBoardIds.contains(b.id))
        .toList(),
    orElse: () => [],
  );
}

@injectable
class BoardsPickerCubit extends Cubit<BoardsPickerState> {
  final ListInstalledExtensions _listExtensions;
  BoardsPickerCubit(ListInstalledExtensions listExtensions)
    : _listExtensions = listExtensions,
      super(
        const BoardsPickerState(
          extensionBoards: Result.initial(),
          chosenBoards: {},
          submittedChosenBoards: {},
        ),
      );

  Future<void> init({Map<String, String>? chosenBoards}) async {
    safeEmit(state.copyWith(extensionBoards: const Result.loading()));
    final extensionsRes = await _listExtensions.withBoards();
    safeEmit(state.copyWith(extensionBoards: extensionsRes));

    if (chosenBoards != null) {
      safeEmit(
        state.copyWith(
          chosenBoards: chosenBoards,
          submittedChosenBoards: chosenBoards,
        ),
      );
    }
  }

  bool? getExtensionCheckboxValue(String extensionPkgName) {
    final boardIds = state.extensionBoards.maybeWhen(
      completed: (data) => data
          .firstOrNullWhere((e) => e.pkgName == extensionPkgName)
          ?.boards
          .map((e) => e.id)
          .toSet(),
      orElse: () => null,
    );
    if (boardIds == null) {
      throw Exception("Extension not found");
    }
    final allChecked = boardIds.every(state.chosenBoardIds.contains);
    final allUnchecked = boardIds.every(
      (e) => !state.chosenBoardIds.contains(e),
    );
    return allChecked
        ? true
        : allUnchecked
        ? false
        : null;
  }

  bool getBoardCheckboxValue(String boardId) {
    return state.chosenBoardIds.contains(boardId);
  }

  void toggleExtension(String extensionPkgName, bool? value) {
    value ??= false;
    final extension = state.extensionBoards.maybeWhen(
      completed: (data) =>
          data.firstWhere((e) => e.pkgName == extensionPkgName),
      orElse: () => null,
    );
    if (extension == null) {
      throw Exception("state.extensionBoards not loaded");
    }
    if (value) {
      final newBoardSorting = extension.boards.map(
        (e) => MapEntry(e.id, e.sortOptions.firstOrNull ?? ''),
      );
      safeEmit(
        state.copyWith(
          chosenBoards: {...state.chosenBoards}..addEntries(newBoardSorting),
        ),
      );
    } else {
      safeEmit(
        state.copyWith(
          chosenBoards: {...state.chosenBoards}
            ..removeWhere(
              (key, value) => extension.boards.any((e) => e.id == key),
            ),
        ),
      );
    }
  }

  void toggleBoard(String boardId, bool? value) {
    if (value == null) return;
    if (value) {
      final board = state.extensionBoards.maybeWhen(
        completed: (data) => data
            .firstWhere((e) => e.boards.any((b) => b.id == boardId))
            .boards
            .firstWhere((e) => e.id == boardId),
        orElse: () => null,
      );
      if (board == null) {
        throw Exception("state.extensionBoards not loaded");
      }
      safeEmit(
        state.copyWith(
          chosenBoards: {...state.chosenBoards}
            ..addAll({boardId: board.sortOptions.firstOrNull ?? ''}),
        ),
      );
    } else {
      safeEmit(
        state.copyWith(chosenBoards: {...state.chosenBoards}..remove(boardId)),
      );
    }
  }

  void setBoardSorting(String boardId, String? sorting) {
    if (sorting == null) return;
    safeEmit(
      state.copyWith(
        chosenBoards: {...state.chosenBoards}..addAll({boardId: sorting}),
      ),
    );
  }

  void reset() {
    safeEmit(state.copyWith(chosenBoards: state.submittedChosenBoards));
  }

  void submit() {
    safeEmit(state.copyWith(submittedChosenBoards: state.chosenBoards));
  }

  bool isSubmitted() {
    return state.chosenBoards == state.submittedChosenBoards;
  }
}
