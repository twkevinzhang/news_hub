import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@injectable
class GetCollection {
  final CollectionRepository _repository;

  GetCollection(this._repository);

  Future<Collection> call(String id) {
    return _repository.get(id);
  }
}
