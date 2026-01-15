import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/interactor/delete_collection.dart';
import 'package:news_hub/domain/collection/repository.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late DeleteCollection useCase;
  late MockCollectionRepository mockRepo;

  setUp(() {
    mockRepo = MockCollectionRepository();
    useCase = DeleteCollection(mockRepo);
  });

  const tId = 'col1';

  test('應該呼叫 repository.delete 並傳入正確 ID', () async {
    // Arrange
    when(() => mockRepo.delete(any())).thenAnswer((_) async {});

    // Act
    await useCase(tId);

    // Assert
    verify(() => mockRepo.delete(tId)).called(1);
  });
}
