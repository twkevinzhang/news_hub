import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/extension/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart';
import 'package:news_hub/presentation/pages/thread_infos/screens/search_screen.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class ThreadInfosScreen extends StatelessWidget {
  const ThreadInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThreadInfosCubit, ThreadInfosState>(
      builder: (context, state) {
        final cubit = context.read<ThreadInfosCubit>();
        final scrollController = CustomSliverScope.of(context).scrollController;
        final router = AutoRouter.of(context);

        return Scaffold(
          body: SafeArea(
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverAppBar(
                  title: Text("Threads"),
                  actions: [
                    IconButton(
                      icon: const Text("🔥"),
                      onPressed: () async {
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.sort_outlined),
                      onPressed: () async {
                      },
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  floating: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 48,
                    maxHeight: 48,
                    child: FilterBar(onBoardsFilterClick: () {
                      router.push<ThreadsFilter?>(FilterByBoardsRoute());
                    }),
                  ),
                ),
                PagedSliverList<int, ThreadWithExtension>.separated(
                  pagingController: cubit.pagingController,
                  builderDelegate: PagedChildBuilderDelegate(
                    itemBuilder: (context, item, index) => GestureDetector(
                      onTap: () {},
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    noItemsFoundIndicatorBuilder: (context) => const Center(child: Text("空")),
                    noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
                    firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                    newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
                  ),
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              AutoRouter.of(context).push(SearchRoute());
            },
            child: const Icon(Icons.search_outlined),
          ),
        );
      },
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context,
      double shrinkOffset,
      bool overlapsContent,
      ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight || minHeight != oldDelegate.minHeight || child != oldDelegate.child;
  }
}