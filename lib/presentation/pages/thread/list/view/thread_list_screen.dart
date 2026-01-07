import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_threads.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread/detail/layouts/single_image_post_layout.dart';
import 'package:news_hub/presentation/pages/thread/list/bloc/thread_list_cubit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';

@RoutePage()
class ThreadListScreen extends StatelessWidget implements AutoRouteWrapper {
  final ThreadsFilter? filter;
  final ThreadsSorting? sorting;

  const ThreadListScreen({
    super.key,
    this.filter,
    this.sorting,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadListCubit>()..init(filter, sorting),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThreadListCubit>();
    return PagedListView<int, SingleImagePostWithExtension>(
      pagingController: cubit.pagingController,
      builderDelegate: PagedChildBuilderDelegate<SingleImagePostWithExtension>(
        itemBuilder: (context, thread, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
          child: SingleImagePostCard(thread: thread),
        ),
        noItemsFoundIndicatorBuilder: (context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Empty"),
            ElevatedButton(
              onPressed: () => cubit.refresh(),
              child: const Text("Refresh"),
            ),
          ],
        ),
        firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
        noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
        transitionDuration: const Duration(seconds: 1),
        animateTransitions: true,
      ),
    );
  }
}
