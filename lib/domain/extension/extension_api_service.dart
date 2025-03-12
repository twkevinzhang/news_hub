import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

abstract class ExtensionApiService {
  Future<Site> site({
    required String extensionPkgName,
  });
  Future<List<Board>> boards({
    required String extensionPkgName,
    required String siteId,
    Pagination? pagination,
  });
  Future<List<Post>> threadInfos({
    required String extensionPkgName,
    required String siteId,
    required Map<String, String>? boardsSorting,
    Pagination? pagination,
    String? sortBy,
    String? keywords,
  });
  Future<Post> thread({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  });
  Future<List<Post>> regardingPosts({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  });
  Future<List<Comment>> comments({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  });
}
