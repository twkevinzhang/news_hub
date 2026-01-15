import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

@lazySingleton
class DeleteAllSuggestions {
  final SuggestionRepository suggestionRepo;
  DeleteAllSuggestions({required this.suggestionRepo});

  Future<void> call() async {
    return suggestionRepo.deleteAll();
  }
}
