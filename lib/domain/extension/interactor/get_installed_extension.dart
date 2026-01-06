import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class GetInstalledExtension {
  final ExtensionRepository _repository;

  GetInstalledExtension({
    required ExtensionRepository repository,
  }) : _repository = repository;

  Future<Extension> get(String extensionPkgName) {
    return _repository.getInstalled(extensionPkgName);
  }
}
