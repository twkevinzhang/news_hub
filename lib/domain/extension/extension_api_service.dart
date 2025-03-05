import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

part 'extension_api_service.freezed.dart';
part 'extension_api_service.g.dart';

abstract class ExtensionApiService {
  Future<Site> site(GetSiteParams params);
  Future<List<Board>> boards(GetBoardsParams params);
  Future<List<Post>> threadInfos(GetThreadInfosParams params);
  Future<Post> thread(GetThreadParams params);
  Future<List<Post>> regardingPosts(GetRegardingPostsParams params);
  Future<Post> post(GetPostParams params);
  Future<List<Comment>> comments(GetCommentsParams params);
}

@Freezed(toJson: true)
class GetSiteParams with _$GetSiteParams {
  const factory GetSiteParams({
    required String extensionPkgName,
  }) = _GetSiteParams;
}

@Freezed(toJson: true)
class GetBoardsParams with _$GetBoardsParams {
  const factory GetBoardsParams({
    required String extensionPkgName,
    required String siteId,
    Pagination? pagination,
  }) = _GetBoardsParams;
}

@Freezed(toJson: true)
class GetThreadInfosParams with _$GetThreadInfosParams {
  const factory GetThreadInfosParams({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    Pagination? pagination,
    String? sortBy,
    String? keywords,
  }) = _GetThreadInfosParams;
}

@Freezed(toJson: true)
class GetThreadParams with _$GetThreadParams {
  const factory GetThreadParams({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String id,
    String? postId,
  }) = _GetThreadParams;
}

@Freezed(toJson: true)
class GetRegardingPostsParams with _$GetRegardingPostsParams {
  const factory GetRegardingPostsParams({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
    Pagination? pagination,
  }) = _GetRegardingPostsParams;
}

@Freezed(toJson: true)
class GetPostParams with _$GetPostParams {
  const factory GetPostParams({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String id,
  }) = _GetPostParams;
}

@Freezed(toJson: true)
class GetCommentsParams with _$GetCommentsParams {
  const factory GetCommentsParams({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  }) = _GetCommentsParams;
}
