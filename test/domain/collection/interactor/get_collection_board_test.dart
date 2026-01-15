import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/collection/interactor/get_collection_board.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/shared/failures.dart';

class MockBoardRepository extends Mock implements BoardRepository {}

void main() {
  late GetCollectionBoard useCase;
  late MockBoardRepository mockRepository;

  setUp(() {
    mockRepository = MockBoardRepository();
    useCase = GetCollectionBoard(mockRepository);
  });

  const tCollectionId = 'col_1';
  const tBoardId = 'board_1';
  const tBoard = CollectionBoard(
    identity: BoardIdentity(
      extensionPkgName: 'test.pkg',
      boardId: tBoardId,
      boardName: 'Test Board',
    ),
    collectionId: tCollectionId,
  );

  test('當順利取得 CollectionBoard 時，應回傳 Result.completed', () async {
    // Arrange
    when(
      () => mockRepository.getCollectionBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenAnswer((_) async => tBoard);

    // Act
    final result = await useCase.call(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultCompleted<CollectionBoard>>());
    expect((result as ResultCompleted).data, tBoard);
    verify(
      () => mockRepository.getCollectionBoard(
        boardId: tBoardId,
        collectionId: tCollectionId,
      ),
    ).called(1);
  });

  test('當儲存庫拋出異常時，應回傳 Result.error 包含 Failure', () async {
    // Arrange
    when(
      () => mockRepository.getCollectionBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenThrow(Exception());

    // Act
    final result = await useCase.call(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultError<CollectionBoard>>());
    expect((result as ResultError).error, isA<Failure>());
  });
}
