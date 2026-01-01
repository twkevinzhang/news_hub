import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_thread_list.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread/detail/layouts/single_image_post_layout.dart';
import 'package:news_hub/presentation/pages/thread/list/bloc/thread_list_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/presentation/shared/shared.dart';
import 'package:news_hub/presentation/pages/home/widgets/app_top_bar.dart';

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
    return Scaffold(
      appBar: AppTopBar(
        title: Text(cubit.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => AutoRouter.of(context).push(SearchRoute()),
          ),
          IconButton(
            icon: const Icon(Icons.refresh_outlined),
            onPressed: () => cubit.refresh(),
          ),
        ],
      ),
      body: PagedListView<int, SingleImagePostWithExtension>(
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
      ),
    );
  }
}
