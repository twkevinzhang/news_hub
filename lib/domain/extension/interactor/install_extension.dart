import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class InstallExtension {
  final ExtensionRepository _repository;

  InstallExtension({
    required ExtensionRepository repository,
  }) : _repository = repository;

  Stream<Pair<InstallStatus, double>> call(Extension extension) {
    return _repository.install(extension);
  }
}
