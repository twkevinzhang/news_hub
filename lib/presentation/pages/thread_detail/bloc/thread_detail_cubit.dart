import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
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
    required Map<String, Result<Post>> threadMap,
    required Map<String, Result<List<Post>>> regardingPostsMap,
  }) = _ThreadDetailState;
}

@injectable
class ThreadDetailCubit extends Cubit<ThreadDetailState> {
  final GetThread _getThread;
  final PagingController<int, PostWithExtension> pagingController;

  static const _pageSize = 10;

  ThreadDetailCubit({
    required GetThread getThread,
  })  : _getThread = getThread,
        pagingController = PagingController(firstPageKey: 1),
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
      id: state.threadId,
    );
    final regardingPostsF = _getThread.listRegardingPosts(
      extensionPkgName: state.extensionPkgName,
      siteId: state.siteId,
      boardId: state.boardId,
      threadId: state.threadId,
    );

    try {
      List<PostWithExtension> posts;
      bool isLastPage = false;
      if (pageKey == 1) {
        final (thread, regardingPosts) = await(threadF, regardingPostsF).wait;
        posts = [thread, ...regardingPosts];
        isLastPage = regardingPosts.length < _pageSize;
      } else {
        posts = await _getThread.listRegardingPosts(
          extensionPkgName: state.extensionPkgName,
          siteId: state.siteId,
          boardId: state.boardId,
          threadId: state.threadId,
          pagination: Pagination(
            page: pageKey,
            pageSize: _pageSize,
          ),
        );
        isLastPage = posts.length < _pageSize;
      }
      if (isLastPage) {
        pagingController.appendLastPage(posts);
      } else {
        pagingController.appendPage(posts, pageKey + 1);
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

  void loadThread(String postId) async {
    if (state.threadMap.containsKey(postId)) {
      return;
    }
    final newMap = Map<String, Result<Post>>.from(state.threadMap)..[postId] = Result.loading();
    safeEmit(state.copyWith(threadMap: newMap));
    final newThread = await _getThread.call(
      extensionPkgName: state.extensionPkgName,
      siteId: state.siteId,
      boardId: state.boardId,
      id: state.threadId,
      postId: postId,
    );
    final newMap2 = Map<String, Result<Post>>.from(state.threadMap)..[postId] = Result.completed(newThread);
    safeEmit(state.copyWith(threadMap: newMap2));
  }

  void loadRegardingPosts(String postId) async {
    if (state.regardingPostsMap.containsKey(postId)) {
      return;
    }
    final newMap = Map.of(state.regardingPostsMap)..[postId] = Result.loading();
    safeEmit(state.copyWith(regardingPostsMap: newMap));
    final regardingPostsMap = await _getThread.listRegardingPosts(
      extensionPkgName: state.extensionPkgName,
      siteId: state.siteId,
      boardId: state.boardId,
      threadId: state.threadId,
      postId: postId,
    );
    final newMap2 = Map.of(state.regardingPostsMap)..[postId] = Result.completed(regardingPostsMap);
    safeEmit(state.copyWith(regardingPostsMap: newMap2));
  }
}
