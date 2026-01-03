import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';

@lazySingleton
class RemoveExtensionRepo {
  final ExtensionRepoRepository _repo;
  RemoveExtensionRepo(this._repo);

  Future<void> call(String baseUrl) => _repo.delete(baseUrl);
}
