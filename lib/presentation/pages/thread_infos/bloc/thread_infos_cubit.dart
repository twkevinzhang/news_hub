import 'package:cached_query/cached_query.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_thread_infos.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'thread_infos_cubit.freezed.dart';

final defaultTitle = "預設";

@freezed
class ThreadInfosState with _$ThreadInfosState {
  const factory ThreadInfosState({
    required Map<String, Board> boardsMap,
    required ThreadsFilter filter,
    required ThreadsSorting sorting,
  }) = _ThreadInfosState;
}

@injectable
class ThreadInfosCubit extends Cubit<ThreadInfosState> {
  final ListThreadInfos _listThreadInfos;
  final ListInstalledExtensions _listExtensions;
  late InfiniteQuery<List<SingleImagePostWithExtension>, int> threadInfosQuery;
  final PagingController<int, SingleImagePostWithExtension> pagingController;
  String title = defaultTitle;
  String subtitle = '';

  static const _pageSize = 10;

  ThreadInfosCubit({
    required ListThreadInfos listThreadInfos,
    required ListInstalledExtensions listExtensions,
  })  : _listThreadInfos = listThreadInfos,
        _listExtensions = listExtensions,
        pagingController = PagingController(firstPageKey: 1),
        super(ThreadInfosState(
          boardsMap: {},
          filter: ThreadsFilter(
            boardsSorting: {},
            keywords: '',
          ),
          sorting: ThreadsSorting(
            boardsOrder: [],
          ),
        )) {
    _updateState(state);
    pagingController.addPageRequestListener(_loadThreadInfos);
  }

  void init(ThreadsFilter filter, ThreadsSorting sorting) async {
    final extensions = await _listExtensions.withBoards();
    Map<String, Board> newBoards = {};
    for (final extension in extensions) {
      for (final board in extension.boards) {
        newBoards[board.id] = board;
      }
    }
    _updateState(state.copyWith(filter: filter, sorting: sorting, boardsMap: newBoards));
  }

  void _updateState(ThreadInfosState newState) {
    safeEmit(newState);
    threadInfosQuery = InfiniteQuery<List<SingleImagePostWithExtension>, int>(
      // key: ["threadInfos", newState.filter, newState.sorting], // 會出現無限 loading 畫面，原因未知
      key: ["threadInfos"],
      getNextArg: (state) {
        if (state.lastPage?.isEmpty ?? false) return null;
        return state.length + 1;
      },
      queryFn: (page) => _listThreadInfos.call(
        filter: newState.filter,
        sorting: newState.sorting,
        pagination: Pagination(
          page: page,
          pageSize: _pageSize,
        ),
      ),
    );
    if (newState.filter.isEmpty) {
      title = defaultTitle;
      subtitle = '';
    } else {
      title = _getFilterDescription();
      subtitle = '';
    }
  }

  String _getFilterDescription() {
    final boardsSorting = state.filter.boardsSorting;
    if (boardsSorting.isEmpty) {
      return defaultTitle;
    }
    final boardNames = boardsSorting.entries
        .take(2)
        .map((entry) => '${state.boardsMap[entry.key]?.name}')
        .join(',');
    if (boardsSorting.length <= 2) {
      return '$boardNames搜尋結果：';
    } else {
      return '$boardNames等${boardsSorting.length}個搜尋結果';
    }
  }

  void setBoardsSorting(Map<String, String> boardsSorting) {
    _updateState(state.copyWith.filter(boardsSorting: boardsSorting));
  }

  void setKeywords(String keywords) {
    keywords = keywords.trim();
    _updateState(state.copyWith.filter(keywords: keywords));
  }

  void clearKeywords() {
    setKeywords('');
  }

  void _loadThreadInfos(int pageKey) async {
    print("_loadThreadInfos $pageKey");
    try {
      final queryState = await threadInfosQuery.getNextPage();
      if (queryState?.error != null) {
        throw queryState!.error!;
      }
      final newPage = threadInfosQuery.lastPage;
      if (newPage == null) {
        return;
      }
      if (threadInfosQuery.hasReachedMax()) {
        pagingController.appendLastPage(newPage);
      } else {
        pagingController.appendPage(newPage, threadInfosQuery.state.length + 1);
      }
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
      pagingController.error = e;
    }
  }

  void refresh() {
    threadInfosQuery.refetch();
    pagingController.refresh();
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
