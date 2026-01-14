import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListRemoteExtensions {
  final ExtensionRepository _repository;

  ListRemoteExtensions({required ExtensionRepository repository})
    : _repository = repository;

  Future<Result<List<RemoteExtension>>> call() async {
    try {
      final list = await _repository.listRemote();
      return Result.completed(list);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
