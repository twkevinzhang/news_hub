import 'package:flutter/material.dart';
import 'package:news_hub/presentation/pages/thread_infos/widgets/post_paragraph.dart';
import 'package:news_hub/presentation/widgets/atoms/atoms.dart';
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _PostHeader(author: post.authorName, category: boardName),
        SizedBox(height: 10),
        _PostContent(contents: post.contents),
        SizedBox(height: 10),
        _PostActions(
          liked: post.like,
          threads: 0,
          comments: post.comments,
          createdAt: post.createdAt,
        ),
      ],
    );
  }
}

class _PostHeader extends StatelessWidget {
  final String author;
  final String category;
  const _PostHeader({
    super.key,
    required this.author,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(author),
                GreyText(category),
              ],
            ),
          ],
        ),
        const Icon(Icons.more_vert),
      ],
    );
  }
}

class _PostContent extends StatelessWidget {
  final List<domain.Paragraph> contents;
  const _PostContent({
    super.key,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contents.map((paragraph) {
        if (paragraph is domain.TextParagraph) {
          return TextParagraph(
            content: paragraph.content,
          );
        } else if (paragraph is domain.ImageParagraph) {
          return ImageParagraph(
            imageUrl: paragraph.thumb(),
            onClick: () => {},
          );
        } else if (paragraph is domain.VideoParagraph) {
          return VideoParagraph(
            thumb: paragraph.thumb,
            onClick: () => {},
          );
        } else if (paragraph is domain.LinkParagraph) {
          return LinkParagraph(
            text: paragraph.content,
            onClick: () => {},
          );
        } else if (paragraph is domain.ReplyToParagraph) {
          return ReplyToParagraph(
            id: paragraph.id,
            onPreviewReplyTo: (id) => 'mock id',
            onClick: () => {},
          );
        } else if (paragraph is domain.QuoteParagraph) {
          return QuoteParagraph(
            content: paragraph.content,
          );
        }
        return const SizedBox.shrink();
      }).toList(),
    );
  }
}

class _PostActions extends StatelessWidget {
  final int liked;
  final int threads;
  final int comments;
  final DateTime createdAt;
  const _PostActions({
    required this.createdAt,
    required this.liked,
    required this.threads,
    required this.comments,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GreyIcon(Icons.thumb_up_alt_outlined),
            SizedBox(width: 4),
            GreyText(liked.toString()),
            SizedBox(width: 8),
            GreyIcon(Icons.fork_right_outlined),
            SizedBox(width: 4),
            GreyText(threads.toString()),
            SizedBox(width: 8),
            GreyIcon(Icons.chat_bubble_outline_outlined),
            SizedBox(width: 4),
            GreyText(comments.toString()),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GreyText(timeago.format(createdAt)),
          ],
        ),
      ],
    );
  }
}
