import 'package:bloc/bloc.dart';
import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'boards_picker_cubit.freezed.dart';

@freezed
abstract class BoardsPickerState with _$BoardsPickerState {
  const factory BoardsPickerState({
    required Result<List<ExtensionWithBoards>> extensionBoards,
    required Map<String, String> chosenBoardsSorting,
    required Map<String, String> submittedChosenBoardsSorting,
  }) = _BoardsPickerState;
}

extension BoardsPickerStateEx on BoardsPickerState {
  get chosenBoardIds => chosenBoardsSorting.keys.toSet();
}

@injectable
class BoardsPickerCubit extends Cubit<BoardsPickerState> {
  final ListInstalledExtensions _listExtensions;
  BoardsPickerCubit(
    ListInstalledExtensions listExtensions,
  )   : _listExtensions = listExtensions,
        super(
          BoardsPickerState(
            extensionBoards: Result.initial(),
            chosenBoardsSorting: {},
            submittedChosenBoardsSorting: {},
          ),
        );

  Future<void> init({
    Map<String, String>? initialChosenBoardsSorting,
  }) async {
    safeEmit(state.copyWith(
      extensionBoards: Result.loading(),
    ));
    try {
      final extensions = await _listExtensions.withBoards();
      safeEmit(state.copyWith(
        extensionBoards: Result.completed(extensions),
      ));
    } on Exception catch (e) {
      safeEmit(state.copyWith(
        extensionBoards: Result.error(e),
      ));
    }

    if (initialChosenBoardsSorting != null) {
      safeEmit(state.copyWith(
        chosenBoardsSorting: initialChosenBoardsSorting,
        submittedChosenBoardsSorting: initialChosenBoardsSorting,
      ));
    }
  }

  bool? getExtensionCheckboxValue(String extensionPkgName) {
    final boardIds = state.extensionBoards.maybeWhen(completed: (data) => data
        .firstOrNullWhere((e) => e.pkgName == extensionPkgName)
        ?.boards
        .map((e) => e.id)
        .toSet(), orElse: () => null);
    if (boardIds == null) {
      throw Exception("Extension not found");
    }
    final allChecked = boardIds.every(state.chosenBoardIds.contains);
    final allUnchecked = boardIds.every((e) => !state.chosenBoardIds.contains(e));
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
    final extension = state.extensionBoards.maybeWhen(completed: (data) => data
        .firstWhere((e) => e.pkgName == extensionPkgName), orElse: () => null);
    if (extension == null) {
      throw Exception("state.extensionBoards not loaded");
    }
    if (value) {
      final newBoardSorting = extension.boards
          .map((e) => MapEntry(e.id, e.supportedThreadsSorting.first));
      safeEmit(state.copyWith(
        chosenBoardsSorting: { ...state.chosenBoardsSorting }..addEntries(newBoardSorting),
      ));
    } else {
      safeEmit(state.copyWith(
        chosenBoardsSorting: { ...state.chosenBoardsSorting }..removeWhere((key, value) => extension.boards.any((e) => e.id == key)),
      ));
    }
  }

  void toggleBoard(String boardId, bool? value) {
    if (value == null) return;
    if (value) {
      final board = state.extensionBoards.maybeWhen(completed: (data) => data
          .firstWhere((e) => e.boards.any((b) => b.id == boardId))
          .boards
          .firstWhere((e) => e.id == boardId), orElse: () => null);
      if (board == null) {
        throw Exception("state.extensionBoards not loaded");
      }
      safeEmit(state.copyWith(
        chosenBoardsSorting: { ...state.chosenBoardsSorting }..addAll({boardId: board.supportedThreadsSorting.first}),
      ));
    } else {
      safeEmit(state.copyWith(
        chosenBoardsSorting: { ...state.chosenBoardsSorting }..remove(boardId),
      ));
    }
  }

  void setBoardSorting(String boardId, String? sorting) {
    if (sorting == null) return;
    safeEmit(state.copyWith(
      chosenBoardsSorting: { ...state.chosenBoardsSorting }..addAll({boardId: sorting}),
    ));
  }

  void reset() {
    safeEmit(state.copyWith(
      chosenBoardsSorting: state.submittedChosenBoardsSorting,
    ));
  }

  void submit() {
    safeEmit(state.copyWith(
      submittedChosenBoardsSorting: state.chosenBoardsSorting,
    ));
  }

  bool isSubmitted() {
    return state.chosenBoardsSorting == state.submittedChosenBoardsSorting;
  }
}
