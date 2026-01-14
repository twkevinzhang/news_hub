import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/components/navigation/app_bar_title_notifier.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';
import 'package:news_hub/presentation/components/search/search_form_overlay.dart';
import 'package:news_hub/presentation/components/search/searchable_screen_mixin.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/boards/:boardId/threads/list/bloc/collection_board_thread_list_cubit.dart';
import 'package:news_hub/presentation/components/cards/post/single_image_post_layout.dart';
import 'package:news_hub/presentation/components/search/search_mode_notifier.dart';
import 'package:news_hub/shared/failures.dart';

@RoutePage()
class CollectionBoardThreadListScreen extends StatefulWidget
    implements AutoRouteWrapper {
  final String collectionId;
  final String boardId;

  const CollectionBoardThreadListScreen({
    super.key,
    @PathParam('collectionId') required this.collectionId,
    @PathParam('boardId') required this.boardId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CollectionBoardThreadListCubit>(),
      child: this,
    );
  }

  @override
  State<CollectionBoardThreadListScreen> createState() =>
      _CollectionBoardThreadListScreenState();
}

class _CollectionBoardThreadListScreenState
    extends State<CollectionBoardThreadListScreen>
    with SearchableScreenMixin {
  @override
  void onSearchTriggered() {
    sl<SearchModeNotifier>().enterSearchMode();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CollectionBoardThreadListCubit>().init(
        collectionId: widget.collectionId,
        boardId: widget.boardId,
      );
    });
  }

  @override
  void didUpdateWidget(CollectionBoardThreadListScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.collectionId != widget.collectionId ||
        oldWidget.boardId != widget.boardId) {
      context.read<CollectionBoardThreadListCubit>().init(
        collectionId: widget.collectionId,
        boardId: widget.boardId,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<
      CollectionBoardThreadListCubit,
      CollectionBoardThreadListState
    >(
      listenWhen: (previous, current) => previous.board != current.board,
      listener: (context, state) {
        if (state.board != null) {
          sl<AppBarTitleNotifier>().updateTitle(
            state.board!.identity.boardName,
          );
        }
      },
      child: ListenableBuilder(
        listenable: sl<SearchModeNotifier>(),
        builder: (context, _) {
          final isSearchVisible = sl<SearchModeNotifier>().isSearchMode;
          final cubit = context.read<CollectionBoardThreadListCubit>();
          final state = cubit.state;

          return Stack(
            children: [
              PagedListView<int, SingleImagePostWithExtension>(
                pagingController: cubit.pagingController,
                builderDelegate:
                    PagedChildBuilderDelegate<SingleImagePostWithExtension>(
                      itemBuilder: (context, thread, index) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 1,
                        ),
                        child: SingleImagePostCard(thread: thread),
                      ),
                      firstPageErrorIndicatorBuilder: (context) =>
                          BlocSelector<
                            CollectionBoardThreadListCubit,
                            CollectionBoardThreadListState,
                            Failure?
                          >(
                            selector: (state) => state.error,
                            builder: (context, error) {
                              return Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Error: ${error ?? 'Unknown error'}"),
                                    ElevatedButton(
                                      onPressed: () => cubit.refresh(
                                        collectionId: widget.collectionId,
                                        boardId: widget.boardId,
                                      ),
                                      child: const Text("Retry"),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
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
              if (isSearchVisible)
                SearchFormOverlay(
                  collectionId: widget.collectionId,
                  title: '在 ${state.board?.identity.boardName ?? "..."} 中搜尋',
                  initialFilter: state.activeFilter,
                  shouldNavigateToResult: false,
                  onSearch: (filter) {
                    cubit.applyFilter(filter);
                    sl<SearchModeNotifier>().exitSearchMode();
                  },
                  onClose: () => sl<SearchModeNotifier>().exitSearchMode(),
                ),
            ],
          );
        },
      ),
    );
  }
}
