import 'package:flutter/material.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_paragraph.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_hub/domain/models/models.dart' as domain;

class PostCard extends StatelessWidget {
  final domain.Post post;
  final String boardName;
  const PostCard({
    super.key,
    required this.post,
    required this.boardName,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _PostHeader(
            postId: post.id,
            author: post.authorName,
            createdAt: post.createdAt,
            category: boardName,
          ),
          SizedBox(height: 8),
          ArticleWidget(
            contents: post.contents,
            onParagraphClick: (domain.Paragraph paragraph) {},
            onPreviewReplyTo: (String id) => '',
          ),
          SizedBox(height: 8),
          _PostActions(
            liked: post.like,
            regardingPosts: 0,
            comments: post.comments,
          ),
        ],
      ),
    ));
  }
}

class _PostHeader extends StatelessWidget {
  final String postId;
  final String author;
  final DateTime createdAt;
  final String category;
  const _PostHeader({
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

class _PostActions extends StatelessWidget {
  final int liked;
  final int regardingPosts;
  final int comments;
  const _PostActions({
    required this.liked,
    required this.regardingPosts,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primaryStyle = theme.textTheme.bodySmall!.copyWith(
      color: theme.colorScheme.primary,
    );
    final outlineColor = theme.colorScheme.outline;
    final outlineStyle = theme.textTheme.bodySmall!.copyWith(
      color: outlineColor,
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.thumb_up_alt_outlined, color: outlineColor),
        SizedBox(width: 4),
        Text(liked.toString(), style: outlineStyle),
        SizedBox(width: 8),
        Icon(Icons.fork_right_outlined, color: outlineColor),
        SizedBox(width: 4),
        Text(regardingPosts.toString(), style: outlineStyle),
        SizedBox(width: 8),
        Icon(Icons.chat_bubble_outline_outlined, color: outlineColor),
        SizedBox(width: 4),
        Text(comments.toString(), style: outlineStyle),
      ],
    );
  }
}
