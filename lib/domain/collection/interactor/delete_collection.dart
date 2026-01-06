import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';

@injectable
class DeleteCollection {
  final CollectionRepository _repository;

  DeleteCollection(this._repository);

  Future<void> call(String id) {
    return _repository.delete(id);
  }
}
