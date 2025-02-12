import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListRemoteExtensions {
  final ExtensionRepoRepository _extensionRepoRepository;
  final ExtensionRepoApiService _extensionApiService;
  ListRemoteExtensions({
    required ExtensionRepoRepository extensionRepoRepository,
    required ExtensionRepoApiService extensionApiService,
  }): _extensionRepoRepository = extensionRepoRepository,
        _extensionApiService = extensionApiService;

  Future<List<RemoteExtension>> call() async {
    final repos = await _extensionRepoRepository.list();
    final list = await Future.wait(repos.map((repo) => _extensionApiService.extensions(repo.baseUrl)));
    return list.flatten();
  }
}
