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
  Future<List<Thread>> threads(Extension extension) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Thread>.generate(3, (index) => Thread.mock());
  }

  @override
  Future<Thread> thread(Extension extension, String threadId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Thread.mock();
  }

  @override
  Future<List<Post>> slavePosts(Extension extension, String threadId) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Post>.generate(3, (index) => Post.mock());
  }

  @override
  Future<Post> post(Extension extension, String postId) async {
    await Future.delayed(const Duration(seconds: 1));
    return Post.mock();
  }

  @override
  Future<List<Comment>> comments(Extension extension, String postId) async {
    throw UnimplementedError();
  }
}
