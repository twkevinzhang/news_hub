import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

abstract class ExtensionApiService {
  Future<Site> site({
    required String extensionPkgName,
  });
  Future<List<Board>> boards({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
  });
  Future<List<Post>> threadInfos({
    Pagination? pagination,
    String? sortBy,
    String? keywords,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
  });
  Future<Post> thread({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String id,
    String? postId,
  });
  Future<List<Post>> regardingPosts({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  });
  Future<Post> post({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String id,
  });
  Future<List<Comment>> comments({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  });
}
