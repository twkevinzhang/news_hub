import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:grpc/grpc.dart';
import 'package:news_hub/app/extension/api/models/extension_api.pb.dart' as pb;
import 'package:news_hub/app/extension/api/models/transform.dart';
import 'package:news_hub/shared/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:path/path.dart' as path;
import 'package:serious_python/serious_python.dart';
import 'package:injectable/injectable.dart';

import 'models/extension_api.pbgrpc.dart';

@dev
@LazySingleton(as: ExtensionApiService)
class GrpcExtensionApiServiceImpl implements ExtensionApiService {
  late ExtensionApiClient _client;
  GrpcExtensionApiServiceImpl() {
    final channel = ClientChannel(
      '127.0.0.1',
      port: 55001,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
        connectTimeout: Duration(seconds: 5),
        connectionTimeout: Duration(seconds: 5),
      ),
    );
    _client = ExtensionApiClient(channel);
  }

  @override
  Future<domain.Site> site({
    required domain.Extension extension,
  }) async {
    final res = await _client.getSite(Empty());
    return res.site.toDomain(extension.pkgName);
  }

  @override
  Future<List<domain.Board>> boards({
    Pagination? pagination,
    required domain.Extension extension,
    required String siteId,
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
              extension.pkgName,
              siteId,
            ))
        .toList();
  }

  @override
  Future<List<domain.ThreadInfo>> threadInfos({
    Pagination? pagination,
    String? sortBy,
    String? keywords,
    required domain.Extension extension,
    required String siteId,
    required String boardId,
  }) async {
    final res = await _client.getThreadInfos(GetThreadInfosReq(
      siteId: siteId,
      boardId: boardId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
      sortBy: sortBy,
      keywords: keywords,
    ));
    return res.threadInfos
        .map((t) => t.toDomain(
              extension.pkgName,
              siteId,
              boardId,
            ))
        .toList();
  }

  @override
  Future<domain.Thread> thread({
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String id,
  }) async {
    final res = await _client.getThread(GetThreadReq(
      siteId: siteId,
      boardId: boardId,
      id: id,
    ));
    return res.thread.toDomain(extension.pkgName);
  }

  @override
  Future<List<domain.Post>> regardingPosts({
    Pagination? pagination,
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String originalPostId,
  }) async {
    final res = await _client.getRegardingPosts(GetRegardingPostsReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      originalPostId: originalPostId,
      page: PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.regardingPosts.map((p) => p.toDomain(extension.pkgName)).toList();
  }

  @override
  Future<domain.Post> post({
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String id,
  }) async {
    final res = await _client.getPost(GetPostReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      id: id,
    ));
    return res.post.toDomain(extension.pkgName);
  }

  @override
  Future<List<domain.Comment>> comments({
    Pagination? pagination,
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
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
    return res.comments.map((c) => c.toDomain(extension.pkgName)).toList();
  }
}
