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
@Environment(AppEnv.remoteExtension)
@LazySingleton(as: ExtensionApiService)
class GrpcExtensionApiServiceImpl implements ExtensionApiService {
  late final ExtensionApiClient _client;
  late final CacheService _cacheService;
  late final Map<String, Query> _queryMap;

  GrpcExtensionApiServiceImpl({
    required CacheService cacheService,
    required ClientChannel clientChannel,
  })  : _cacheService = cacheService,
        _client = ExtensionApiClient(clientChannel),
        _queryMap = {};

  @override
  Future<domain.Site> site(GetSiteParams params) async {
    final res = await _query(
      key: ["site", params],
      queryFn: () => _client.getSite(Empty()),
    );
    return res.site.toDomain(params.extensionPkgName);
  }

  @override
  Future<List<domain.Board>> boards(GetBoardsParams params) async {
    final res = await _query(
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
    final res = await _query(
      key: ["threadInfos", params],
      queryFn: () => _client.getThreadInfos(GetThreadInfosReq(
        siteId: params.siteId,
        boardsSorting: params.boardsSorting,
        page: PaginationReq(
          page: params.pagination?.page,
          pageSize: params.pagination?.pageSize,
        ),
        keywords: params.keywords,
      )),
    );
    return res.threadInfos.map((t) => t.toDomain(params.extensionPkgName)).toList();
  }

  @override
  Future<domain.Post> thread(GetThreadParams params) async {
    final res = await _query(
      key: ["thread", params],
      queryFn: () => _client.getThreadPost(GetThreadPostReq(
        siteId: params.siteId,
        boardId: params.boardId,
        threadId: params.threadId,
        postId: params.postId,
      )),
    );
    return res.threadPost.toDomain(params.extensionPkgName);
  }

  @override
  Future<List<domain.Post>> regardingPosts(GetRegardingPostsParams params) async {
    final res = await _query(
      key: ["regardingPosts", params],
      queryFn: () => _client.getRegardingPosts(GetRegardingPostsReq(
        siteId: params.siteId,
        boardId: params.boardId,
        threadId: params.threadId,
        replyToId: params.replyToId,
        page: PaginationReq(
          page: params.pagination?.page,
          pageSize: params.pagination?.pageSize,
        ),
      )),
    );
    return res.regardingPosts.map((p) => p.toDomain(params.extensionPkgName)).toList();
  }

  @override
  Future<List<domain.Comment>> comments(GetCommentsParams params) async {
    final res = await _query(
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

  Future<T> _query<T>({required Object key, required Future<T> Function() queryFn}) async {
    final keyStr = jsonEncode(key);
    QueryState<T> res;
    debugPrint("query $keyStr");
    try {
      if (_queryMap.containsKey(keyStr)) {
        final state = await _queryMap[keyStr]!.result;
        res = state as QueryState<T>;

      } else {
        final query = Query(
          key: keyStr,
          queryFn: queryFn,
        );
        _queryMap[keyStr] = query;
        res = await query.result;
      }
    } on GrpcError catch (e) {
      debugPrint(e.message);
      rethrow;
    } on Exception catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
    if (res.error != null) {
      throw res.error;
    }
    return res.data!;
  }

  Future<void> _refresh({required String prefix}) async {
    for (final key in _queryMap.keys) {
      if (key.startsWith('["$prefix"')) {
        await _queryMap[key]!.refetch();
      }
    }
  }

  @override
  Future<void> refreshBoards() async {
    await _refresh(prefix: "boards");
  }

  @override
  Future<void> refreshComments() async {
    await _refresh(prefix: "comments");
  }

  @override
  Future<void> refreshRegardingPosts() async {
    await _refresh(prefix: "regardingPosts");
  }

  @override
  Future<void> refreshSite() async {
    await _refresh(prefix: "site");
  }

  @override
  Future<void> refreshThread() async {
    await _refresh(prefix: "thread");
  }

  @override
  Future<void> refreshThreadInfos() async {
    await _refresh(prefix: "threadInfos");
  }
}
