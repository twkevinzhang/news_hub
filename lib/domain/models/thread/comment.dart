import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/thread/paragraph/paragraph.dart';

part 'comment.freezed.dart';
part 'comment.g.dart';

@freezed
class Comment with _$Comment {
  const factory Comment({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required String postId,
    required String id,
    required String authorId,
    required String authorName,
    required List<Paragraph> contents,
    required DateTime createdAt,
  }) = _Comment;

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);
}
