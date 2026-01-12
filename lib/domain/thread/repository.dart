import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

abstract class ThreadRepository {
  Future<List<Post>> listThreads({
    required String extensionPkgName,
    required String boardId,
    String? sort,
    Pagination? pagination,
    String? keywords,
  });

  Future<Post> getOriginalPost({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? postId,
  });

  Future<List<Post>> listReplies({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? parentId,
    Pagination? pagination,
  });

  Future<List<Comment>> listComments({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  });
}
