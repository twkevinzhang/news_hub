import 'package:news_hub/domain/models/models.dart';

abstract class CollectionRepository {
  Stream<List<Collection>> watchList();
  Future<List<Collection>> list();
  Future<void> create(String name, List<Board> boards);
  Future<void> delete(String id);
  Future<void> update(Collection collection);
}
