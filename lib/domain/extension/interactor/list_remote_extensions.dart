import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';

@lazySingleton
class ListRemoteExtensions {
  final ApiService _service;
  final ExtensionRepoRepository _repo;

  ListRemoteExtensions({
    required ApiService service,
    required ExtensionRepoRepository repo,
  })  : _service = service,
        _repo = repo;

  Future<List<RemoteExtension>> call() async {
    final repos = await _repo.list();
    final List<RemoteExtension> results = [];
    for (final repo in repos) {
      try {
        final remotes = await _service.listRemoteExtensions(repoBaseUrl: repo.baseUrl);
        results.addAll(remotes);
      } catch (e) {
        // Skip failed repos
      }
    }
    return results;
  }
}
