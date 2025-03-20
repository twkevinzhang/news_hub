import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/domain/thread/interactor/list_regarding_posts.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'thread_detail_cubit.freezed.dart';

@freezed
class ThreadDetailState with _$ThreadDetailState {
  const factory ThreadDetailState({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required Map<String, Result<ArticlePost>> threadMap,
    required Map<String, Result<List<ArticlePost>>> regardingPostsMap,
  }) = _ThreadDetailState;
}

@injectable
class ThreadDetailCubit extends Cubit<ThreadDetailState> {
  final GetThread _getThread;
  final ListRegardingPosts _listRegardingPosts;
  final PagingController<int, ArticlePostWithExtension> pagingController;
  final StreamController<Widget> overlayController;

  static const _pageSize = 10;

  ThreadDetailCubit({
    required GetThread getThread,
    required ListRegardingPosts listRegardingPosts,
  })  : _getThread = getThread,
        _listRegardingPosts = listRegardingPosts,
        pagingController = PagingController(firstPageKey: 1),
        overlayController = StreamController<Widget>.broadcast(),
        super(ThreadDetailState(
          extensionPkgName: '',
          siteId: '',
          boardId: '',
          threadId: '',
          threadMap: {},
          regardingPostsMap: {},
        )) {
    pagingController.addPageRequestListener(_loadPosts);
  }

  void _loadPosts(int pageKey) async {
    final threadF = _getThread.call(
      extensionPkgName: state.extensionPkgName,
      siteId: state.siteId,
      boardId: state.boardId,
      threadId: state.threadId,
    );
    final regardingPostsF = _listRegardingPosts.call(
      extensionPkgName: state.extensionPkgName,
      siteId: state.siteId,
      boardId: state.boardId,
      threadId: state.threadId,
      pagination: Pagination(
        page: pageKey,
        pageSize: _pageSize,
      ),
    );

    try {
      List<ArticlePostWithExtension> newPosts;
      bool isLastPage = false;
      if (pageKey == 1) {
        final (thread, regardingPosts) = await(threadF, regardingPostsF).wait;
        newPosts = [thread, ...regardingPosts];
        isLastPage = regardingPosts.length < _pageSize;
      } else {
        newPosts = await _listRegardingPosts.call(
          extensionPkgName: state.extensionPkgName,
          siteId: state.siteId,
          boardId: state.boardId,
          threadId: state.threadId,
          pagination: Pagination(
            page: pageKey,
            pageSize: _pageSize,
          ),
        );
        isLastPage = newPosts.length < _pageSize;
      }
      final newMap = Map.of(state.threadMap);
      final newMap2 = Map.of(state.regardingPostsMap);
      final allPosts = newMap.completedResults().toList() + newPosts;
      for (final post in allPosts) {
        newMap[post.id] = Result.completed(post);
        if (post.regardingPostsCount.isPositive) {
          newMap2[post.id] = Result.completed(allPosts.filterBy(targetId: post.id).toList());
        }
      }
      safeEmit(state.copyWith(threadMap: newMap));
      safeEmit(state.copyWith(regardingPostsMap: newMap2));
      if (isLastPage) {
        pagingController.appendLastPage(newPosts);
      } else {
        pagingController.appendPage(newPosts, pageKey + 1);
      }
    } on Exception catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
      pagingController.error = e;
    }
  }

  void init({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
  }) {
    safeEmit(ThreadDetailState(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      threadMap: {},
      regardingPostsMap: {},
    ));
  }

  void refresh() {
    pagingController.refresh();
  }
}
