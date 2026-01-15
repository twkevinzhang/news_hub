import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_board_threads.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/shared/models.dart';

import '../../../helpers/test_data_factory.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockBoardRepository extends Mock implements BoardRepository {}

void main() {
  late ListBoardThreads useCase;
  late MockThreadRepository mockThreadRepo;
  late MockBoardRepository mockBoardRepo;

  setUp(() {
    mockThreadRepo = MockThreadRepository();
    mockBoardRepo = MockBoardRepository();
    useCase = ListBoardThreads(
      repository: mockThreadRepo,
      boardRepository: mockBoardRepo,
    );
  });

  const tCollectionId = 'col1';
  const tBoardId = 'board1';
  const tPkgName = 'com.example';

  final tBoard = TestDataFactory.createBoard(
    id: tBoardId,
    extensionPkgName: tPkgName,
  );

  final tThread = TestDataFactory.createSingleImagePost(
    extensionPkgName: tPkgName,
    boardId: tBoardId,
  );

  test('應該成功取得 board 並抓取 threads', () async {
    // Arrange
    when(
      () => mockBoardRepo.getBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenAnswer((_) async => tBoard);

    when(
      () => mockThreadRepo.listThreads(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        sort: any(named: 'sort'),
        pagination: any(named: 'pagination'),
        keywords: any(named: 'keywords'),
      ),
    ).thenAnswer((_) async => [tThread]);

    // Act
    final result = await useCase(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultCompleted<List<SingleImagePostWithExtension>>>());
    final data =
        (result as ResultCompleted).data as List<SingleImagePostWithExtension>;
    expect(data.length, 1);
    expect(data.first.post, tThread);
    expect(data.first.board, tBoard);
  });

  test('當 getBoard 失敗時應該回傳 error', () async {
    // Arrange
    final tException = Exception('Board not found');
    when(
      () => mockBoardRepo.getBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenThrow(tException);

    // Act
    final result = await useCase(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultError>());
  });

  test('當 listThreads 失敗時應該回傳 error', () async {
    // Arrange
    when(
      () => mockBoardRepo.getBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenAnswer((_) async => tBoard);

    final tException = Exception('Network error');
    when(
      () => mockThreadRepo.listThreads(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        sort: any(named: 'sort'),
        pagination: any(named: 'pagination'),
        keywords: any(named: 'keywords'),
      ),
    ).thenThrow(tException);

    // Act
    final result = await useCase(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultError>());
  });
}
