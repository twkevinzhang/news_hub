import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

@lazySingleton
class InsertSuggestion {
  final SuggestionRepository suggestionRepo;
  InsertSuggestion({
    required this.suggestionRepo,
  });

  Future<void> call({
    required String keywords,
  }) async {
    return suggestionRepo.insert(keywords: keywords);
  }
}
