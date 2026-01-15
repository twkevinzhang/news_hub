import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/interactor/create_collection.dart';
import 'package:news_hub/domain/collection/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late CreateCollection useCase;
  late MockCollectionRepository mockRepo;

  setUp(() {
    mockRepo = MockCollectionRepository();
    useCase = CreateCollection(mockRepo);
  });

  const tName = 'New Collection';
  final tBoards = [TestDataFactory.createCollectionBoard()];

  test('應該呼叫 repository.create 並傳入正確參數', () async {
    // Arrange
    when(() => mockRepo.create(any(), any())).thenAnswer((_) async {});

    // Act
    await useCase(name: tName, boards: tBoards);

    // Assert
    verify(() => mockRepo.create(tName, tBoards)).called(1);
  });
}
