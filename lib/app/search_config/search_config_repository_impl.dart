import 'package:dartx/src/map.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/search_config/search_config.dart';
import 'package:injectable/injectable.dart';

// TODO: implement it
@LazySingleton(as: SearchConfigRepository)
class SearchConfigRepositoryImpl implements SearchConfigRepository {
  @override
  Future<void> deleteRepo(String id) {
    throw UnimplementedError();
  }

  @override
  Future<List<SearchConfig>> getAll() {
    throw UnimplementedError();
  }

  @override
  Stream<int> getCount() {
    throw UnimplementedError();
  }

  @override
  Future<SearchConfig?> getSearchConfig(String id) {
    throw UnimplementedError();
  }

  @override
  Future<void> insertRepo({required String id, required Set<Board> enabledBoards, required Set<Pair<Board, String>> threadsSorting, required String keywords}) {
    throw UnimplementedError();
  }

  @override
  Stream<List<SearchConfig>> subscribeAll() {
    throw UnimplementedError();
  }

  @override
  Future<void> upsertRepo({required String id, required Set<Board> enabledBoards, required Set<Pair<Board, String>> threadsSorting, required String keywords}) {
    throw UnimplementedError();
  }

}