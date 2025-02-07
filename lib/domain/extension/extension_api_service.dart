import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

abstract class ExtensionApiService {
  Future<void> run(Extension extension);
  Future<Site> site({
    required Extension extension,
    required String siteId,
  });
  Future<List<Board>> boards({
    Pagination? pagination,
    required Extension extension,
    required String siteId,
  });
  Future<List<ThreadInfo>> threadInfos({
    Pagination? pagination,
    String? sortBy,
    String? keywords,
    required Extension extension,
    required String siteId,
    required String boardId,
  });
  Future<Thread> thread({
    required Extension extension,
    required String siteId,
    required String boardId,
    required String id,
  });
  Future<List<Post>> regardingPosts({
    Pagination? pagination,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String originalPostId,
  });
  Future<Post> post({
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String id,
  });
  Future<List<Comment>> comments({
    Pagination? pagination,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  });
}
