import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/suggestion/suggestion_repository.dart';

@lazySingleton
class UpdateSuggestionLatestUsedAt {
  final SuggestionRepository suggestionRepo;
  UpdateSuggestionLatestUsedAt({
    required this.suggestionRepo,
  });

  Future<void> call(String id) async {
    return suggestionRepo.updateLatestUsedAt(id);
  }
}
