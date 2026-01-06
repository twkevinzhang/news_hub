import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@injectable
class CreateCollection {
  final CollectionRepository _repository;

  CreateCollection(this._repository);

  Future<void> call({required String name, required List<Board> boards}) {
    return _repository.create(name, boards);
  }
}
