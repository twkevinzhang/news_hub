import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/search/models/models.dart';
import 'package:news_hub/shared/models.dart';

part 'search_cubit.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required int currentStep,
    required Result<List<ExtensionWithBoards>> installedExtensions,
    required ThreadsFilter filter,
    required ThreadsSorting sorting,
  }) = _SearchState;
}

@injectable
class SearchCubit extends Cubit<SearchState> {
  final ListInstalledExtensions _listExtensions;
  final PageController pageController;

  SearchCubit({
    required ListBookmarks listBookmarks,
    required ListInstalledExtensions listExtensions,
  })  : _listExtensions = listExtensions,
        pageController = PageController(),
        super(SearchState(
            currentStep: 0,
            installedExtensions: Result.initial(),
            filter: ThreadsFilter(
              extensionPkgNames: {},
              boardIds: {},
              keywords: null,
            ),
            sorting: ThreadsSorting(
              boardsOrder: [],
              threadsSorting: {},
            )));

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  /// =====
  /// 頁面控制
  /// =====
  void updateStep(int step) {
    emit(state.copyWith(currentStep: step));
  }

  void nextStep() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  /// =====
  /// 啟用擴充功能頁面
  /// =====
  void loadExtensions() {
    _listExtensions.withBoards().then((list) {
      emit(state.copyWith(installedExtensions: ResultCompleted(list)));
    });
  }

  void chooseExtension(Extension extension) {
    final newExtensionPkgNames = state.filter.extensionPkgNames..add(extension.pkgName);
    final newState = state.copyWith.filter(extensionPkgNames: newExtensionPkgNames);
    emit(newState);
  }

  void unChooseExtension(Extension extension) {
    final newExtensionPkgNames = state.filter.extensionPkgNames..remove(extension.pkgName);
    final newState = state.copyWith.filter(extensionPkgNames: newExtensionPkgNames);
    emit(newState);
  }

  void chooseBoard(Board board) {
    final newBoardIds = state.filter.boardIds..add(board.id);
    final newState = state.copyWith.filter(boardIds: newBoardIds);
    emit(newState);
  }

  void unChooseBoard(Board board) {
    final newBoardIds = state.filter.boardIds..remove(board.id);
    final newState = state.copyWith.filter(boardIds: newBoardIds);
    emit(newState);
  }

  /// =====
  /// 貼文排序頁面
  /// =====
  void changeThreadsSorting(String boardId, String sorting) {
    final newThreadsSorting = state.sorting.threadsSorting..addAll({boardId: sorting});
    final newState = state.copyWith.sorting(threadsSorting: newThreadsSorting);
    emit(newState);
  }

  /// =====
  /// 關鍵字頁面
  /// =====
  void changeKeywords(String? keywords) {
    final k = (keywords?.trim().isEmpty ?? true) ? null : keywords?.trim();
    final newState = state.copyWith.filter(keywords: k);
    emit(newState);

  }
}
