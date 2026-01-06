import 'package:news_hub/shared/models.dart';

import 'models/models.dart';

abstract class ApiService {
  Stream<HealthCheckResult> watchHealth();

  Future<HealthCheckResult> healthCheck();

  Stream<LogEntry> watchLogs({LogLevel minLevel});

  Future<List<Extension>> listInstalledExtensions();

  Future<Extension> getInstalledExtension({
    required String extensionPkgName,
  });

  Future<void> installExtension({
    required Extension extension,
  });

  Future<void> uninstallExtension({
    required Extension extension,
  });

  Future<List<Site>> getInstallProgress({
    required String extensionPkgName,
  });

  Future<Site> getSite({
    required String extensionPkgName,
  });

  Future<List<Board>> listBoards({
    required String extensionPkgName,
    required String siteId,
    Pagination? pagination,
  });

  Future<List<Post>> listThreads({
    required String extensionPkgName,
    required String siteId,
    required Map<String, String>? boardsSorting,
    Pagination? pagination,
    String? sortBy,
    String? keywords,
  });

  Future<Post> getThread({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  });

  Future<List<Post>> listRegardingPosts({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  });

  Future<List<Comment>> listComments({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  });

  Future<List<RemoteExtension>> listRemoteExtensions({
    required String repoBaseUrl,
  });

  // Extension Repository operations
  Future<List<Repo>> listRepos();

  Future<void> addRepo({
    required String url,
  });

  Future<void> removeRepo({
    required String url,
  });
}
