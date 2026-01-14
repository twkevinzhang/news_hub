import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/repo/repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListRepos {
  final RepoRepository _repo;
  ListRepos(this._repo);

  Future<Result<List<Repo>>> call() async {
    try {
      final list = await _repo.list();
      return Result.completed(list);
    } catch (e) {
      return Result.error(e is Exception ? e : Exception(e.toString()));
    }
  }
}
