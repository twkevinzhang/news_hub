import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/domain/thread/interactor/list_thread_infos.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_card.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_paragraph.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/presentation/widgets/atoms/atoms.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_hub/domain/models/models.dart' as domain;

class ThreadInfoCard extends StatelessWidget {
  final PostWithExtension thread;
  const ThreadInfoCard({
    super.key,
    required this.thread,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
          onTap: () {
            AutoRouter.of(context).push(ThreadDetailRoute(
              extensionPkgName: thread.extensionPkgName,
              siteId: thread.siteId,
              boardId: thread.boardId,
              threadId: thread.id,
            ));
          },
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PostHeader(
                  postId: thread.id,
                  author: thread.authorName,
                  createdAt: thread.createdAt,
                  category: thread.board.name,
                ),
                SizedBox(height: 8),
                ArticleWidget(
                  contents: thread.contents,
                  onParagraphClick: (domain.Paragraph paragraph) {},
                  onPreviewReplyTo: (String id) => '',
                ),
                SizedBox(height: 8),
                PostActions(
                  liked: thread.liked,
                  regardingPosts: thread.regardingPostsCount,
                  comments: null,
                ),
              ],
            ),
          )),
    );
  }
}
