import 'package:news_hub/domain/model/index.dart';
import 'package:injectable/injectable.dart';

import '../repository.dart';

@lazySingleton
class ListExtensionRepo {
    ListExtensionRepo({
        required ExtensionRepoRepository repository,
    })  : _repository = repository;

    final ExtensionRepoRepository _repository;

    Stream<List<ExtensionRepo>> asStream() {
        return _repository.subscribeAll();
    }
}
