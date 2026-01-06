import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UninstallExtension {
  final ExtensionRepository _repository;

  UninstallExtension({
    required ExtensionRepository repository,
  }) : _repository = repository;

  Future<void> call(Extension extension) {
    return _repository.uninstall(extension);
  }
}
