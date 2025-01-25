part of 'index.dart';

abstract class SearchConfigRepository {
  Stream<List<SearchConfig>> subscribeAll();

  Future<List<SearchConfig>> getAll();

  Future<SearchConfig?> getSearchConfig(String id);

  Stream<int> getCount();

  Future<void> insertRepo({
    required String id,
    required Set<Board> enabledBoards,
    required Set<Pair<Board, String>> threadsSorting,
    required String keywords,
  });

  Future<void> upsertRepo({
    required String id,
    required Set<Board> enabledBoards,
    required Set<Pair<Board, String>> threadsSorting,
    required String keywords,
  });

  Future<void> deleteRepo(String id);
}