part of 'index.dart';

abstract class ExtensionApiService {
  Future<void> run(Extension extension);
  Future<void> ping(Extension extension);
  Future<List<Board>> boards({
    Pagination? page,
    required Extension extension,
    required String siteId,
  });
  Future<List<Thread>> threads({
    Pagination? pagination,
    String? sortBy,
    String? keywords,
    required Extension extension,
    required String siteId,
    required String boardId,
  });
  Future<Thread> thread({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
  });
  Future<List<Post>> slavePosts({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
  });
  Future<Post> post({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  });
  Future<List<Comment>> comments({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  });
}
