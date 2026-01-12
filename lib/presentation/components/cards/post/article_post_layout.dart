import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/components/avatar/initials_avatar.dart';
import 'package:news_hub/presentation/components/cards/post/widgets/comment_list.dart';
import 'package:news_hub/presentation/pages/thread/detail/widgets/post_paragraph.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_hub/domain/models/models.dart' as domain;

class ArticlePostLayout extends StatelessWidget {
  final domain.ArticlePost post;
  final bool disablePlay;
  final String? floor;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;
  final FutureOr<void> Function()? onLikeClick;
  final FutureOr<void> Function()? onRepliesClick;
  final FutureOr<void> Function()? onRepliesTreeClick;
  final FutureOr<void> Function()? onCommentsClick;
  final FutureOr<void> Function()? onViewMoreComments;
  final bool isCommentsLoading;

  const ArticlePostLayout({
    super.key,
    required this.post,
    this.disablePlay = false,
    this.floor,
    this.onParagraphClick,
    this.onLikeClick,
    this.onRepliesClick,
    this.onRepliesTreeClick,
    this.onCommentsClick,
    this.onViewMoreComments,
    this.isCommentsLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PostHeader(
          postId: post.id,
          author: post.authorName,
          createdAt: post.createdAt,
          floor: floor,
        ),
        const SizedBox(height: 8),
        RichContent(
          contents: post.contents,
          disablePlay: disablePlay,
          onParagraphClick: onParagraphClick,
        ),
        const SizedBox(height: 8),
        PostActions(
          liked: post.liked,
          replies: post.repliesCount,
          onLikeClick: onLikeClick,
          onRepliesClick: onRepliesClick,
          onRepliesTreeClick: onRepliesTreeClick,
          onCommentsClick: onCommentsClick,
        ),
        CommentList(
          comments: post.top5Comments ?? [],
          totalCount: post.repliesCount ?? 0,
          isLoading: isCommentsLoading,
          showViewMoreButton: (post.repliesCount ?? 0) > 0,
          onViewMorePressed: onViewMoreComments,
        ),
        const Divider(height: 32, thickness: 0.5),
      ],
    );
  }
}

class PostHeader extends StatelessWidget {
  final String postId;
  final String author;
  final DateTime createdAt;
  final String? floor;

  const PostHeader({
    super.key,
    required this.postId,
    required this.author,
    required this.createdAt,
    this.floor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final authorStyle = theme.textTheme.titleSmall?.copyWith(
      fontWeight: FontWeight.bold,
      color: theme.colorScheme.primary,
    );
    final outlineStyle = theme.textTheme.labelSmall?.copyWith(
      color: theme.colorScheme.outline,
    );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InitialsAvatar(name: author, size: 40),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Flexible(
                    child: Text(
                      author,
                      style: authorStyle,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (floor != null) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primaryContainer,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        floor!,
                        style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onPrimaryContainer,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              Row(
                children: [
                  Text(timeago.format(createdAt), style: outlineStyle),
                  const SizedBox(width: 8),
                  Text('ID: $postId', style: outlineStyle),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          onPressed: () {}, // 更多功能
          icon: const Icon(Icons.more_horiz),
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}

class PostActions extends StatelessWidget {
  final int? liked;
  final int? replies;
  final FutureOr<void> Function()? onLikeClick;
  final FutureOr<void> Function()? onRepliesClick;
  final FutureOr<void> Function()? onRepliesTreeClick;
  final FutureOr<void> Function()? onCommentsClick;

  const PostActions({
    super.key,
    this.liked,
    this.replies,
    this.onLikeClick,
    this.onRepliesClick,
    this.onRepliesTreeClick,
    this.onCommentsClick,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _ActionButton(
              icon: Icons.thumb_up_alt_outlined,
              label: liked?.toString() ?? '讚',
              onTap: onLikeClick,
            ),
            _ActionButton(
              icon: Icons.chat_bubble_outline,
              label: '回覆',
              onTap: onRepliesClick,
            ),
            if (replies != null && replies! > 0)
              _ActionButton(
                icon: Icons.account_tree_outlined,
                label: '回覆樹',
                onTap: onRepliesTreeClick,
              ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.share_outlined, size: 20),
          onPressed: () {},
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 18, color: theme.colorScheme.outline),
            const SizedBox(width: 4),
            Text(
              label,
              style: theme.textTheme.labelMedium?.copyWith(
                color: theme.colorScheme.outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
