import 'package:cached_query/cached_query.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_thread_list.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'thread_list_cubit.freezed.dart';

final defaultTitle = "預設";

@freezed
class ThreadListState with _$ThreadListState {
  const factory ThreadListState({
    required Map<String, Board> boardsMap,
    required ThreadsFilter filter,
    required ThreadsSorting sorting,
  }) = _ThreadListState;
}

@injectable
class ThreadListCubit extends Cubit<ThreadListState> {
  final GetThreadList _listThreadList;
  final ListInstalledExtensions _listExtensions;
  late InfiniteQuery<List<SingleImagePostWithExtension>, int> threadListQuery;
  final PagingController<int, SingleImagePostWithExtension> pagingController;
  String title = defaultTitle;
  String subtitle = '';

  static const _pageSize = 10;

  ThreadListCubit({
    required GetThreadList listThreadList,
    required ListInstalledExtensions listExtensions,
  })  : _listThreadList = listThreadList,
        _listExtensions = listExtensions,
        pagingController = PagingController(firstPageKey: 1),
        super(ThreadListState(
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
    pagingController.addPageRequestListener(_loadThreadList);
  }

  void init(ThreadsFilter? filter, ThreadsSorting? sorting) async {
    filter ??= ThreadsFilter(boardsSorting: {}, keywords: '');
    sorting ??= ThreadsSorting(boardsOrder: []);
    final extensions = await _listExtensions.withBoards();
    Map<String, Board> newBoards = {};
    for (final extension in extensions) {
      for (final board in extension.boards) {
        newBoards[board.id] = board;
      }
    }
    _updateState(state.copyWith(filter: filter, sorting: sorting, boardsMap: newBoards));
  }

  void _updateState(ThreadListState newState) {
    safeEmit(newState);
    threadListQuery = InfiniteQuery<List<SingleImagePostWithExtension>, int>(
      // key: ["threadList", newState.filter, newState.sorting], // 會出現無限 loading 畫面，原因未知
      key: ["threadList"],
      getNextArg: (state) {
        if (state.lastPage?.isEmpty ?? false) return null;
        return state.length + 1;
      },
      queryFn: (page) => _listThreadList.call(
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
    final boardNames = boardsSorting.entries.take(2).map((entry) => '${state.boardsMap[entry.key]?.name}').join(',');
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

  void _loadThreadList(int pageKey) async {
    print("_loadThreadList $pageKey");
    try {
      final queryState = await threadListQuery.getNextPage();
      if (queryState?.error != null) {
        throw queryState!.error!;
      }
      final newPage = threadListQuery.lastPage;
      if (newPage == null) {
        return;
      }
      if (threadListQuery.hasReachedMax()) {
        pagingController.appendLastPage(newPage);
      } else {
        pagingController.appendPage(newPage, threadListQuery.state.length + 1);
      }
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
      pagingController.error = e;
    }
  }

  void refresh() {
    threadListQuery.refetch();
    pagingController.refresh();
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
