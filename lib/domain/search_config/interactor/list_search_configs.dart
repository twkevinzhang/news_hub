import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/search_config/search_config_repository.dart';

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
