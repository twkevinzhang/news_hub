import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/repo/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListRepos {
  final RepoRepository _repo;
  ListRepos(this._repo);

  Future<List<Repo>> call() => _repo.list();
}
