import 'package:news_hub/domain/models/models.dart';

abstract class ExtensionRepoRepository {
  Future<List<ExtensionRepo>> list();
  Future<void> insert(String url);
  Future<void> delete(String baseUrl);
}
