import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockSuggestionRepository extends Mock implements SuggestionRepository {}

void main() {
  late ListSuggestions useCase;
  late MockSuggestionRepository mockRepo;

  setUp(() {
    mockRepo = MockSuggestionRepository();
    useCase = ListSuggestions(suggestionRepo: mockRepo);
  });

  final tSuggestion1 = TestDataFactory.createSuggestion(
    id: 's1',
    latestUsedAt: DateTime(2023, 1, 1),
  );
  final tSuggestion2 = TestDataFactory.createSuggestion(
    id: 's2',
    latestUsedAt: DateTime(2023, 1, 2),
  );

  test('應該回傳依 latestUsedAt 降序排列的 suggestions', () async {
    // Arrange
    when(
      () => mockRepo.list(),
    ).thenAnswer((_) async => [tSuggestion1, tSuggestion2]);

    // Act
    final result = await useCase();

    // Assert
    expect(result, [tSuggestion2, tSuggestion1]);
    verify(() => mockRepo.list()).called(1);
  });
}
