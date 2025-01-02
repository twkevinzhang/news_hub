import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/domain/extension_repo/repo/extension_repo_repository.dart';
import 'package:news_hub/domain/extension_repo/service/extension_repo_service.dart';
import 'package:collection/collection.dart';

class ListAvailableExtensions {
  final ExtensionRepoRepository _extensionRepoRepository;
  final ExtensionRepoService _extensionRepoService;
  ListAvailableExtensions({
    required ExtensionRepoRepository extensionRepoRepository,
    required ExtensionRepoService extensionRepoService,
  }): _extensionRepoRepository = extensionRepoRepository,
        _extensionRepoService = extensionRepoService;

  Future<List<AvailableExtension>> call() async {
    final repos = await _extensionRepoRepository.getAll();
    final list = await Future.wait(repos.map((repo) => _extensionRepoService.listExtensions(repo.baseUrl)));
    return list.flattened.toList();
  }
}
