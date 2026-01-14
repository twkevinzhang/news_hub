import 'package:injectable/injectable.dart';

import 'package:news_hub/domain/repo/repository.dart';

@lazySingleton
class AddRepo {
  final RepoRepository _repo;
  AddRepo(this._repo);

  Future<void> call({required String url}) {
    return _repo.insert(url);
  }
}
