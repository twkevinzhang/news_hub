import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/thread/interactor/list_thread_infos.dart';
import 'package:news_hub/presentation/pages/thread_infos/bloc/search_cubit.dart';
import 'package:news_hub/presentation/widgets/organisms/single_image_post_layout.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

@RoutePage()
class ThreadInfosScreen extends StatelessWidget {
  const ThreadInfosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<SearchCubit>();
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
