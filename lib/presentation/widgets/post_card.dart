import 'package:flutter/material.dart';
import 'package:news_hub/presentation/widgets/post_paragraph.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_hub/domain/model/index.dart';

import 'm3/m3.dart';

class PostCard extends StatelessWidget {
  final Post post;
  final String boardName;
  const PostCard({
    super.key,
    required this.post,
    required this.boardName,
});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PostHeader(author: post.posterName, category: boardName),
            SizedBox(height: 10),
            _PostContent(contents: post.contents),
            SizedBox(height: 10),
            _PostActions(createdAt: post.createdAt),
          ],
        ),
      ),
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
                SubText(category),
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
  final List<Paragraph> contents;
  const _PostContent({
    super.key,
    required this.contents,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: contents.map((paragraph) {
        if (paragraph is ApiText) {
          return TextParagraph(
            content: paragraph.content,
          );
        } else if (paragraph is ApiImage) {
          return ImageParagraph(
            imageUrl: paragraph.thumb(),
            onClick: () => {},
          );
        } else if (paragraph is ApiVideo) {
          return VideoParagraph(
            thumb: paragraph.thumb,
            onClick: () => {},
          );
        } else if (paragraph is Link) {
          return LinkParagraph(
            text: paragraph.content,
            onClick: () => {},
          );
        } else if (paragraph is ReplyTo) {
          return ReplyToParagraph(
            id: paragraph.id,
            onPreviewReplyTo: (id) => 'mock id',
            onClick: () => {},
          );
        } else if (paragraph is Quote) {
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
  final DateTime createdAt;
  const _PostActions({
    super.key,
    required this.createdAt,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GreyIcon(Icons.thumb_up_alt_outlined),
            SizedBox(width: 8),
            GreyIcon(Icons.fork_left_outlined),
            SizedBox(width: 8),
            GreyIcon(Icons.chat_bubble_outline),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SubText(timeago.format(createdAt)),
          ],
        ),
      ],
    );
  }
}
