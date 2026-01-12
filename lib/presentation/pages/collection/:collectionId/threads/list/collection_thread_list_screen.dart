import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/bloc/collection_thread_list_cubit.dart';
import 'package:news_hub/presentation/pages/thread/detail/layouts/single_image_post_layout.dart';
import 'package:news_hub/presentation/pages/thread/detail/layouts/single_image_post_skeleton.dart';

@RoutePage()
class CollectionThreadListScreen extends StatelessWidget implements AutoRouteWrapper {
  final String collectionId;

  const CollectionThreadListScreen({
    super.key,
    @PathParam('collectionId') required this.collectionId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionThreadListCubit>()..init(collectionId),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<CollectionThreadListCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text(cubit.state.collection?.name ?? "Untitled"),
      ),
      body: PagedListView<int, dynamic>(
        pagingController: cubit.pagingController,
        builderDelegate: PagedChildBuilderDelegate<dynamic>(
          itemBuilder: (context, item, index) {
            if (item is SingleImagePostWithExtension) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: SingleImagePostCard(thread: item),
              );
            } else if (item is CollectionBoardSkeleton) {
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                child: SingleImagePostSkeleton(),
              );
            }
            return const SizedBox.shrink();
          },
          noItemsFoundIndicatorBuilder: (context) => const SizedBox(),
          firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
          newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
          noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
          transitionDuration: const Duration(milliseconds: 500),
          animateTransitions: true,
        ),
      ),
    );
  }
}
