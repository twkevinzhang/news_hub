import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/collection/interactor/get_collection.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/shared/failures.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late GetCollection useCase;
  late MockCollectionRepository mockRepository;

  setUp(() {
    mockRepository = MockCollectionRepository();
    useCase = GetCollection(mockRepository);
  });

  const tId = 'col_1';
  final tCollection = Collection(id: tId, name: 'Test Collection', boards: []);

  test('當順利取得 Collection 時，應回傳 Result.completed', () async {
    // Arrange
    when(() => mockRepository.get(any())).thenAnswer((_) async => tCollection);

    // Act
    final result = await useCase.call(tId);

    // Assert
    expect(result, isA<ResultCompleted<Collection>>());
    expect((result as ResultCompleted).data, tCollection);
    verify(() => mockRepository.get(tId)).called(1);
  });

  test('當儲存庫拋出異常時，應回傳 Result.error 包含 Failure', () async {
    // Arrange
    when(() => mockRepository.get(any())).thenThrow(Exception('DB Error'));

    // Act
    final result = await useCase.call(tId);

    // Assert
    expect(result, isA<ResultError<Collection>>());
    expect((result as ResultError).error, isA<Failure>());
  });
}
