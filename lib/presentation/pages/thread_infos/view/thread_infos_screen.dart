import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart' show PostWithExtension;
import 'package:news_hub/domain/thread/interactor/list_thread_infos.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_card.dart';
import 'package:news_hub/presentation/pages/thread_infos/widgets/thread_card.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class ThreadInfosScreen extends StatelessWidget implements AutoRouteWrapper {
  final ThreadsFilter? filter;
  const ThreadInfosScreen({super.key, this.filter});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadInfosCubit>()..init(filter: filter),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThreadInfosCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu_outlined),
          onPressed: () {},
        ),
        title: const Text('Bookmark Name'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => AutoRouter.of(context).push(SearchRoute()),
          ),
        ],
      ),
      body: PagedListView<int, PostWithExtension>(
        pagingController: cubit.pagingController,
        builderDelegate: PagedChildBuilderDelegate<PostWithExtension>(
          itemBuilder: (context, thread, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: ThreadInfoCard(thread: thread),
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
