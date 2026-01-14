import 'package:news_hub/domain/models/thread/paragraph/paragraph.dart';

class Comment {
  final String extensionPkgName;
  final String boardId;
  final String threadId;
  final String postId;
  final String id;
  final String authorId;
  final String authorName;
  final List<Paragraph> contents;
  final DateTime createdAt;

  Comment({
    required this.extensionPkgName,
    required this.boardId,
    required this.threadId,
    required this.postId,
    required this.id,
    required this.contents,
    required this.authorId,
    required this.authorName,
    required this.createdAt,
  });
}
