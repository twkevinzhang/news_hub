import 'package:dartx/src/map.dart';
import 'package:news_hub/domain/bookmark/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:injectable/injectable.dart';

// TODO: implement it
@LazySingleton(as: BookmarkRepository)
class BookmarkRepositoryImpl implements BookmarkRepository {
  @override
  Future<void> deleteRepo(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<Bookmark>> getAll() {
    throw UnimplementedError();
  }

  @override
  Stream<int> getCount() {
    throw UnimplementedError();
  }

  @override
  Future<Bookmark?> get(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertRepo({required String id, required Set<Board> enabledBoards, required Set<Pair<Board, String>> threadsSorting, required String keywords}) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Bookmark>> subscribeAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> upsertRepo({required String id, required Set<Board> enabledBoards, required Set<Pair<Board, String>> threadsSorting, required String keywords}) {
    throw UnimplementedError();
  }
}
