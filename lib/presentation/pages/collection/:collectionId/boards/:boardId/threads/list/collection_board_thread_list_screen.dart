import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/boards/:boardId/threads/list/bloc/collection_board_thread_list_cubit.dart';
import 'package:news_hub/presentation/pages/thread/detail/layouts/single_image_post_layout.dart';

@RoutePage()
class CollectionBoardThreadListScreen extends StatelessWidget implements AutoRouteWrapper {
  final String collectionId;
  final String boardId;

  const CollectionBoardThreadListScreen({
    super.key,
    @PathParam('collectionId') required this.collectionId,
    @PathParam('boardId') required this.boardId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionBoardThreadListCubit>()
        ..init(
          collectionId: collectionId,
          boardId: boardId,
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CollectionBoardThreadListCubit>();
    return PagedListView<int, SingleImagePostWithExtension>(
      pagingController: cubit.pagingController,
      builderDelegate: PagedChildBuilderDelegate<SingleImagePostWithExtension>(
        itemBuilder: (context, thread, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: SingleImagePostCard(thread: thread),
        ),
        firstPageErrorIndicatorBuilder: (context) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Error: ${cubit.state.error ?? 'Unknown error'}"),
              ElevatedButton(
                onPressed: () => cubit.refresh(
                  collectionId: collectionId,
                  boardId: boardId,
                ),
                child: const Text("Retry"),
              ),
            ],
          ),
        ),
        noItemsFoundIndicatorBuilder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Empty"),
            ElevatedButton(
              onPressed: () => cubit.refresh(
                collectionId: collectionId,
                boardId: boardId,
              ),
              child: const Text("Refresh"),
            ),
          ],
        ),
        firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
        transitionDuration: const Duration(milliseconds: 500),
        animateTransitions: true,
      ),
    );
  }
}
