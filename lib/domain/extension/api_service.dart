part of 'index.dart';

abstract class ExtensionApiService {
  Future<void> run(Extension extension);
  Future<void> ping(Extension extension);
  Future<List<Thread>> threads(Extension extension);
  Future<Thread> thread(Extension extension, String threadId);
  Future<List<Post>> slavePosts(Extension extension, String threadId);
  Future<Post> post(Extension extension, String postId);
  Future<List<Comment>> comments(Extension extension, String postId);
}
