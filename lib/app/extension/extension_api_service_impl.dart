import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:news_hub/app/extension/models/extension_api.pbgrpc.dart' as pb;
import 'package:news_hub/app/extension/models/transform.dart';
import 'package:news_hub/shared/models.dart';
import 'package:path_provider/path_provider.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:path/path.dart' as path;
import 'package:serious_python/serious_python.dart';
import 'package:injectable/injectable.dart';
import 'package:grpc/grpc.dart';

@dev
@LazySingleton(as: ExtensionApiService)
class ExtensionApiServiceImpl implements ExtensionApiService {

  pb.ExtensionApiClient _client(domain.Extension extension) {
    return pb.ExtensionApiClient(
      ClientChannel(
        extension.address,
        options: const ChannelOptions(credentials: ChannelCredentials.insecure()),
      ),
    );
  }

  @override
  Future<void> run(domain.Extension extension) async {
    final directory = await getApplicationSupportDirectory();
    final appPath = [directory.path, installedFileFolder, extension.pkgName].toUrl();
    Directory.current = path.dirname(appPath);
    SeriousPython.runProgram([appPath, 'main.py'].toUrl(), environmentVariables: {"a": "1", "b": "2"});
    await Future.delayed(const Duration(seconds: 5)); // wait flask server launched
    await ping(extension);
  }

  @override
  Future<void> ping(domain.Extension extension) async {
    final path = "ping";
    throw UnimplementedError();
  }

  @override
  Future<List<domain.Board>> boards({
    Pagination? pagination,
    required domain.Extension extension,
    required String siteId,
  }) async {
    return _client(extension).getBoards(pb.GetBoardsReq(
      siteId: siteId,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    )).then((value) => value.boards.map((e) => e.toDomain(extension.pkgName)).toList());
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
    return _client(extension).getThreadInfos(pb.GetThreadInfosReq(
      siteId: siteId,
      boardId: boardId,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
      sortBy: sortBy,
      keywords: keywords,
    )).then((value) => value.threadInfos.map((e) => e.toDomain(extension.pkgName)).toList());
  }

  @override
  Future<domain.Thread> thread({
    Pagination? pagination,
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String id,
  }) async {
    return _client(extension).getThread(pb.GetThreadReq(
      siteId: siteId,
      boardId: boardId,
      id: id,
    )).then((value) => value.thread.toDomain(extension.pkgName));
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
    return _client(extension).getRegardingPosts(pb.GetRegardingPostsReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      originalPostId: originalPostId,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    )).then((value) => value.regardingPosts.map((e) => e.toDomain(extension.pkgName)).toList());
  }

  @override
  Future<domain.Post> post({
    required domain.Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String id,
  }) async {
    return _client(extension).getPost(pb.GetPostReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      id: id,
    )).then((value) => value.post.toDomain(extension.pkgName));
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
    return _client(extension).getComments(pb.GetCommentsReq(
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    )).then((value) => value.comments.map((e) => e.toDomain(extension.pkgName)).toList());
  }
}
