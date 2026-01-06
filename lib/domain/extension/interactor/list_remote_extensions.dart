import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListRemoteExtensions {
  final ExtensionRepository _repository;

  ListRemoteExtensions({
    required ExtensionRepository repository,
  }) : _repository = repository;

  Future<List<RemoteExtension>> call() {
    return _repository.listRemote();
  }
}
