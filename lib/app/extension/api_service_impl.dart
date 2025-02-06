import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_hub/shared/model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/app/model/index.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:path/path.dart' as path;
import 'package:serious_python/serious_python.dart';
import 'package:injectable/injectable.dart';

// TODO: replace with Chopper library
@dev
@LazySingleton(as: ExtensionApiService)
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
  Future<List<Board>> boards({
    Pagination? page,
    required Extension extension,
    required String siteId,
  }) async {
    final path = "sites/$siteId/boards";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return BoardsDto.fromJson(decodedResponse).boards.map((e) => e.toBoard()).toList();
  }

  @override
  Future<List<Thread>> threads({
    Pagination? pagination,
    String? sortBy,
    String? keywords,
    required Extension extension,
    required String siteId,
    required String boardId,
  }) async {
    final path = "sites/$siteId/boards/$boardId/threads";
    final queryParameters = {
      if (sortBy != null) "sort_by": sortBy,
      if (keywords != null) "keywords": keywords,
    };
    final res = await _dio.get([extension.address, path].toUrl(), queryParameters: queryParameters);
    final decodedResponse = jsonDecode(res.data);
    return ThreadsDto.fromJson(decodedResponse).threads.map((e) => e.toThread()).toList();
  }

  @override
  Future<Thread> thread({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
  }) async {
    final path = "sites/$siteId/boards/$boardId/threads/$threadId";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return ThreadDto.fromJson(decodedResponse).toThread();
  }

  @override
  Future<List<Post>> slavePosts({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
  }) async {
    final path = "sites/$siteId/boards/$boardId/threads/$threadId/slave_posts";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return SlavePostsDto.fromJson(decodedResponse).slavePosts.map((e) => e.toPost()).toList();
  }

  @override
  Future<Post> post({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  }) async {
    final path = "sites/$siteId/boards/$boardId/threads/$threadId/posts/$postId";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return PostDto.fromJson(decodedResponse).toPost();
  }

  @override
  Future<List<Comment>> comments({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  }) async {
    final path = "sites/$siteId/boards/$boardId/threads/$threadId/posts/$postId/comments";
    final res = await _dio.get([extension.address, path].toUrl());
    final decodedResponse = jsonDecode(res.data);
    return CommentsDto.fromJson(decodedResponse).comments.map((e) => e.toComment()).toList();
  }
}
