import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';
import 'package:news_hub/domain/thread/interactor/list_comments.dart';
import 'package:news_hub/domain/thread/interactor/list_replies.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'thread_detail_cubit.freezed.dart';

@freezed
class ThreadDetailState with _$ThreadDetailState {
  const factory ThreadDetailState({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required Map<String, Result<ArticlePost>> threadMap,
    required Map<String, Result<List<ArticlePost>>> repliesMap,
    @Default({}) Map<String, Result<List<Comment>>> commentsMap,
  }) = _ThreadDetailState;
}

@injectable
class ThreadDetailCubit extends Cubit<ThreadDetailState> {
  final GetOriginalPost _getOriginalPost;
  final ListReplies _listReplies;
  final ListComments _listComments;
  final PagingController<int, ArticlePostWithExtension> pagingController;
  final StreamController<Widget> overlayController;

  static const _pageSize = 10;

  ThreadDetailCubit({
    required GetOriginalPost getOriginalPost,
    required ListReplies listReplies,
    required ListComments listComments,
  })  : _getOriginalPost = getOriginalPost,
        _listReplies = listReplies,
        _listComments = listComments,
        pagingController = PagingController(firstPageKey: 1),
        overlayController = StreamController<Widget>.broadcast(),
        super(ThreadDetailState(
          extensionPkgName: '',
          boardId: '',
          threadId: '',
          threadMap: {},
          repliesMap: {},
        )) {
    pagingController.addPageRequestListener(_loadPosts);
  }

  void _loadPosts(int pageKey) async {
    final threadF = _getOriginalPost.call(
      extensionPkgName: state.extensionPkgName,
      boardId: state.boardId,
      threadId: state.threadId,
    );
    final repliesF = _listReplies.call(
      extensionPkgName: state.extensionPkgName,
      boardId: state.boardId,
      threadId: state.threadId,
      parentId: null,
      pagination: Pagination(
        page: pageKey,
        pageSize: _pageSize,
      ),
    );

    try {
      List<ArticlePostWithExtension> newPosts;
      bool isLastPage = false;
      if (pageKey == 1) {
        final (thread, replies) = await (threadF, repliesF).wait;
        newPosts = [thread, ...replies];
        isLastPage = replies.length < _pageSize;
      } else {
        newPosts = await _listReplies.call(
          extensionPkgName: state.extensionPkgName,
          boardId: state.boardId,
          threadId: state.threadId,
          parentId: null,
          pagination: Pagination(
            page: pageKey,
            pageSize: _pageSize,
          ),
        );
        isLastPage = newPosts.length < _pageSize;
      }
      final newMap = Map.of(state.threadMap);
      final newMap2 = Map.of(state.repliesMap);
      final allPosts = newMap.completedResults().toList() + newPosts;
      for (final post in allPosts) {
        newMap[post.id] = Result.completed(post);
        if ((post.repliesCount ?? 0) > 0) {
          newMap2[post.id] = Result.completed(allPosts.filterBy(targetId: post.id).toList());
        }
      }
      safeEmit(state.copyWith(threadMap: newMap, repliesMap: newMap2));
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

  void loadComments(String postId) async {
    final isLoading = state.commentsMap[postId]?.maybeWhen(
          loading: () => true,
          orElse: () => false,
        ) ??
        false;
    if (isLoading) return;

    final newCommentsMap = Map.of(state.commentsMap);
    newCommentsMap[postId] = const Result.loading();
    safeEmit(state.copyWith(commentsMap: newCommentsMap));

    try {
      final comments = await _listComments.call(
        extensionPkgName: state.extensionPkgName,
        boardId: state.boardId,
        threadId: state.threadId,
        postId: postId,
        pagination: const Pagination(page: 1, pageSize: 50),
      );

      final updatedCommentsMap = Map.of(state.commentsMap);
      updatedCommentsMap[postId] = Result.completed(comments);
      safeEmit(state.copyWith(commentsMap: updatedCommentsMap));

      // Also update the post in threadMap if it exists
      if (state.threadMap.containsKey(postId)) {
        final post = state.threadMap[postId]!.maybeWhen(
          completed: (data) => data,
          orElse: () => null,
        );
        if (post != null) {
          final updatedPost = post.copyWith(top5Comments: comments.take(5).toList());
          final updatedThreadMap = Map.of(state.threadMap);
          updatedThreadMap[postId] = Result.completed(updatedPost);
          safeEmit(state.copyWith(threadMap: updatedThreadMap));
        }
      }
    } on Exception catch (e) {
      debugPrint('Error loading comments: $e');
      final errorCommentsMap = Map.of(state.commentsMap);
      errorCommentsMap[postId] = Result.error(e);
      safeEmit(state.copyWith(commentsMap: errorCommentsMap));
    }
  }

  void init({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
  }) {
    safeEmit(ThreadDetailState(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      threadMap: {},
      repliesMap: {},
    ));
  }

  void refresh() {
    pagingController.refresh();
  }
}
