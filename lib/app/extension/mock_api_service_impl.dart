part of 'index.dart';

@LazySingleton(as: ExtensionApiService)
class MockExtensionApiServiceImpl extends ExtensionApiService {
  @override
  Future<void> run(Extension extension) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> ping(Extension extension) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<Board>> boards(Extension extension, String siteId) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Board>.generate(3, (index) => Board.mock());
  }

  @override
  Future<List<Thread>> threads(Extension extension, String siteId, String boardId) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Thread>.generate(3, (index) => Thread.mock());
  }

  @override
  Future<Thread> thread(Extension extension, String siteId, String boardId, String threadId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Thread.mock();
  }

  @override
  Future<List<Post>> slavePosts(Extension extension, String siteId, String boardId, String threadId) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Post>.generate(3, (index) => Post.mock());
  }

  @override
  Future<Post> post(Extension extension, String siteId, String boardId, String threadId, String postId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Post.mock();
  }

  @override
  Future<List<Comment>> comments(Extension extension, String siteId, String boardId, String threadId, String postId) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Comment>.generate(3, (index) => Comment.mock());
  }
}
