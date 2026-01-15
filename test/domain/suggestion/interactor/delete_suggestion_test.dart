import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/suggestion/interactor/delete_suggestion.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

class MockSuggestionRepository extends Mock implements SuggestionRepository {}

void main() {
  late DeleteSuggestion useCase;
  late MockSuggestionRepository mockRepo;

  setUp(() {
    mockRepo = MockSuggestionRepository();
    useCase = DeleteSuggestion(suggestionRepo: mockRepo);
  });

  const tId = 's1';

  test('應該呼叫 repository.delete 並傳入正確 ID', () async {
    // Arrange
    when(() => mockRepo.delete(any())).thenAnswer((_) async {});

    // Act
    await useCase(tId);

    // Assert
    verify(() => mockRepo.delete(tId)).called(1);
  });
}
