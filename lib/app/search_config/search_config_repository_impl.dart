import 'package:dartx/src/map.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/search_config/search_config.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: SearchConfigRepository)
class SearchConfigRepositoryImpl implements SearchConfigRepository {
  @override
  Future<void> deleteRepo(String id) {
    // TODO: implement deleteRepo
    throw UnimplementedError();
  }

  @override
  Future<List<SearchConfig>> getAll() {
    // TODO: implement getAll
    throw UnimplementedError();
  }

  @override
  Stream<int> getCount() {
    // TODO: implement getCount
    throw UnimplementedError();
  }

  @override
  Future<SearchConfig?> getSearchConfig(String id) {
    // TODO: implement getSearchConfig
    throw UnimplementedError();
  }

  @override
  Future<void> insertRepo({required String id, required Set<Board> enabledBoards, required Set<Pair<Board, String>> threadsSorting, required String keywords}) {
    // TODO: implement insertRepo
    throw UnimplementedError();
  }

  @override
  Stream<List<SearchConfig>> subscribeAll() {
    // TODO: implement subscribeAll
    throw UnimplementedError();
  }

  @override
  Future<void> upsertRepo({required String id, required Set<Board> enabledBoards, required Set<Pair<Board, String>> threadsSorting, required String keywords}) {
    // TODO: implement upsertRepo
    throw UnimplementedError();
  }

}