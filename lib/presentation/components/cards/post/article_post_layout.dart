import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/pages/thread/detail/widgets/post_paragraph.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_hub/domain/models/models.dart' as domain;

/// 模仿 Android app Omnichan
class ArticlePostLayout extends StatelessWidget {
  final domain.ArticlePost post;
  final bool disablePlay;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;
  final FutureOr<void> Function()? onLikeClick;
  final FutureOr<void> Function()? onRepliesClick;
  final FutureOr<void> Function()? onCommentsClick;
  const ArticlePostLayout({
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
          category: null,
        ),
        RichContent(
          contents: post.contents,
          disablePlay: disablePlay,
          onParagraphClick: onParagraphClick,
        ),
        Container(height: 8),
        PostActions(
          liked: post.liked,
          replies: post.repliesCount,
          comments: null,
          onLikeClick: onLikeClick,
          onRepliesClick: onRepliesClick,
          onCommentsClick: onCommentsClick,
        ),
      ],
    );
  }
}

class PostHeader extends StatelessWidget {
  final String postId;
  final String author;
  final DateTime createdAt;
  final String? category;
  const PostHeader({
    super.key,
    required this.postId,
    required this.author,
    required this.createdAt,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
    );
    final outlineStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.outline,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(
                  author,
                  style: primaryStyle,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              const SizedBox(width: 8),
              Text(timeago.format(createdAt), style: outlineStyle),
              const SizedBox(width: 8),
              if (category != null) ...[
                Text('in', style: outlineStyle),
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    category!,
                    style: outlineStyle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
            ],
          ),
        ),
        const SizedBox(width: 8),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Text(
                postId,
                style: outlineStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.more_horiz_outlined),
          ],
        ),
      ],
    );
  }
}

class PostActions extends StatelessWidget {
  final int? liked;
  final int? replies;
  final int? comments;
  final FutureOr<void> Function()? onLikeClick;
  final FutureOr<void> Function()? onRepliesClick;
  final FutureOr<void> Function()? onCommentsClick;
  const PostActions({
    super.key,
    this.liked,
    this.replies,
    this.comments,
    this.onLikeClick,
    this.onRepliesClick,
    this.onCommentsClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (liked.isPositive) ..._getAction(context, Icons.thumb_up_alt_outlined, onLikeClick, liked.toString()),
        if (replies.isPositive) ..._getAction(context, Icons.comment_outlined, onRepliesClick, replies.toString()),
        if (comments.isPositive) ..._getAction(context, Icons.bubble_chart_outlined, onCommentsClick, comments.toString()),
      ],
    );
  }

  List<Widget> _getAction(
    BuildContext context,
    IconData icon,
    void Function()? onTap,
    String text,
  ) {
    final theme = Theme.of(context);
    final outlineColor = theme.colorScheme.outline;
    final outlineStyle = theme.textTheme.bodySmall!.copyWith(
      color: outlineColor,
    );
    final row = [
      Icon(icon, color: outlineColor),
      SizedBox(width: 4),
      Text(text, style: outlineStyle),
      SizedBox(width: 8),
    ];
    if (onTap != null) {
      return [
        InkWell(
          onTap: onTap,
          child: Row(
            children: row,
          ),
        ),
      ];
    } else {
      return row;
    }
  }
}
