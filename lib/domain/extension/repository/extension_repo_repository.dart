import 'package:news_hub/domain/models/models.dart';

abstract class ExtensionRepoRepository {
  Future<List<ExtensionRepo>> list();
  Stream<List<ExtensionRepo>> stream();
  Future<void> insert(ExtensionRepo repo);
  Future<void> delete(String baseUrl);
}
