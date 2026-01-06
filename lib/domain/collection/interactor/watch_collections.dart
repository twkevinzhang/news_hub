import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@injectable
class WatchCollections {
  final CollectionRepository _repository;

  WatchCollections(this._repository);

  Stream<List<Collection>> call() {
    return _repository.watchList();
  }
}
