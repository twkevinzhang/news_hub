import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

@lazySingleton
class ListSuggestions {
  final SuggestionRepository suggestionRepo;
  ListSuggestions({
    required this.suggestionRepo,
  });

  Future<List<Suggestion>> call() async {
    final all = await suggestionRepo.list();
    return all.sortedByDescending((s) => s.latestUsedAt);
  }
}
