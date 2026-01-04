import 'package:news_hub/domain/extension/repository/installed_extension_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UninstallExtension {
  final InstalledExtensionRepository _repository;

  UninstallExtension({
    required InstalledExtensionRepository repository,
  }) : _repository = repository;

  Future<void> call(Extension extension) {
    return _repository.uninstall(extension);
  }
}
