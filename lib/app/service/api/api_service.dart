import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

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

  Future<int> getInstallProgress({
    required String extensionPkgName,
  });
  Future<List<Board>> listBoards({
    required String extensionPkgName,
    Pagination? pagination,
  });

  Future<List<Post>> listThreads({
    required String extensionPkgName,
    required String boardId,
    String? sort,
    Pagination? pagination,
    String? keywords,
  });

  Future<Post> getOriginalPost({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? postId,
  });

  Future<List<Post>> listReplies({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    String? parentId,
    Pagination? pagination,
  });

  Future<List<Comment>> listComments({
    required String extensionPkgName,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  });

  Future<Map<String, List<String>>> getBoardSortOptions({
    required List<Board> boards,
  });

  Future<List<RemoteExtension>> listRemoteExtensions({
    String? keyword,
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
