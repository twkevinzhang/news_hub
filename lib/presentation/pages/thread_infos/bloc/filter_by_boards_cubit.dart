import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/extension/models/models.dart';
import 'package:news_hub/shared/models.dart';

part 'filter_by_boards_cubit.freezed.dart';

@freezed
class FilterByBoardsState with _$FilterByBoardsState {
  const factory FilterByBoardsState({
    required Result<List<ExtensionWithBoards>> installedExtensions,
    required Set<String> extensionPkgNames,
    required Set<String> boardIds,
  }) = _FilterByBoardsState;
}

@injectable
class FilterByBoardsCubit extends Cubit<FilterByBoardsState> {
  final ListInstalledExtensions listInstalledExtensions;
  FilterByBoardsCubit(
    this.listInstalledExtensions,
  ) : super(
          FilterByBoardsState(
            installedExtensions: ResultInitial(),
            extensionPkgNames: {},
            boardIds: {},
          ),
        );

  get filter => ThreadsFilter(
        extensionPkgNames: state.extensionPkgNames,
        boardIds: state.boardIds,
        keywords: null,
      );

  void init() {
    _fetchExtensions();
  }

  void _fetchExtensions() async {
    emit(state.copyWith(installedExtensions: ResultLoading()));
    final result = await listInstalledExtensions.withBoards();
    emit(state.copyWith(installedExtensions: ResultCompleted(result)));
  }

  void chooseExtension(Extension extension) {
    final newExtensionPkgNames = Set.of(state.extensionPkgNames)..add(extension.pkgName);
    final newState = state.copyWith(extensionPkgNames: newExtensionPkgNames);
    emit(newState);
  }

  void unChooseExtension(Extension extension) {
    final newExtensionPkgNames = Set.of(state.extensionPkgNames)..remove(extension.pkgName);
    final newState = state.copyWith(extensionPkgNames: newExtensionPkgNames);
    emit(newState);
  }

  void chooseBoard(Board board) {
    final newBoardIds = Set.of(state.boardIds)..add(board.id);
    final newState = state.copyWith(boardIds: newBoardIds);
    emit(newState);
  }

  void unChooseBoard(Board board) {
    final newBoardIds = Set.of(state.boardIds)..remove(board.id);
    final newState = state.copyWith(boardIds: newBoardIds);
    emit(newState);
  }
}
