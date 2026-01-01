import 'package:news_hub/domain/models/models.dart';

abstract class CollectionRepository {
  Stream<List<Collection>> watchCollections();
  Future<List<Collection>> getCollections();
  Future<void> createCollection(String name, List<Board> boards);
  Future<void> deleteCollection(String id);
  Future<void> updateCollection(Collection collection);
}
