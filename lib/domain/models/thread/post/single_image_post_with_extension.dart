import 'package:news_hub/domain/models/extension/extension.dart';
import 'package:news_hub/domain/models/board/board.dart';
import 'package:news_hub/domain/models/thread/post/single_image_post.dart';

class SingleImagePostWithExtension extends SingleImagePost {
  final Extension extension;
  final Board board;

  SingleImagePostWithExtension({
    required SingleImagePost post,
    required this.extension,
    required this.board,
  }) : super(
         extensionPkgName: post.extensionPkgName,
         boardId: post.boardId,
         threadId: post.threadId,
         id: post.id,
         title: post.title,
         url: post.url,
         createdAt: post.createdAt,
         authorId: post.authorId,
         authorName: post.authorName,
         liked: post.liked,
         disliked: post.disliked,
         image: post.image,
         contents: post.contents,
         tags: post.tags,
         latestReplyCreatedAt: post.latestReplyCreatedAt,
         repliesCount: post.repliesCount,
       );
}
