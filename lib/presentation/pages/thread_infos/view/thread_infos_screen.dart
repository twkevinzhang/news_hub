import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/bloc/search_cubit.dart';
import 'package:news_hub/presentation/pages/search/search.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart';
import 'package:news_hub/presentation/pages/thread_infos/widgets/post_card.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class ThreadInfosScreen extends StatelessWidget {
  const ThreadInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadInfosCubit>()..init(),
      child: _ThreadInfosScreen(),
    );
  }
}

class _ThreadInfosScreen extends StatelessWidget {
  const _ThreadInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThreadInfosCubit>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
          },
        ),
        title: const Text('Bookmark Name'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () async {
              await AutoRouter.of(context).push(SearchRoute());
            },
          ),
        ],
      ),
      body: PagedListView<int, ThreadWithExtension>(
        pagingController: cubit.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ThreadWithExtension>(
          itemBuilder: (context, thread, index) => GestureDetector(
            onTap: () {},
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(),
                ),
                const Divider(),
              ],
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => Center(
            child: Text("空"),
          ),
          firstPageProgressIndicatorBuilder: (context) =>
          const LoadingIndicator(),
          newPageProgressIndicatorBuilder: (context) =>
          const LoadingIndicator(),
          noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
          transitionDuration: const Duration(seconds: 1),
          animateTransitions: true,
        ),
      ),
    );
  }
}
