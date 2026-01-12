import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread/detail/bloc/thread_detail_cubit.dart';
import 'package:news_hub/presentation/components/cards/post/article_post_layout.dart';
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';
import 'package:news_hub/presentation/pages/thread/detail/widgets/post_gallery_overlay.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

@RoutePage()
class ThreadDetailScreen extends StatelessWidget implements AutoRouteWrapper {
  final String extensionPkgName;
  final String boardId;
  final String threadId;
  const ThreadDetailScreen({
    super.key,
    required this.threadId,
    required this.extensionPkgName,
    required this.boardId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadDetailCubit>()
        ..init(
          threadId: threadId,
          extensionPkgName: extensionPkgName,
          boardId: boardId,
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThreadDetailCubit>();
    final threadResult = cubit.state.threadMap[cubit.state.threadId];
    return Scaffold(
      appBar: AppBar(
        title: threadResult?.maybeWhen(
          orElse: () => Text(cubit.state.threadId),
          completed: (thread) => Text(thread.title ?? thread.id),
        ),
        actions: threadResult?.maybeWhen(
          orElse: () => null,
          completed: (thread) {
            return [
              IconButton(
                icon: const Icon(Icons.refresh_outlined),
                onPressed: () => cubit.refresh(),
              ),
              PopupMenuButton(
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem(
                      value: 0,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [Icon(Icons.open_in_new_outlined), SizedBox(width: 12), Text('在瀏覽器中打開')],
                      ),
                    ),
                  ];
                },
                onSelected: (value) async {
                  if (value == 0) {
                    final url = thread.url;
                    if (url != null && !await launchUrl(Uri.parse(url))) {
                      debugPrint('Could not launch $url');
                    }
                  }
                },
              ),
            ];
          },
        ),
      ),
      body: PagedListView<int, ArticlePostWithExtension>(
        pagingController: cubit.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ArticlePostWithExtension>(
          itemBuilder: (context, post, index) => ThreadPostItem(
            post: post,
            index: index,
            onRepliesClick: index == 0 ? null : () => _onRepliesClick(context, cubit, post),
            onRepliesTreeClick: () => _onRepliesTreeClick(context, cubit, post),
            onParagraphClick: (paragraph) => _handleParagraphClick(context, cubit, post, paragraph),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text("Empty"),
          ),
          firstPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
          newPageProgressIndicatorBuilder: (context) => const LoadingIndicator(),
          noMoreItemsIndicatorBuilder: (context) => const SizedBox(),
          transitionDuration: const Duration(milliseconds: 500),
          animateTransitions: true,
        ),
      ),
    );
  }

  void _handleParagraphClick(
    BuildContext context,
    ThreadDetailCubit cubit,
    domain.ArticlePost post,
    domain.Paragraph paragraph,
  ) {
    if (paragraph is domain.LinkParagraph) {
      _onLinkParagraphClick(paragraph);
    } else if (paragraph is domain.ReplyToParagraph) {
      _onReplyToParagraphClick(context, cubit, paragraph);
    } else if (paragraph is domain.VideoParagraph) {
      // TODO
    } else if (paragraph is domain.ImageParagraph) {
      _onImageParagraphClick(context, cubit, post, paragraph);
    } else if (paragraph is domain.QuoteParagraph) {
      // TODO
    }
  }

  void _onLinkParagraphClick(domain.LinkParagraph paragraph) async {
    final url = paragraph.content;
    if (!await launchUrl(Uri.parse(url))) {
      debugPrint('Could not launch $url');
    }
  }

  void _onReplyToParagraphClick(BuildContext context, ThreadDetailCubit cubit, domain.ReplyToParagraph paragraph) {
    showDialog(
      context: context,
      builder: (context) => _buildDialog(
        cubit: cubit,
        builder: (context, state) => state.threadMap[paragraph.id]!.maybeWhen(
          orElse: () => const LoadingIndicator(),
          completed: (thread) => SingleChildScrollView(
            child: ThreadPostItem(
              post: thread,
              index: -1,
              onParagraphClick: (p) => _handleParagraphClick(context, cubit, thread, p),
            ),
          ),
        ),
      ),
    );
  }

  void _onImageParagraphClick(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post, domain.ImageParagraph paragraph) {
    final medias = post.contents.medias();
    final index = medias.indexOf(paragraph);
    _buildPostGallery(context, cubit, post, index).show();
  }

  void _onRepliesClick(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post) {
    cubit.loadReplies(post.id);
    // 傳統回覆對話框 (可選，目前保留)
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      builder: (context) => _buildRepliesBottomSheet(context, cubit, post),
    );
  }

  void _onRepliesTreeClick(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post) {
    cubit.loadReplies(post.id);
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Theme.of(context).colorScheme.surface,
      builder: (context) => _buildRepliesBottomSheet(context, cubit, post),
    );
  }

  Widget _buildRepliesBottomSheet(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post) {
    // 實作巴哈風格的回覆樹 Bottom Sheet (使用 DraggableScrollableSheet)
    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return BlocProvider.value(
          value: cubit,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Expanded(
                child: BlocBuilder<ThreadDetailCubit, ThreadDetailState>(
                  builder: (context, state) {
                    final repliesResult = state.repliesMap[post.id];
                    return repliesResult?.maybeWhen(
                          completed: (replies) => ListView.builder(
                            controller: scrollController,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            itemCount: replies.length + 1,
                            itemBuilder: (context, index) {
                              if (index == 0) {
                                return Column(
                                  children: [
                                    ThreadPostItem(
                                      post: post,
                                      index: -1,
                                      onParagraphClick: (paragraph) => _handleParagraphClick(context, cubit, post, paragraph),
                                      onRepliesTreeClick: () => _onRepliesTreeClick(context, cubit, post),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.symmetric(vertical: 8.0),
                                      child: Divider(),
                                    ),
                                  ],
                                );
                              }
                              final replyPost = replies[index - 1];
                              return ThreadPostItem(
                                post: replyPost,
                                index: index,
                                onParagraphClick: (paragraph) => _handleParagraphClick(context, cubit, replyPost, paragraph),
                                onRepliesClick: () => _onRepliesClick(context, cubit, replyPost),
                                onRepliesTreeClick: () => _onRepliesTreeClick(context, cubit, replyPost),
                              );
                            },
                          ),
                          orElse: () => const Center(child: LoadingIndicator()),
                        ) ??
                        const Center(child: LoadingIndicator());
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  BlocProvider _buildDialog({
    required ThreadDetailCubit cubit,
    required Widget Function(BuildContext context, ThreadDetailState state) builder,
  }) {
    return BlocProvider<ThreadDetailCubit>.value(
      value: cubit,
      child: Dialog(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: BlocBuilder<ThreadDetailCubit, ThreadDetailState>(
          builder: builder,
        ),
      )),
    );
  }

  SwipeImageGallery _buildPostGallery(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post, int initialIndex) {
    final medias = post.contents.medias();
    return SwipeImageGallery(
      overlayController: cubit.overlayController,
      context: context,
      dragEnabled: false,
      children: medias.map((m) => GalleryItem(media: m)).toList(),
      onSwipe: (index) {
        cubit.overlayController.add(PostGalleryOverlay(
          title: '${index + 1}/${medias.length}',
          post: post,
        ));
      },
      initialIndex: initialIndex,
      initialOverlay: PostGalleryOverlay(
        title: '${initialIndex + 1}/${medias.length}',
        post: post,
      ),
    );
  }
}

class ThreadPostItem extends StatelessWidget {
  final domain.ArticlePost post;
  final int index;
  final VoidCallback? onRepliesClick;
  final VoidCallback? onRepliesTreeClick;
  final Function(domain.Paragraph) onParagraphClick;

  const ThreadPostItem({
    super.key,
    required this.post,
    required this.index,
    this.onRepliesClick,
    this.onRepliesTreeClick,
    required this.onParagraphClick,
  });

  @override
  Widget build(BuildContext context) {
    final commentsResult = context.select((ThreadDetailCubit c) => c.state.commentsMap[post.id]);
    final cubit = context.read<ThreadDetailCubit>();

    // 從 commentsResult 提取留言資料，如果沒有則使用 post.top5Comments
    final comments = commentsResult?.maybeWhen(
          completed: (data) => data,
          orElse: () => post.top5Comments,
        ) ??
        post.top5Comments;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ArticlePostLayout(
        post: post,
        floor: index == -1 ? '樓主' : (index == 0 ? '樓主' : '${index + 1} 樓'),
        comments: comments,
        isCommentsLoading: commentsResult?.maybeWhen(
              loading: () => true,
              orElse: () => false,
            ) ??
            false,
        onParagraphClick: onParagraphClick,
        onRepliesClick: onRepliesClick,
        onRepliesTreeClick: onRepliesTreeClick,
        onViewMoreComments: () => cubit.loadComments(post.id),
      ),
    );
  }
}
