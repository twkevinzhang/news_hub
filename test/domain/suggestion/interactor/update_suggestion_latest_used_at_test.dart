import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

class MockSuggestionRepository extends Mock implements SuggestionRepository {}

void main() {
  late UpdateSuggestionLatestUsedAt useCase;
  late MockSuggestionRepository mockRepo;

  setUp(() {
    mockRepo = MockSuggestionRepository();
    useCase = UpdateSuggestionLatestUsedAt(suggestionRepo: mockRepo);
  });

  const tId = 's1';

  test('應該呼叫 repository.updateLatestUsedAt 並傳入正確 ID', () async {
    // Arrange
    when(() => mockRepo.updateLatestUsedAt(any())).thenAnswer((_) async {});

    // Act
    await useCase(tId);

    // Assert
    verify(() => mockRepo.updateLatestUsedAt(tId)).called(1);
  });
}
