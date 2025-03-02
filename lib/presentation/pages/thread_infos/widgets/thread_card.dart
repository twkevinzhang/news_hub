import 'package:flutter/material.dart';
import 'package:news_hub/domain/thread/interactor/list_thread_infos.dart';
import 'package:news_hub/presentation/pages/thread_detail/widgets/post_paragraph.dart';
import 'package:news_hub/presentation/widgets/atoms/atoms.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:news_hub/domain/models/models.dart' as domain;

class ThreadInfoCard extends StatelessWidget {
  final ThreadInfoWithExtension thread;
  const ThreadInfoCard({
    super.key,
    required this.thread,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ThreadHeader(
            author: thread.authorName,
            boardName: thread.board.name,
          ),
          const SizedBox(height: 8),
          _ThreadTitle(title: thread.title),
          if (thread.previewContent.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: _ThreadPreview(content: thread.previewContent),
            ),
          const SizedBox(height: 10),
          _ThreadFooter(
            createdAt: thread.createdAt,
            commentCount: thread.regardingPostCount,
            tags: thread.tags,
          ),
        ],
      ),
    );
  }
}

class _ThreadHeader extends StatelessWidget {
  final String author;
  final String boardName;
  const _ThreadHeader({
    super.key,
    required this.author,
    required this.boardName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey,
              child: Icon(Icons.person, color: Colors.white, size: 20),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  author,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GreyText(boardName),
              ],
            ),
          ],
        ),
        const Icon(Icons.more_vert, size: 18),
      ],
    );
  }
}

class _ThreadTitle extends StatelessWidget {
  final String title;
  const _ThreadTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ThreadPreview extends StatelessWidget {
  final String content;
  const _ThreadPreview({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: const TextStyle(fontSize: 14),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}

class _ThreadFooter extends StatelessWidget {
  final DateTime createdAt;
  final int commentCount;
  final List<String>? tags;

  const _ThreadFooter({
    super.key,
    required this.createdAt,
    required this.commentCount,
    this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // 添加这一行来解决无限宽度约束问题
      mainAxisSize: MainAxisSize.max,
      children: [
        // 包装在 Flexible 中，限制左侧内容的宽度
        Flexible(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GreyIcon(Icons.chat_bubble_outline_outlined),
              const SizedBox(width: 4),
              GreyText(commentCount.toString()),
              if (tags != null && tags!.isNotEmpty) ...[
                const SizedBox(width: 12),
                _buildTags(),
              ],
            ],
          ),
        ),
        // 右侧时间戳
        GreyText(timeago.format(createdAt)),
      ],
    );
  }

  Widget _buildTags() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GreyIcon(Icons.label_outline),
        const SizedBox(width: 4),
        // 使用 ConstrainedBox 代替 Flexible
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 100),
          child: Text(
            tags!.take(2).join(', ') + (tags!.length > 2 ? '...' : ''),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}