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
  ThreadInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadInfosCubit>(),
      child: _ThreadInfosView(),
    );
  }
}

class _ThreadInfosView extends StatelessWidget {
  _ThreadInfosView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThreadInfosCubit, ThreadInfosState>(
        builder: (context, state) {
          final cubit = context.read<ThreadInfosCubit>();

          return Scaffold(
              appBar: AppBar(
                title: const Text('ThreadInfos'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.search_outlined),
                    onPressed: () async {
                      final result = await AutoRouter.of(context).push<SearchConfigForm?>(SearchRoute());
                      if (!context.mounted) return;
                      if (result != null) {
                        cubit.searchConfigForm = result;
                        cubit.pagingController.refresh();
                      }
                    },
                  ),
                ],
              ),
            body: PagedListView<int, ThreadWithExtension>(
              pagingController: cubit.pagingController,
              builderDelegate: PagedChildBuilderDelegate<ThreadWithExtension>(
                itemBuilder: (context, thread, index) => GestureDetector(
                  onTap: () {

                  },
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
                  child: Text("找不到"),
                ),
                firstPageProgressIndicatorBuilder: (context) =>
                const LoadingIndicator(),
                newPageProgressIndicatorBuilder: (context) =>
                const LoadingIndicator(),
                noMoreItemsIndicatorBuilder: (context) => Center(
                  child: Text("沒有了"),
                ),
                transitionDuration: const Duration(seconds: 1),
                animateTransitions: true,
              ),
            ),
          );
        });
  }
}
