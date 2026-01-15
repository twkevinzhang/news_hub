import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart';
import 'package:news_hub/domain/suggestion/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockSuggestionRepository extends Mock implements SuggestionRepository {}

void main() {
  late InsertSuggestion useCase;
  late MockSuggestionRepository mockRepo;

  setUp(() {
    mockRepo = MockSuggestionRepository();
    useCase = InsertSuggestion(suggestionRepo: mockRepo);
  });

  const tKeyword = 'test keyword';

  test('當 keyword 不存在時應該呼叫 insert', () async {
    // Arrange
    when(() => mockRepo.list()).thenAnswer((_) async => []);
    when(
      () => mockRepo.insert(keywords: any(named: 'keywords')),
    ).thenAnswer((_) async {});

    // Act
    await useCase(keywords: tKeyword);

    // Assert
    verify(() => mockRepo.insert(keywords: tKeyword)).called(1);
  });

  test('當 keyword 已存在時不應呼叫 insert', () async {
    // Arrange
    final tSuggestion = TestDataFactory.createSuggestion(keywords: tKeyword);
    when(() => mockRepo.list()).thenAnswer((_) async => [tSuggestion]);

    // Act
    await useCase(keywords: tKeyword);

    // Assert
    verifyNever(() => mockRepo.insert(keywords: any(named: 'keywords')));
  });
}
