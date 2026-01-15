import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/thread/paragraph/paragraph.dart';
import 'package:news_hub/domain/models/thread/comment.dart';

part 'post.freezed.dart';
part 'post.g.dart';

@freezed
sealed class Post with _$Post {
  const Post._();

  const factory Post.article({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required String id,
    String? title,
    String? url,
    required DateTime createdAt,
    required String authorId,
    required String authorName,
    int? liked,
    int? disliked,
    required List<Paragraph> contents,
    DateTime? latestReplyCreatedAt,
    int? repliesCount,
    List<Comment>? top5Comments,
    List<String>? tags,
  }) = ArticlePost;

  const factory Post.singleImage({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required String id,
    String? title,
    String? url,
    required DateTime createdAt,
    required String authorId,
    required String authorName,
    int? liked,
    int? disliked,
    required List<Paragraph> contents,
    DateTime? latestReplyCreatedAt,
    int? repliesCount,
    List<Comment>? top5Comments,
    List<String>? tags,
    ImageParagraph? image,
  }) = SingleImagePost;

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
}

extension ArticlePostListEx on List<ArticlePost> {
  Iterable<ArticlePost> filterBy({required String targetId}) {
    return where(
      (post) => post.contents.any((p) {
        if (p is ReplyToParagraph) {
          return p.id == targetId;
        }
        return false;
      }),
    );
  }
}

extension SingleImagePostListEx on List<SingleImagePost> {
  Iterable<Post> filterBy({required String replyToId}) {
    return where(
      (post) => post.contents.any((p) {
        if (p is ReplyToParagraph) {
          return p.id == replyToId;
        }
        return false;
      }),
    );
  }
}
