import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/repo/repository.dart';

@lazySingleton
class RemoveRepo {
  final RepoRepository _repo;
  RemoveRepo(this._repo);

  Future<void> call(String baseUrl) => _repo.delete(baseUrl);
}
