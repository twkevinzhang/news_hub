import 'package:news_hub/domain/models/models.dart';

abstract class SuggestionRepository {
  Stream<List<Suggestion>> subscribeList();

  Future<List<Suggestion>> list();

  Stream<int> count();

  Future<void> insert({
    required String keywords,
  });

  Future<Suggestion> upsert({
    required String keywords,
  });

  Future<void> updateLatestUsedAt(String id);

  Future<void> delete(String id);
}
