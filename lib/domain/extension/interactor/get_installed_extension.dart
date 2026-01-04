import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository/installed_extension_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class GetInstalledExtension {
  final InstalledExtensionRepository _repository;

  GetInstalledExtension({
    required InstalledExtensionRepository repository,
  }) : _repository = repository;

  Future<Extension> get(String extensionPkgName) {
    return _repository.getInstalled(extensionPkgName);
  }
}
