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
import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';

part 'thread_detail_cubit.freezed.dart';

@freezed
class ThreadDetailState with _$ThreadDetailState {
  const factory ThreadDetailState({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required Map<String, Result<ArticlePostWithExtension>> threadMap,
    required Map<String, Result<List<ArticlePostWithExtension>>> repliesMap,
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
  }) : _getOriginalPost = getOriginalPost,
       _listReplies = listReplies,
       _listComments = listComments,
       pagingController = PagingController(firstPageKey: 1),
       overlayController = StreamController<Widget>.broadcast(),
       super(
         const ThreadDetailState(
           extensionPkgName: '',
           boardId: '',
           threadId: '',
           threadMap: {},
           repliesMap: {},
         ),
       ) {
    pagingController.addPageRequestListener(_loadPosts);
  }

  void _loadPosts(int pageKey) async {
    final threadResF = _getOriginalPost.call(
      extensionPkgName: state.extensionPkgName,
      boardId: state.boardId,
      threadId: state.threadId,
    );
    final repliesResF = _listReplies.call(
      extensionPkgName: state.extensionPkgName,
      boardId: state.boardId,
      threadId: state.threadId,
      parentId: null,
      pagination: Pagination(page: pageKey, pageSize: _pageSize),
    );

    try {
      if (pageKey == 1) {
        final results = await Future.wait([threadResF, repliesResF]);
        final threadRes = results[0] as Result<ArticlePostWithExtension>;
        final repliesRes = results[1] as Result<List<ArticlePostWithExtension>>;

        if (threadRes is ResultError<ArticlePostWithExtension>) {
          pagingController.error = threadRes.error;
          return;
        }
        if (repliesRes is ResultError<List<ArticlePostWithExtension>>) {
          pagingController.error = repliesRes.error;
          return;
        }

        final thread =
            (threadRes as ResultCompleted<ArticlePostWithExtension>).data;
        final replies =
            (repliesRes as ResultCompleted<List<ArticlePostWithExtension>>)
                .data;

        final newPosts = [thread, ...replies];
        final isLastPage = replies.length < _pageSize;

        final newMap = Map.of(state.threadMap);
        final newMap2 = Map.of(state.repliesMap);

        for (final post in newPosts) {
          newMap[post.id] = Result.completed(post);
        }

        safeEmit(state.copyWith(threadMap: newMap, repliesMap: newMap2));
        if (isLastPage) {
          pagingController.appendLastPage(newPosts);
        } else {
          pagingController.appendPage(newPosts, pageKey + 1);
        }
      } else {
        final repliesRes = await _listReplies.call(
          extensionPkgName: state.extensionPkgName,
          boardId: state.boardId,
          threadId: state.threadId,
          parentId: null,
          pagination: Pagination(page: pageKey, pageSize: _pageSize),
        );

        repliesRes.when(
          completed: (replies) {
            final isLastPage = replies.length < _pageSize;
            final newMap = Map.of(state.threadMap);
            for (final post in replies) {
              newMap[post.id] = Result.completed(post);
            }
            safeEmit(state.copyWith(threadMap: newMap));
            if (isLastPage) {
              pagingController.appendLastPage(replies);
            } else {
              pagingController.appendPage(replies, pageKey + 1);
            }
          },
          error: (e) {
            pagingController.error = e;
          },
          initial: () {},
          loading: () {},
        );
      }
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
      pagingController.error = Failure.fromError(e);
    }
  }

  void loadComments(String postId) async {
    final isLoading =
        state.commentsMap[postId]?.maybeWhen(
          loading: () => true,
          orElse: () => false,
        ) ??
        false;
    if (isLoading) return;

    final newCommentsMap = Map.of(state.commentsMap);
    newCommentsMap[postId] = const Result.loading();
    safeEmit(state.copyWith(commentsMap: newCommentsMap));

    final commentsRes = await _listComments.call(
      extensionPkgName: state.extensionPkgName,
      boardId: state.boardId,
      threadId: state.threadId,
      postId: postId,
      pagination: const Pagination(page: 1, pageSize: 50),
    );

    commentsRes.when(
      completed: (comments) {
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
            final updatedPost = post.copyWith(
              post: post.post.copyWith(top5Comments: comments.take(5).toList()),
            );
            final updatedThreadMap = Map.of(state.threadMap);
            updatedThreadMap[postId] = Result.completed(updatedPost);
            safeEmit(state.copyWith(threadMap: updatedThreadMap));
          }
        }
      },
      error: (e) {
        debugPrint('Error loading comments: $e');
        final errorCommentsMap = Map.of(state.commentsMap);
        errorCommentsMap[postId] = Result.error(e);
        safeEmit(state.copyWith(commentsMap: errorCommentsMap));
      },
      initial: () {},
      loading: () {},
    );
  }

  void loadReplies(String postId) async {
    final isLoadingOrCompleted =
        state.repliesMap[postId]?.maybeWhen(
          loading: () => true,
          completed: (_) => true,
          orElse: () => false,
        ) ??
        false;
    if (isLoadingOrCompleted) return;

    final newRepliesMap = Map.of(state.repliesMap);
    newRepliesMap[postId] = const Result.loading();
    safeEmit(state.copyWith(repliesMap: newRepliesMap));

    final repliesRes = await _listReplies.call(
      extensionPkgName: state.extensionPkgName,
      boardId: state.boardId,
      threadId: state.threadId,
      parentId: postId,
      pagination: const Pagination(page: 1, pageSize: 50),
    );

    repliesRes.when(
      completed: (replies) {
        final updatedRepliesMap = Map.of(state.repliesMap);
        updatedRepliesMap[postId] = Result.completed(replies);
        safeEmit(state.copyWith(repliesMap: updatedRepliesMap));
      },
      error: (e) {
        debugPrint('Error loading replies: $e');
        final errorRepliesMap = Map.of(state.repliesMap);
        errorRepliesMap[postId] = Result.error(e);
        safeEmit(state.copyWith(repliesMap: errorRepliesMap));
      },
      initial: () {},
      loading: () {},
    );
  }

  void init({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
  }) {
    safeEmit(
      ThreadDetailState(
        extensionPkgName: extensionPkgName,
        boardId: boardId,
        threadId: threadId,
        threadMap: {},
        repliesMap: {},
      ),
    );
  }

  void refresh() {
    pagingController.refresh();
  }

  void safeEmit(ThreadDetailState state) {
    if (!isClosed) emit(state);
  }
}
