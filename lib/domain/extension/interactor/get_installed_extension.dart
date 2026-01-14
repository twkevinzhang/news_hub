import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/models.dart';

@lazySingleton
class GetInstalledExtension {
  final ExtensionRepository _repository;

  GetInstalledExtension({required ExtensionRepository repository})
    : _repository = repository;

  Future<Result<Extension>> get(String extensionPkgName) async {
    try {
      final extension = await _repository.getInstalled(extensionPkgName);
      return Result.completed(extension);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
