import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/suggestion/interactor/delete_all_suggestions.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

class MockSuggestionRepository extends Mock implements SuggestionRepository {}

void main() {
  late DeleteAllSuggestions useCase;
  late MockSuggestionRepository mockRepo;

  setUp(() {
    mockRepo = MockSuggestionRepository();
    useCase = DeleteAllSuggestions(suggestionRepo: mockRepo);
  });

  test('應該呼叫 repository.deleteAll', () async {
    // Arrange
    when(() => mockRepo.deleteAll()).thenAnswer((_) async {});

    // Act
    await useCase();

    // Assert
    verify(() => mockRepo.deleteAll()).called(1);
  });
}
