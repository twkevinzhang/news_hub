import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/thread/detail/widgets/post_paragraph.dart';
import 'package:news_hub/presentation/router/router.gr.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';

import 'article_post_layout.dart';

class SingleImagePostCard extends StatelessWidget {
  final SingleImagePostWithExtension thread;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;
  const SingleImagePostCard({
    super.key,
    required this.thread,
    this.onParagraphClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => _toDetail(context),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: SingleImagePostLayout(
            post: thread,
            onParagraphClick: null,
            disablePlay: true,
          ),
        ),
      ),
    );
  }

  void _toDetail(BuildContext context) {
    AutoRouter.of(context).push(
      ThreadDetailRoute(
        extensionPkgName: thread.extensionPkgName,
        boardId: thread.boardId,
        threadId: thread.id,
      ),
    );
  }
}

/// 模仿 https://moptt.tw/popular
class SingleImagePostLayout extends StatelessWidget {
  final domain.SingleImagePost post;
  final bool disablePlay;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;
  final FutureOr<void> Function()? onLikeClick;
  final FutureOr<void> Function()? onRepliesClick;
  final FutureOr<void> Function()? onCommentsClick;
  const SingleImagePostLayout({
    super.key,
    required this.post,
    this.disablePlay = false,
    this.onParagraphClick,
    this.onLikeClick,
    this.onRepliesClick,
    this.onCommentsClick,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        PostHeader(
          postId: post.id,
          author: post.authorName,
          createdAt: post.createdAt,
          // category: null, // Removed in Bahamut style
        ),
        if (post.title != null && post.title!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              post.title!,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
        post.image != null
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextOnlyContent(
                      contents: post.contents,
                      disablePlay: disablePlay,
                      onParagraphClick: onParagraphClick,
                      textLengthMax: 100,
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CachedNetworkImage(
                          imageUrl: post.image!.thumb(),
                          placeholder: (context, url) =>
                              const LoadingIndicator(),
                          errorWidget: (context, url, error) {
                            debugPrint("Failed to load image: $url");
                            return const Icon(Icons.error);
                          },
                          fit: BoxFit.cover, // 填滿正方形
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : TextOnlyContent(
                contents: post.contents,
                disablePlay: disablePlay,
                onParagraphClick: onParagraphClick,
              ),
        Container(height: 8),
        PostActions(
          liked: post.liked,
          replies: post.repliesCount,
          // comments: null, // Removed in Bahamut style
          onLikeClick: onLikeClick,
          onRepliesClick: onRepliesClick,
          onCommentsClick: onCommentsClick,
        ),
      ],
    );
  }
}
