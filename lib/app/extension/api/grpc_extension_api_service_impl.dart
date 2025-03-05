import 'dart:async';
import 'dart:convert';
import 'package:cached_query/cached_query.dart';
import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'package:news_hub/app/extension/api/models/transform.dart';
import 'package:news_hub/app/service/cache/cache.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/constants.dart';
import 'package:injectable/injectable.dart';

import 'models/extension_api.pbgrpc.dart';

@Environment(AppEnv.demoExtension)
@LazySingleton(as: ExtensionApiService)
class GrpcExtensionApiServiceImpl implements ExtensionApiService {
  late ExtensionApiClient _client;
  late CacheService _cacheService;

  GrpcExtensionApiServiceImpl({
    required CacheService cacheService,
  }) : _cacheService = cacheService {
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
  Future<domain.Site> site(GetSiteParams params) async {
    final res = await query(
      key: ["site", params],
      queryFn: () => _client.getSite(Empty()),
    );
    return res.site.toDomain(params.extensionPkgName);
  }

  @override
  Future<List<domain.Board>> boards(GetBoardsParams params) async {
    final res = await query(
      key: ["boards", params],
      queryFn: () => _client.getBoards(GetBoardsReq(
        siteId: params.siteId,
        page: PaginationReq(
          page: params.pagination?.page,
          pageSize: params.pagination?.pageSize,
        ),
      )),
    );
    return res.boards
        .map((b) => b.toDomain(
      params.extensionPkgName,
      params.siteId,
    ))
        .toList();
  }

  @override
  Future<List<domain.Post>> threadInfos(GetThreadInfosParams params) async {
    final res = await query(
      key: ["threadInfos", params],
      queryFn: () => _client.getThreadInfos(GetThreadInfosReq(
        siteId: params.siteId,
        boardId: params.boardId,
        page: PaginationReq(
          page: params.pagination?.page,
          pageSize: params.pagination?.pageSize,
        ),
        sortBy: params.sortBy,
        keywords: params.keywords,
      )),
    );
    return res.threadInfos.map((t) => t.toDomain(params.extensionPkgName)).toList();
  }

  @override
  Future<domain.Post> thread(GetThreadParams params) async {
    final res = await query(
      key: ["thread", params],
      queryFn: () => _client.getThreadPost(GetThreadPostReq(
        siteId: params.siteId,
        boardId: params.boardId,
        id: params.id,
        postId: params.postId,
      )),
    );
    return res.threadPost.toDomain(params.extensionPkgName);
  }

  @override
  Future<List<domain.Post>> regardingPosts(GetRegardingPostsParams params) async {
    final res = await query(
      key: ["regardingPosts", params],
      queryFn: () => _client.getRegardingPosts(GetRegardingPostsReq(
        siteId: params.siteId,
        boardId: params.boardId,
        threadId: params.threadId,
        postId: params.postId,
        page: PaginationReq(
          page: params.pagination?.page,
          pageSize: params.pagination?.pageSize,
        ),
      )),
    );
    return res.regardingPosts.map((p) => p.toDomain(params.extensionPkgName)).toList();
  }

  @override
  Future<domain.Post> post(GetPostParams params) async {
    throw UnimplementedError();
  }

  @override
  Future<List<domain.Comment>> comments(GetCommentsParams params) async {
    final res = await query(
      key: ["comments", params],
      queryFn: () => _client.getComments(GetCommentsReq(
        siteId: params.siteId,
        boardId: params.boardId,
        threadId: params.threadId,
        postId: params.postId,
        page: PaginationReq(
          page: params.pagination?.page,
          pageSize: params.pagination?.pageSize,
        ),
      )),
    );
    return res.comments.map((c) => c.toDomain(params.extensionPkgName)).toList();
  }

  Future<T> query<T>({required Object key, required Future<T> Function() queryFn}) async {
    QueryState<T> res;
    try {
      res = await Query(
        key: key,
        queryFn: queryFn,
      ).result;
      if (res.error != null) {
        throw res.error;
      }
    } on GrpcError catch (e) {
      debugPrint(e.message);
      rethrow;
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    return res.data!;
  }
}