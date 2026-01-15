import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

@lazySingleton
class InsertSuggestion {
  final SuggestionRepository suggestionRepo;
  InsertSuggestion({required this.suggestionRepo});

  Future<void> call({required String keywords}) async {
    final suggestions = await suggestionRepo.list();
    if (suggestions.any((s) => s.keywords == keywords)) return;
    return suggestionRepo.insert(keywords: keywords);
  }
}
