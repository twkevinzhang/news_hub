part of 'index.dart';

// @LazySingleton(as: ExtensionApiService)
class ExtensionApiServiceImpl extends ExtensionApiService {
  final Dio _dio;
  ExtensionApiServiceImpl({
    required Dio dio,
  }) : _dio = dio;

  @override
  Future<void> run(Extension extension) async {
    final directory = await getApplicationSupportDirectory();
    final appPath = [directory.path, installedFileFolder, extension.pkgName].toUrl();
    Directory.current = path.dirname(appPath);
    SeriousPython.runProgram([appPath, 'main.py'].toUrl(), environmentVariables: {"a": "1", "b": "2"});
    await Future.delayed(const Duration(seconds: 5)); // wait flask server launched
    await ping(extension);
  }

  @override
  Future<void> ping(Extension extension) async {
    final path = "ping";
    await _dio.get([extension.address, path].toUrl());
  }

  @override
  Future<List<Thread>> threads(Extension extension) async {
    final path = "threads";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return ThreadsDto.fromJson(decodedResponse).threads.map((e) => e.toThread()).toList();
  }

  @override
  Future<Thread> thread(Extension extension, String threadId) async {
    final path = "threads/$threadId";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return ThreadDto.fromJson(decodedResponse).toThread();
  }

  @override
  Future<List<Post>> slavePosts(Extension extension, String threadId) async {
    final path = "threads/$threadId/slave_posts";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return SlavePostsDto.fromJson(decodedResponse).slavePosts.map((e) => e.toPost()).toList();
  }

  @override
  Future<Post> post(Extension extension, String postId) async {
    final path = "posts/$postId";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return PostDto.fromJson(decodedResponse).toPost();
  }

  @override
  Future<List<Comment>> comments(Extension extension, String postId) async {
    final path = "posts/$postId/comments";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return CommentsDto.fromJson(decodedResponse).comments.map((e) => e.toComment()).toList();
  }
}
