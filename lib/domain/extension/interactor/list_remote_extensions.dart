import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository/installed_extension_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListRemoteExtensions {
  final InstalledExtensionRepository _repository;

  ListRemoteExtensions({
    required InstalledExtensionRepository repository,
  }) : _repository = repository;

  Future<List<RemoteExtension>> call() {
    return _repository.listRemote();
  }
}
