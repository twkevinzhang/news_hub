import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository/extension_repo_repository.dart';

@lazySingleton
class AddExtensionRepo {
  final ExtensionRepoRepository _repo;
  AddExtensionRepo(this._repo);

  Future<void> call({
    required String url,
  }) {
    return _repo.insert(url);
  }
}
