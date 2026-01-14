import 'package:news_hub/domain/models/thread/paragraph/paragraph.dart';
import 'package:news_hub/domain/models/thread/post/post.dart';
import 'package:news_hub/domain/models/thread/comment.dart';

class SingleImagePost extends Post {
  final String? title;
  final String? url;
  final DateTime createdAt;
  final String authorId;
  final String authorName;
  final int? liked;
  final int? disliked;
  final List<String>? tags;
  final ImageParagraph? image;
  final List<Paragraph> contents;
  final DateTime? latestReplyCreatedAt;
  final int? repliesCount;
  final List<Comment>? top5Comments;

  SingleImagePost({
    required super.extensionPkgName,
    required super.boardId,
    required super.threadId,
    required super.id,
    this.title,
    this.url,
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    required this.liked,
    required this.disliked,
    required this.image,
    required this.contents,
    this.latestReplyCreatedAt,
    this.repliesCount,
    this.top5Comments,
    required this.tags,
  });

  SingleImagePost copyWith({List<Comment>? top5Comments, int? repliesCount}) {
    return SingleImagePost(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      id: id,
      title: title,
      url: url,
      createdAt: createdAt,
      authorId: authorId,
      authorName: authorName,
      liked: liked,
      disliked: disliked,
      image: image,
      contents: contents,
      latestReplyCreatedAt: latestReplyCreatedAt,
      repliesCount: repliesCount ?? this.repliesCount,
      top5Comments: top5Comments ?? this.top5Comments,
      tags: tags,
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
