import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/interactor/update_collection.dart';
import 'package:news_hub/domain/collection/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late UpdateCollection useCase;
  late MockCollectionRepository mockRepo;

  setUpAll(() {
    registerFallbackValue(TestDataFactory.createCollection());
  });

  setUp(() {
    mockRepo = MockCollectionRepository();
    useCase = UpdateCollection(mockRepo);
  });

  final tCollection = TestDataFactory.createCollection();

  test('應該呼叫 repository.update 並傳入正確 collection', () async {
    // Arrange
    when(() => mockRepo.update(any())).thenAnswer((_) async {});

    // Act
    await useCase(tCollection);

    // Assert
    verify(() => mockRepo.update(tCollection)).called(1);
  });
}
