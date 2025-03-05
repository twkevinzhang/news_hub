import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/pages/thread_detail/bloc/thread_detail_cubit.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_card.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:news_hub/shared/models.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:news_hub/domain/models/models.dart' as domain;

@RoutePage()
class ThreadDetailScreen extends StatelessWidget implements AutoRouteWrapper {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String threadId;
  const ThreadDetailScreen({
    super.key,
    required this.threadId,
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
  });

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ThreadDetailCubit>()
        ..init(
          threadId: threadId,
          extensionPkgName: extensionPkgName,
          siteId: siteId,
          boardId: boardId,
        ),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.watch<ThreadDetailCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thread Detail'),
      ),
      body: PagedListView<int, PostWithExtension>(
        pagingController: cubit.pagingController,
        builderDelegate: PagedChildBuilderDelegate<PostWithExtension>(
          itemBuilder: (context, post, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: Card(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: getPostLayout(context, cubit, post),
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

  Widget getPostLayout(
    BuildContext context,
    ThreadDetailCubit cubit,
    domain.Post post,
  ) {
    return PostLayout(
      post: post,
      onParagraphClick: (paragraph) async {
        if (paragraph is domain.LinkParagraph) {
          final url = paragraph.content;
          if (!await launchUrl(Uri.parse(url))) {
            throw Exception('Could not launch $url');
          }
        } else if (paragraph is domain.ReplyToParagraph) {
          showDialog(
            context: context,
            builder: (context) => BlocProvider<ThreadDetailCubit>.value(
              value: cubit..loadThread(paragraph.id),
              child: Dialog(
                  child: Padding(
                padding: EdgeInsets.all(16),
                child: BlocBuilder<ThreadDetailCubit, ThreadDetailState>(
                  builder: (context, state) => state.threadMap[paragraph.id]!.maybeWhen(
                    orElse: () => const LoadingIndicator(),
                    completed: (thread) => SingleChildScrollView(
                        child: getPostLayout(
                      context,
                      cubit,
                      thread,
                    )),
                  ),
                ),
              )),
            ),
          );
        } else if (paragraph is domain.VideoParagraph) {
          // TODO
        } else if (paragraph is domain.ImageParagraph) {
          // TODO
        } else if (paragraph is domain.QuoteParagraph) {
          // TODO
        }
      },
      onRegardingPostsClick: () {
        showDialog(
          context: context,
          builder: (context) => BlocProvider<ThreadDetailCubit>.value(
            value: cubit..loadRegardingPosts(post.id),
            child: Dialog(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: BlocBuilder<ThreadDetailCubit, ThreadDetailState>(
                builder: (context, state) => state.regardingPostsMap[post.id]!.maybeWhen(
                  orElse: () => const LoadingIndicator(),
                  completed: (regardingPosts) => SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: regardingPosts
                            .map((regardingPost) => getPostLayout(
                                  context,
                                  cubit,
                                  regardingPost,
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            )),
          ),
        );
      },
    );
  }
}
