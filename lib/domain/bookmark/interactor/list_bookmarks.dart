import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/bookmark/repository.dart';
import 'package:news_hub/domain/models/models.dart';

import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListBookmarks {
  final BookmarkRepository _repo;
  ListBookmarks({required BookmarkRepository repo}) : _repo = repo;

  Future<Result<List<Bookmark>>> call() async {
    try {
      final list = await _repo.getAll();
      return Result.completed(list);
    } catch (e) {
      return Result.error(Failure.fromError(e));
    }
  }
}
