import 'package:injectable/injectable.dart';
import 'package:news_hub/app/service/api/api_service.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

@LazySingleton(as: ThreadRepository)
class ThreadRepositoryImpl implements ThreadRepository {
  final ApiService _apiService;

  ThreadRepositoryImpl(this._apiService);

  @override
  Future<List<Post>> listThreads({
    required String extensionPkgName,
    required String boardId,
    String? sort,
    Pagination? pagination,
    String? keywords,
  }) {
    return _apiService.listThreads(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      sort: sort,
      pagination: pagination,
      keywords: keywords,
    );
  }

  @override
  Future<Post> getOriginalPost({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? postId,
  }) {
    return _apiService.getOriginalPost(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
    );
  }

  @override
  Future<List<Post>> listReplies({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  }) {
    return _apiService.listReplies(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      replyToId: replyToId,
      pagination: pagination,
    );
  }
}
