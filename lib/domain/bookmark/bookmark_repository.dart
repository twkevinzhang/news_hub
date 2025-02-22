import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart';

abstract class BookmarkRepository {
  Stream<List<Bookmark>> subscribeAll();

  Future<List<Bookmark>> getAll();

  Future<Bookmark?> get(String id);

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
