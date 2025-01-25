part of '../index.dart';

@lazySingleton
class ListSearchConfigs {
  final SearchConfigRepository _repo;
  ListSearchConfigs({
    required SearchConfigRepository repo,
  }): _repo = repo;

  Future<List<SearchConfig>> call() async {
    return _repo.getAll();
  }
}
