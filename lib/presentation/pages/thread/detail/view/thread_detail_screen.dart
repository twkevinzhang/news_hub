import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread/detail/bloc/thread_detail_cubit.dart';
import 'package:news_hub/presentation/pages/thread/detail/layouts/article_post_layout.dart';
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
    final thread = cubit.state.threadMap[cubit.state.threadId];
    return Scaffold(
      appBar: AppBar(
        title: thread?.maybeWhen(orElse: () => Text(cubit.state.threadId), completed: (thread) => Text(thread.title ?? thread.id)),
        actions: thread?.maybeWhen(
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
                      PopupMenuItem(
                        value: 0,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [const Icon(Icons.open_in_new_outlined), const SizedBox(width: 12), Text('在瀏覽器中打開')],
                        ),
                      ),
                    ];
                  },
                  onSelected: (value) async {
                    if (value == 0) {
                      final url = thread.url;
                      if (!await launchUrl(Uri.parse(thread.url!))) {
                        debugPrint('Could not launch $url');
                      }
                    }
                  },
                ),
              ];
            }),
      ),
      body: PagedListView<int, ArticlePostWithExtension>(
        pagingController: cubit.pagingController,
        builderDelegate: PagedChildBuilderDelegate<ArticlePostWithExtension>(
          itemBuilder: (context, post, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: _buildPostLayout(context, cubit, post, disableRegardingPostsClick: index == 0),
            )),
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

  Widget _buildPostLayout(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post, {bool disableRegardingPostsClick = false}) {
    return ArticlePostLayout(
      post: post,
      onParagraphClick: (paragraph) async {
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
      },
      onRegardingPostsClick: !disableRegardingPostsClick ? () => _onRegardingPostsClick(context, cubit, post) : null,
    );
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
          completed: (thread) => SingleChildScrollView(child: _buildPostLayout(context, cubit, thread)),
        ),
      ),
    );
  }

  void _onImageParagraphClick(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post, domain.ImageParagraph paragraph) {
    final medias = post.contents.medias();
    final index = medias.indexOf(paragraph);
    _buildPostGallery(context, cubit, post, index).show();
  }

  void _onRegardingPostsClick(BuildContext context, ThreadDetailCubit cubit, domain.ArticlePost post) {
    showDialog(
      context: context,
      builder: (context) => _buildDialog(
        cubit: cubit,
        builder: (context, state) => state.regardingPostsMap[post.id]!.maybeWhen(
          orElse: () => const LoadingIndicator(),
          completed: (regardingPosts) => SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: regardingPosts.map((regardingPost) => _buildPostLayout(context, cubit, regardingPost)).toList()),
            ),
          ),
        ),
      ),
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
        padding: EdgeInsets.symmetric(horizontal: 16),
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
