import 'package:news_hub/domain/extension_repo/extension_repo_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteExtensionRepo {
    DeleteExtensionRepo({
        required ExtensionRepoRepository repository,
    })  : _repository = repository;

    final ExtensionRepoRepository _repository;

    Future<void> call(String baseUrl) {
        return _repository.delete(baseUrl);
    }
}
