import 'package:news_hub/domain/models/thread/paragraph/paragraph.dart';
import 'package:news_hub/domain/models/thread/post/post.dart';
import 'package:news_hub/domain/models/thread/comment.dart';

class ArticlePost extends Post {
  final String? title;
  final String? url;
  final DateTime createdAt;
  final String authorId;
  final String authorName;
  final int? liked;
  final int? disliked;
  final List<String>? tags;
  final List<Paragraph> contents;
  final DateTime? latestReplyCreatedAt;
  final int? repliesCount;
  final List<Comment>? top5Comments;

  ArticlePost({
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
    required this.contents,
    this.latestReplyCreatedAt,
    this.repliesCount,
    this.top5Comments,
    required this.tags,
  });

  ArticlePost copyWith({List<Comment>? top5Comments, int? repliesCount}) {
    return ArticlePost(
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
      contents: contents,
      latestReplyCreatedAt: latestReplyCreatedAt,
      repliesCount: repliesCount ?? this.repliesCount,
      top5Comments: top5Comments ?? this.top5Comments,
      tags: tags,
    );
  }
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
