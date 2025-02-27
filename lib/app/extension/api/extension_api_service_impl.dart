import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
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

class ExtensionApiServiceImpl implements ExtensionApiService {
  final Dio _dio;
  ExtensionApiServiceImpl({
    required Dio dio,
  }) : _dio = dio;

  Future<Response<T>> get<T>(domain.Extension extension, String path, {Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(
      "${extension.address}/$path",
      options: Options(responseType: ResponseType.bytes),
      queryParameters: queryParameters,
    );
  }

  @override
  Future<domain.Site> site({
    required domain.Extension extension,
  }) async {
    final res = await get(extension, 'sites/komica');
    return pb.GetSiteRes.fromBuffer(res.data as Uint8List).site.toDomain(extension.pkgName);
  }

  @override
  Future<List<domain.Board>> boards({
    Pagination? pagination,
    required domain.Extension extension,
    required String siteId,
  }) async {
    final res = await get(extension, 'sites/$siteId/boards');
    return pb.GetBoardsRes.fromBuffer(res.data as Uint8List).boards.map((b) => b.toDomain(extension.pkgName, siteId)).toList();
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
    final res = await get(extension, 'sites/$siteId/boards/$boardId/thread-infos', queryParameters: {
      'page': pagination?.page,
      'pageSize': pagination?.pageSize,
      'sortBy': sortBy,
      'keywords': keywords,
    });
    return pb.GetThreadInfosRes.fromBuffer(res.data as Uint8List).threadInfos.map((t) => t.toDomain(extension.pkgName, siteId, boardId)).toList();
  }

  @override
  Future<domain.Thread> thread({
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String id,
  }) async {
    final res = await get(extension, 'sites/$siteId/boards/$boardId/threads/$id');
    return pb.GetThreadRes.fromBuffer(res.data as Uint8List).thread.toDomain(extension.pkgName);
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
    final res = await get(extension, 'sites/$siteId/boards/$boardId/threads/$threadId/posts/$originalPostId/regarding-posts', queryParameters: {
      'page': pagination?.page,
      'pageSize': pagination?.pageSize,
    });
    return pb.GetRegardingPostsRes.fromBuffer(res.data as Uint8List).regardingPosts.map((p) => p.toDomain(extension.pkgName)).toList();
  }

  @override
  Future<domain.Post> post({
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String id,
  }) async {
    final res = await get(extension, 'sites/$siteId/boards/$boardId/threads/$threadId/posts/$id');
    return pb.GetPostRes.fromBuffer(res.data as Uint8List).post.toDomain(extension.pkgName);
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
    final res = await get(extension, 'sites/$siteId/boards/$boardId/threads/$threadId/posts/$postId/comments', queryParameters: {
      'page': pagination?.page,
      'pageSize': pagination?.pageSize,
    });
    return pb.GetCommentsRes.fromBuffer(res.data as Uint8List).comments.map((c) => c.toDomain(extension.pkgName)).toList();
  }
}
