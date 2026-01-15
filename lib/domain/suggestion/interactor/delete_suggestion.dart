import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

@lazySingleton
class DeleteSuggestion {
  final SuggestionRepository suggestionRepo;
  DeleteSuggestion({required this.suggestionRepo});

  Future<void> call(String id) async {
    return suggestionRepo.delete(id);
  }
}
