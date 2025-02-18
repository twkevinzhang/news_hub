import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/search/models/models.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/thread_infos_cubit.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class ThreadInfosScreen extends StatelessWidget {
  const ThreadInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = CustomSliverScope.of(context);

    return BlocProvider(
      create: (context) => sl<ThreadInfosCubit>()..init(),
      child: _ThreadInfosView(
        scrollController: provider.scrollController,
      ),
    );
  }
}

class _ThreadInfosView extends StatelessWidget {
  final ScrollController scrollController;
  const _ThreadInfosView({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThreadInfosCubit, ThreadInfosState>(
      builder: (context, state) {
        final cubit = context.read<ThreadInfosCubit>();

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
                        final filter = await AutoRouter.of(context).push<ThreadsFilter?>(SearchRoute());
                        if (!context.mounted) return;
                        if (filter != null) {
                          cubit.filter = filter;
                          cubit.sorting = null;
                          cubit.refresh();
                        }
                      },
                    ),
                  ],
                ),
                SliverPersistentHeader(
                  floating: true,
                  delegate: _SliverAppBarDelegate(
                    minHeight: 48,
                    maxHeight: 48,
                    child: _buildFilterBar(),
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

  Widget _buildFilterBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          ActionChip(
            avatar: Icon(Icons.filter_alt_outlined),
            label: const Text('Boards'),
            onPressed: () {},
          ),
        ],
      ),
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