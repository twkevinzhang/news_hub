import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository/installed_extension_repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class InstallExtension {
  final InstalledExtensionRepository _repository;

  InstallExtension({
    required InstalledExtensionRepository repository,
  }) : _repository = repository;

  Stream<Pair<InstallStatus, double>> call(Extension extension) {
    return _repository.install(extension);
  }
}
