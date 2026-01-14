import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/models.dart';

@injectable
class GetCollection {
  final CollectionRepository _repository;

  GetCollection(this._repository);

  Future<Result<Collection>> call(String id) async {
    try {
      final collection = await _repository.get(id);
      return Result.completed(collection);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
