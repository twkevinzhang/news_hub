import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@injectable
class UpdateCollection {
  final CollectionRepository _repository;

  UpdateCollection(this._repository);

  Future<void> call(Collection collection) {
    return _repository.update(collection);
  }
}
