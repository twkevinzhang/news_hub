import 'package:injectable/injectable.dart';
import 'package:flutter/widgets.dart';
import 'package:news_hub/domain/repo/repository.dart';

@lazySingleton
class AddRepo {
  final RepoRepository _repo;
  AddRepo(this._repo);

  Future<void> call({
    required String url,
    String? displayName,
  }) {
    return _repo.insert(url, displayName: displayName);
  }
}
