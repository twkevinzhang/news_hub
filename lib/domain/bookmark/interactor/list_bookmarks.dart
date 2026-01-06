import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/bookmark/repository.dart';
import 'package:news_hub/domain/models/models.dart';

@lazySingleton
class ListBookmarks {
  final BookmarkRepository _repo;
  ListBookmarks({
    required BookmarkRepository repo,
  }) : _repo = repo;

  Future<List<Bookmark>> call() async {
    return _repo.getAll();
  }
}
