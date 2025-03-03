import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_paragraph.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_hub/domain/models/models.dart' as domain;

class PostLayout extends StatelessWidget {
  final domain.Post post;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;
  final FutureOr<void> Function()? onLikeClick;
  final FutureOr<void> Function()? onRegardingPostsClick;
  final FutureOr<void> Function()? onCommentsClick;
  const PostLayout({
    super.key,
    required this.post,
    this.onParagraphClick,
    this.onLikeClick,
    this.onRegardingPostsClick,
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
        ArticleWidget(
          contents: post.contents,
          onParagraphClick: onParagraphClick,
        ),
        Container(height: 8),
        PostActions(
          liked: post.liked,
          regardingPosts: post.regardingPostsCount,
          comments: post.comments,
          onLikeClick: onLikeClick,
          onRegardingPostsClick: onRegardingPostsClick,
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
        Row(
          children: [
            Text(author, style: primaryStyle),
            SizedBox(width: 8),
            Text(timeago.format(createdAt), style: outlineStyle),
            SizedBox(width: 8),
            if (category != null) ...[
              Text('in', style: outlineStyle),
              SizedBox(width: 4),
              Text(category!, style: outlineStyle),
            ],
          ],
        ),
        Row(
          children: [
            Text(postId, style: outlineStyle),
            SizedBox(width: 8),
            const Icon(Icons.more_vert),
          ],
        ),
      ],
    );
  }
}

class PostActions extends StatelessWidget {
  final int? liked;
  final int? regardingPosts;
  final int? comments;
  final FutureOr<void> Function()? onLikeClick;
  final FutureOr<void> Function()? onRegardingPostsClick;
  final FutureOr<void> Function()? onCommentsClick;
  const PostActions({
    this.liked,
    this.regardingPosts,
    this.comments,
    this.onLikeClick,
    this.onRegardingPostsClick,
    this.onCommentsClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (liked.isPositive)
          ..._getAction(context, Icons.thumb_up_alt_outlined, onLikeClick, liked.toString()),
        if (regardingPosts.isPositive)
          ..._getAction(context, Icons.comment_outlined, onRegardingPostsClick, regardingPosts.toString()),
        if (comments.isPositive)
          ..._getAction(context, Icons.bubble_chart_outlined, onCommentsClick, comments.toString()),
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
