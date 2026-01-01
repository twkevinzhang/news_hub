import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:news_hub/app/service/api/models/transform.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/models.dart';

import 'models/extension_api.pbgrpc.dart';

@lazySingleton
class SidecarApi {
  late final SidecarApiClient _client;

  SidecarApi({
    required ClientChannel clientChannel,
  }) : _client = SidecarApiClient(clientChannel);

  @override
  Future<domain.Site> site({
    required String extensionPkgName,
  }) async {
    final res = await _client.getSite(GetSiteReq(pkgName: extensionPkgName));
    return res.site.toDomain();
  }

  @override
  Future<List<domain.Board>> boards({
    required String extensionPkgName,
    required String siteId,
    Pagination? pagination,
  }) async {
    final res = await _client.getBoards(GetBoardsReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.boards.map((b) => b.toDomain()).toList();
  }

  @override
  Future<List<domain.Post>> threadList({
    required String extensionPkgName,
    required String siteId,
    required Map<String, String>? boardsSorting,
    Pagination? pagination,
    String? sortBy,
    String? keywords,
  }) async {
    final res = await _client.getThreadList(GetThreadListReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      boardsSorting: boardsSorting,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
      keywords: keywords,
    ));
    return res.threadList.map((t) => t.toDomain()).toList();
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
      pkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
    ));
    return res.threadPost.toDomain();
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
      pkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      replyToId: replyToId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.regardingPosts.map((p) => p.toDomain()).toList();
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
      pkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.comments.map((c) => c.toDomain()).toList();
  }
}
