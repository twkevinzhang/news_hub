import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListExtensionRepos {
  final ExtensionRepoRepository _repo;
  ListExtensionRepos(this._repo);

  Future<List<ExtensionRepo>> call() => _repo.list();
}
