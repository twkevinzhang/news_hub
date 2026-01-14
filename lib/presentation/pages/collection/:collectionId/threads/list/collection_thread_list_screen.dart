import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';
import 'package:news_hub/presentation/components/search/search_form_overlay.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/bloc/collection_thread_list_cubit.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_layout.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_skeleton.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';

@RoutePage()
class CollectionThreadListScreen extends StatefulWidget
    implements AutoRouteWrapper {
  final String collectionId;

  const CollectionThreadListScreen({
    super.key,
    @PathParam('collectionId') required this.collectionId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionThreadListCubit>(),
      child: this,
    );
  }

  @override
  State<CollectionThreadListScreen> createState() =>
      _CollectionThreadListScreenState();
}

class _CollectionThreadListScreenState
    extends State<CollectionThreadListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CollectionThreadListCubit>().init(widget.collectionId);
    });
  }

  @override
  void didUpdateWidget(CollectionThreadListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.collectionId != widget.collectionId) {
      context.read<CollectionThreadListCubit>().init(widget.collectionId);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CollectionThreadListCubit, CollectionThreadListState>(
      listenWhen: (previous, current) =>
          previous.collection != current.collection,
      listener: (context, state) {
        if (state.collection != null) {
          context.read<HomeCubit>().updateTitle(state.collection!.name);
        }
      },
      child: BlocBuilder<CollectionThreadListCubit, CollectionThreadListState>(
        buildWhen: (previous, current) =>
            previous.isSearchOverlayVisible != current.isSearchOverlayVisible,
        builder: (context, state) {
          final cubit = context.read<CollectionThreadListCubit>();

          // Effect to toggle search mode from HomeCubit trigger
          // We use a Builder to get a context that can find HomeCubit if needed,
          // but better to put this listener at the top level.
          // Since we can't easily nest unrelated listeners without nesting widgets,
          // we'll leave it to a separate widget or use MultiBlocListener if needed.
          // Here we insert a manual listener in the tree.

          return _SearchEventListener(
            onSearchTriggered: () => cubit.toggleSearchMode(),
            child: PopScope(
              canPop: !state.isSearchOverlayVisible,
              onPopInvokedWithResult: (didPop, result) {
                if (didPop) return;
                cubit.toggleSearchMode();
              },
              child: Stack(
                children: [
                  PagedListView<int, dynamic>(
                    pagingController: cubit.pagingController,
                    builderDelegate: PagedChildBuilderDelegate<dynamic>(
                      itemBuilder: (context, item, index) {
                        if (item is SingleImagePostWithExtension) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 1,
                            ),
                            child: SingleImagePostCard(thread: item),
                          );
                        } else if (item is CollectionBoardSkeleton) {
                          return const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 1,
                            ),
                            child: SingleImagePostSkeleton(),
                          );
                        }
                        return const SizedBox.shrink();
                      },
                      noItemsFoundIndicatorBuilder: (context) =>
                          const SizedBox(),
                      firstPageProgressIndicatorBuilder: (context) =>
                          const LoadingIndicator(),
                      newPageProgressIndicatorBuilder: (context) =>
                          const LoadingIndicator(),
                      noMoreItemsIndicatorBuilder: (context) =>
                          const SizedBox(),
                      transitionDuration: const Duration(milliseconds: 500),
                      animateTransitions: true,
                    ),
                  ),
                  if (state.isSearchOverlayVisible)
                    SearchFormOverlay(
                      collectionId: widget.collectionId,
                      title: '在 ${state.collection?.name ?? "..."} 中搜尋',
                      initialFilter: state.activeFilter,
                      onSearch: (filter) => cubit.applyFilter(filter),
                      onClose: () => cubit.toggleSearchMode(),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _SearchEventListener extends StatefulWidget {
  final Widget child;
  final VoidCallback onSearchTriggered;

  const _SearchEventListener({
    required this.child,
    required this.onSearchTriggered,
  });

  @override
  State<_SearchEventListener> createState() => _SearchEventListenerState();
}

class _SearchEventListenerState extends State<_SearchEventListener> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();
    _subscription = context.read<HomeCubit>().searchStream.listen((_) {
      widget.onSearchTriggered();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
