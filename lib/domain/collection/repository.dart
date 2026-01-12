import 'package:news_hub/domain/models/models.dart';

abstract class CollectionRepository {
  Stream<List<Collection>> watchList();
  Future<List<Collection>> list();
  Future<Collection> get(String id);
  Future<void> create(String name, List<CollectionBoard> boards);
  Future<void> delete(String id);
  Future<void> update(Collection collection);

  Future<void> reorder(List<String> ids);
}
