import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/models.dart';

@injectable
class GetCollections {
  final CollectionRepository _repository;

  GetCollections(this._repository);

  Future<Result<List<Collection>>> call() async {
    try {
      final list = await _repository.list();
      return Result.completed(list);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
