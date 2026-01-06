import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@injectable
class GetCollections {
  final CollectionRepository _repository;

  GetCollections(this._repository);

  Future<List<Collection>> call() {
    return _repository.list();
  }
}
