import 'package:news_hub/domain/models/models.dart';

abstract class RepoRepository {
  Future<List<Repo>> list();
  Future<void> insert(String url);
  Future<void> delete(String baseUrl);
}
