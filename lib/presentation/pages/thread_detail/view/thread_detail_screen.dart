import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread_detail/bloc/thread_detail_cubit.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_card.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class ThreadDetailScreen extends StatelessWidget implements AutoRouteWrapper {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String threadId;
  const ThreadDetailScreen({
    super.key,
    required this.threadId,
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadDetailCubit>()
        ..init(
          threadId: threadId,
          extensionPkgName: extensionPkgName,
          siteId: siteId,
          boardId: boardId,
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThreadDetailCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thread Detail'),
      ),
      body: PagedListView<int, PostWithExtension>(
        pagingController: cubit.pagingController,
        builderDelegate: PagedChildBuilderDelegate<PostWithExtension>(
          itemBuilder: (context, post, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: PostCard(post: post, boardName: post.board.name),
          ),
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text("Empty"),
          ),
          firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
          newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
          noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
          transitionDuration: const Duration(seconds: 1),
          animateTransitions: true,
        ),
      ),
    );
  }
}
