import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/models/models.dart';
import 'package:news_hub/presentation/widgets/molecules/molecules.dart';
import 'package:news_hub/shared/models.dart';

part 'thread_infos_cubit.freezed.dart';

@freezed
class ThreadInfosState with _$ThreadInfosState {
  const factory ThreadInfosState({
    ThreadsFilter? filter,
    ThreadsSorting? sorting,
  }) = _ThreadInfosState;
}

extension ThreadInfosStateEx on ThreadInfosState {
  int filteredBoardsCount() {
    return filter?.boardIds?.length ?? 0;
  }
}

@injectable
class ThreadInfosCubit extends Cubit<ThreadInfosState> {
  final ListThreadInfos _listThreadInfos;
  final PagingController<int, ThreadWithExtension> pagingController;

  static const _pageSize = 10;

  ThreadInfosCubit({
    required ListThreadInfos listThreadInfos,
  })  : _listThreadInfos = listThreadInfos,
        pagingController = PagingController(firstPageKey: 1),
        super(ThreadInfosState(
          filter: null,
          sorting: null,
        )) {
    pagingController.addPageRequestListener(_loadThreadInfos);
  }

  /// 如果傳入 null, 則表示不過濾
  void setExtensionPkgNamesInFilter({
    Set<String>? extensionPkgNames,
  }) {
    if (state.filter == null) {
      emit(state.copyWith(
        filter: ThreadsFilter(
          extensionPkgNames: extensionPkgNames,
          boardIds: null,
          keywords: null,
        ),
      ));
    } else {
      emit(state.copyWith.filter!.call(extensionPkgNames: extensionPkgNames));
    }
  }

  /// 如果傳入 null, 則表示不過濾
  void setBoardIdsInFilter({
    Set<String>? boardIds,
  }) {
    if (state.filter == null) {
      emit(state.copyWith(
        filter: ThreadsFilter(
          extensionPkgNames: null,
          boardIds: boardIds,
          keywords: null,
        ),
      ));
    } else {
      emit(state.copyWith.filter!.call(boardIds: boardIds));
    }
  }

  /// 如果傳入 null, 則表示不過濾
  void setKeywordsInFilter({
    String? keywords,
  }) {
    if (state.filter == null) {
      emit(state.copyWith(
        filter: ThreadsFilter(
          extensionPkgNames: null,
          boardIds: null,
          keywords: keywords,
        ),
      ));
    } else {
      emit(state.copyWith.filter!.call(keywords: keywords));
    }
  }

  set sorting(ThreadsSorting? sorting) {
    emit(state.copyWith(sorting: sorting));
  }

  void init() {
    _loadThreadInfos(1);
  }

  void refresh() {
    pagingController.refresh();
  }

  void _loadThreadInfos(int pageKey) async {
    try {
      final result = await _listThreadInfos.call(
        filter: state.filter,
        sorting: state.sorting,
        pagination: Pagination(
          page: pageKey,
          pageSize: _pageSize,
        ),
      );

      final isLastPage = result.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(result);
      } else {
        final nextPageKey = pageKey + result.length;
        pagingController.appendPage(result, nextPageKey);
      }
    } catch (e) {
      pagingController.error = e;
      if (kDebugMode) rethrow;
    }
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
