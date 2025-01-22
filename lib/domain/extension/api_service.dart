part of 'index.dart';

abstract class ExtensionApiService {
  Future<void> run(Extension extension);
  Future<void> ping(Extension extension);
  Future<List<Board>> boards(Extension extension, String siteId);
  Future<List<Thread>> threads(Extension extension, String siteId, String boardId);
  Future<Thread> thread(Extension extension, String siteId, String boardId, String threadId);
  Future<List<Post>> slavePosts(Extension extension, String siteId, String boardId, String threadId);
  Future<Post> post(Extension extension, String siteId, String boardId, String threadId, String postId);
  Future<List<Comment>> comments(Extension extension, String siteId, String boardId, String threadId, String postId);
}
