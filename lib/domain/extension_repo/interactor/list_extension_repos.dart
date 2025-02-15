import 'package:news_hub/domain/extension_repo/extension_repo_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ListExtensionRepo {
    ListExtensionRepo({
        required ExtensionRepoRepository repository,
    })  : _repository = repository;

    final ExtensionRepoRepository _repository;

    Stream<List<ExtensionRepo>> asStream() {
        return _repository.subscribeList();
    }

    Future<List<ExtensionRepo>> asFuture() {
        return _repository.list();
    }
}
