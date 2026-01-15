import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/collection/interactor/get_collections.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late GetCollections useCase;
  late MockCollectionRepository mockRepository;

  setUp(() {
    mockRepository = MockCollectionRepository();
    useCase = GetCollections(mockRepository);
  });

  final tCollections = [
    const Collection(id: '1', name: 'Col 1', boards: []),
    const Collection(id: '2', name: 'Col 2', boards: []),
  ];

  test('當順利取得所有 Collections 時，應回傳 Result.completed', () async {
    // Arrange
    when(() => mockRepository.list()).thenAnswer((_) async => tCollections);

    // Act
    final result = await useCase.call();

    // Assert
    expect(result, isA<ResultCompleted<List<Collection>>>());
    expect((result as ResultCompleted).data, tCollections);
    verify(() => mockRepository.list()).called(1);
  });

  test('當發生異常時，應回傳 Result.error', () async {
    // Arrange
    when(() => mockRepository.list()).thenThrow(Exception());

    // Act
    final result = await useCase.call();

    // Assert
    expect(result, isA<ResultError<List<Collection>>>());
  });
}
