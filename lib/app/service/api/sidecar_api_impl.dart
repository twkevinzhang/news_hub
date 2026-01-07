import 'dart:async';

import 'package:news_hub/app/service/api/models/transform.dart';
import 'package:news_hub/app/service/connection/grpc_connection_manager_impl.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:injectable/injectable.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/shared/models.dart';

import 'models/sidecar_api.pbgrpc.dart';
import 'models/sidecar_api.pb.dart' as pb;

@LazySingleton(as: ApiService)
class SidecarApiImpl implements ApiService {
  SidecarApiClient get _client => SidecarApiClient(sl<GrpcConnectionManagerImpl>().getChannel());

  SidecarApiImpl();

  @override
  Future<domain.Site> getSite({
    required String extensionPkgName,
  }) async {
    final res = await _client.getSite(pb.GetSiteReq(pkgName: extensionPkgName));
    return res.site.toSiteDomain();
  }

  @override
  Future<List<domain.Board>> listBoards({
    required String extensionPkgName,
    required String siteId,
    Pagination? pagination,
  }) async {
    final res = await _client.getBoards(pb.GetBoardsReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.boards.map((b) => b.toBoardDomain()).toList();
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
    final res = await _client.getThreadInfos(pb.GetThreadInfosReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      boardsSorting: boardsSorting,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
      keywords: keywords,
    ));
    return res.threadInfos.map((t) => t.toPostDomain()).toList();
  }

  @override
  Future<domain.Post> getThread({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    final res = await _client.getThreadPost(pb.GetThreadPostReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
    ));
    return res.threadPost.toPostDomain();
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
    final res = await _client.getRegardingPosts(pb.GetRegardingPostsReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      replyToId: replyToId,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.regardingPosts.map((p) => p.toPostDomain()).toList();
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
    final res = await _client.getComments(pb.GetCommentsReq(
      pkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      postId: postId,
      page: pb.PaginationReq(
        page: pagination?.page,
        pageSize: pagination?.pageSize,
      ),
    ));
    return res.comments.map((c) => c.toCommentDomain()).toList();
  }

  @override
  Future<List<domain.Site>> getInstallProgress({required String extensionPkgName}) async {
    final res = await _client.getInstallProgress(pb.GetInstallProgressReq(pkgName: extensionPkgName));
    return res.sites.map((s) => s.toSiteDomain()).toList();
  }

  @override
  Future<domain.Extension> getInstalledExtension({required String extensionPkgName}) async {
    final res = await _client.getInstalledExtension(pb.GetInstalledExtensionReq(pkgName: extensionPkgName));
    return res.extension_1.toExtensionDomain();
  }

  @override
  Future<void> installExtension({required domain.Extension extension}) async {
    await _client.installExtension(pb.InstallExtensionReq(
      pkgName: extension.pkgName,
      zipName: extension.zipName,
      repoUrl: extension.repoUrl,
    ));
  }

  @override
  Future<List<domain.Extension>> listInstalledExtensions() async {
    final res = await _client.listInstalledExtensions(pb.Empty());
    return res.extensions.map((e) => e.toExtensionDomain()).toList();
  }

  @override
  Future<void> uninstallExtension({required domain.Extension extension}) async {
    await _client.uninstallExtension(pb.UninstallExtensionReq(pkgName: extension.pkgName));
  }

  @override
  Future<List<domain.RemoteExtension>> listRemoteExtensions({String? keyword}) async {
    final res = await _client.listRemoteExtensions(pb.ListRemoteExtensionsReq(keyword: keyword));
    return res.extensions.map((e) => e.toRemoteExtensionDomain()).toList();
  }

  // Health Check
  @override
  Stream<domain.HealthCheckResult> watchHealth() {
    return _client.watchHealth(pb.HealthCheckReq()).map((res) => res.toHealthCheckResultDomain());
  }

  @override
  Future<domain.HealthCheckResult> healthCheck() async {
    final res = await _client.healthCheck(pb.HealthCheckReq());
    return res.toHealthCheckResultDomain();
  }

  // Logs
  @override
  Stream<domain.LogEntry> watchLogs({domain.LogLevel minLevel = domain.LogLevel.info}) {
    final res = _client.watchLogs(pb.WatchLogsReq(minLevel: minLevel.toPbLogLevel()));
    return res.map((l) => l.toLogEntryDomain());
  }

  // Extension Repository operations
  @override
  Future<List<domain.Repo>> listRepos() async {
    final res = await _client.listExtensionRepos(pb.Empty());
    return res.repos.map((r) => r.toRepoDomain()).toList();
  }

  @override
  Future<void> addRepo({required String url, String? displayName}) async {
    await _client.addExtensionRepo(pb.AddExtensionRepoReq(url: url, displayName: displayName));
  }

  @override
  Future<void> removeRepo({required String url}) async {
    await _client.removeExtensionRepo(pb.RemoveExtensionRepoReq(url: url));
  }
}
