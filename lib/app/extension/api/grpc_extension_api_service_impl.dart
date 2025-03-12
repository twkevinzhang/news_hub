import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:news_hub/app/extension/api/models/transform.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/models.dart';

import 'models/extension_api.pbgrpc.dart';

@Environment(AppEnv.demoExtension)
@Environment(AppEnv.remoteExtension)
@LazySingleton(as: ExtensionApiService)
class GrpcExtensionApiServiceImpl implements ExtensionApiService {
  late final ExtensionApiClient _client;

  GrpcExtensionApiServiceImpl({
    required ClientChannel clientChannel,
  })  : _client = ExtensionApiClient(clientChannel);

  @override
  Future<domain.Site> site({
    required String extensionPkgName,
  }) async {
    final res = await _client.getSite(Empty());
    return res.site.toDomain(extensionPkgName);
  }

  @override
  Future<List<domain.Board>> boards({
    required String extensionPkgName,
    required String siteId,
    Pagination? pagination,
  }) async {
    final res = await _client.getBoards(GetBoardsReq(
      siteId: siteId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.boards
        .map((b) => b.toDomain(
              extensionPkgName,
              siteId,
            ))
        .toList();
  }

  @override
  Future<List<domain.Post>> threadInfos({
    required String extensionPkgName,
    required String siteId,
    required Map<String, String>? boardsSorting,
    Pagination? pagination,
    String? sortBy,
    String? keywords,
  }) async {
    final res = await _client.getThreadInfos(GetThreadInfosReq(
      siteId: siteId,
      boardsSorting: boardsSorting,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
      keywords: keywords,
    ));
    return res.threadInfos.map((t) => t.toDomain(extensionPkgName)).toList();
  }

  @override
  Future<domain.Post> thread({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    final res = await _client.getThreadPost(GetThreadPostReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
    ));
    return res.threadPost.toDomain(extensionPkgName);
  }

  @override
  Future<List<domain.Post>> regardingPosts({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  }) async {
    final res = await _client.getRegardingPosts(GetRegardingPostsReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      replyToId: replyToId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.regardingPosts.map((p) => p.toDomain(extensionPkgName)).toList();
  }

  @override
  Future<List<domain.Comment>> comments({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  }) async {
    final res = await _client.getComments(GetCommentsReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.comments.map((c) => c.toDomain(extensionPkgName)).toList();
  }
}
