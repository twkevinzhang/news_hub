import 'package:flutter/material.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/presentation/components/avatar/initials_avatar.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentList extends StatelessWidget {
  final List<domain.Comment> comments;
  final int totalCount;
  final bool isLoading;
  final bool showViewMoreButton;
  final VoidCallback? onViewMorePressed;

  const CommentList({
    super.key,
    required this.comments,
    this.totalCount = 0,
    this.isLoading = false,
    this.showViewMoreButton = false,
    this.onViewMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    if (comments.isEmpty && !isLoading && !showViewMoreButton) {
      return const SizedBox.shrink();
    }

    final theme = Theme.of(context);
    final commentBgColor = theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3);

    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: commentBgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...comments.map((comment) => _CommentItem(comment: comment)),
          if (isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))),
            ),
          if (showViewMoreButton && !isLoading)
            TextButton(
              onPressed: onViewMorePressed,
              style: TextButton.styleFrom(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
              ),
              child: Text(
                comments.isEmpty ? '查看留言 ($totalCount)' : '展開更多留言...',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.primary),
              ),
            ),
        ],
      ),
    );
  }
}

class _CommentItem extends StatelessWidget {
  final domain.Comment comment;

  const _CommentItem({required this.comment});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InitialsAvatar(name: comment.authorName, size: 24),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      comment.authorName,
                      style: theme.textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      timeago.format(comment.createdAt),
                      style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.outline),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  comment.contents.map((p) {
                    if (p is domain.TextParagraph) return p.content;
                    if (p is domain.ReplyToParagraph) return p.preview;
                    return '';
                  }).join('\n'),
                  style: theme.textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
