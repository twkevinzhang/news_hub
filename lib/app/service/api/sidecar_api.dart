import 'dart:async';
import 'package:grpc/grpc.dart';
import 'package:news_hub/app/service/api/models/transform.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/constants.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/models.dart';

import 'models/sidecar_api.pbgrpc.dart';

@lazySingleton
class SidecarApi implements ApiService {
  late final SidecarApiClient _client;

  SidecarApi({
    required ClientChannel clientChannel,
  }) : _client = SidecarApiClient(clientChannel);

  @override
  Future<domain.Site> getSite({
    required String extensionPkgName,
  }) async {
    final res = await _client.getSite(GetSiteReq(pkgName: extensionPkgName));
    return res.site.toDomain();
  }

  @override
  Future<List<domain.Board>> listBoards({
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
  Future<List<domain.Post>> listThreads({
    required String extensionPkgName,
    required String siteId,
    required Map<String, String>? boardsSorting,
    Pagination? pagination,
    String? sortBy,
    String? keywords,
  }) async {
    final res = await _client.getThreadInfos(GetThreadInfosReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      boardsSorting: boardsSorting,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
      keywords: keywords,
    ));
    return res.listThreads.map((t) => t.toDomain()).toList();
  }

  @override
  Future<domain.Post> getThread({
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
  Future<List<domain.Post>> listRegardingPosts({
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
  Future<List<domain.Comment>> listComments({
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

  @override
  Future<List<domain.Site>> getInstallProgress({required String extensionPkgName}) {
    // TODO: implement getInstallProgress
    throw UnimplementedError();
  }

  @override
  Future<domain.Extension> getInstalledExtension({required String extensionPkgName}) {
    // TODO: implement getInstalledExtension
    throw UnimplementedError();
  }

  @override
  Future<void> installExtension({required domain.Extension extension}) {
    // TODO: implement installExtension
    throw UnimplementedError();
  }

  @override
  Future<List<domain.Extension>> listInstalledExtensions() {
    // TODO: implement listInstalledExtensions
    throw UnimplementedError();
  }

  @override
  Future<void> uninstallExtension({required domain.Extension extension}) {
    // TODO: implement uninstallExtension
    throw UnimplementedError();
  }
}
