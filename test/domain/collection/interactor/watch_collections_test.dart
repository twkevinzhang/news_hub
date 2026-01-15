import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/interactor/watch_collections.dart';
import 'package:news_hub/domain/collection/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late WatchCollections useCase;
  late MockCollectionRepository mockRepo;

  setUp(() {
    mockRepo = MockCollectionRepository();
    useCase = WatchCollections(mockRepo);
  });

  final tCollection = TestDataFactory.createCollection();

  test('應該呼叫 repository.watchList 並回傳 stream', () {
    // Arrange
    when(
      () => mockRepo.watchList(),
    ).thenAnswer((_) => Stream.value([tCollection]));

    // Act
    final result = useCase();

    // Assert
    expect(result, emits([tCollection]));
    verify(() => mockRepo.watchList()).called(1);
  });
}
