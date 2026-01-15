import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart';
import 'package:news_hub/domain/thread/repository.dart';

import '../../../helpers/test_data_factory.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late ListCollectionThreads useCase;
  late MockThreadRepository mockThreadRepo;
  late MockCollectionRepository mockCollectionRepo;

  setUp(() {
    mockThreadRepo = MockThreadRepository();
    mockCollectionRepo = MockCollectionRepository();
    useCase = ListCollectionThreads(
      repository: mockThreadRepo,
      collectionRepository: mockCollectionRepo,
    );
  });

  const tCollectionId = 'col1';
  final tBoardIdentity = TestDataFactory.createBoardIdentity(boardId: 'board1');
  final tCollectionBoard = TestDataFactory.createCollectionBoard(
    identity: tBoardIdentity,
    collectionId: tCollectionId,
  );
  final tCollection = TestDataFactory.createCollection(
    id: tCollectionId,
    boards: [tCollectionBoard],
  );

  final tThread = TestDataFactory.createSingleImagePost(
    extensionPkgName: tBoardIdentity.extensionPkgName,
    boardId: tBoardIdentity.boardId,
  );

  test('當 collection 不存在時應該結束 stream', () async {
    // Arrange
    when(() => mockCollectionRepo.list()).thenAnswer((_) async => []);

    // Act
    final stream = useCase(collectionId: tCollectionId);

    // Assert
    expect(stream, emitsDone);
  });

  test('應該先發射 loading 狀態，接著發射 thread 資料', () async {
    // Arrange
    when(
      () => mockCollectionRepo.list(),
    ).thenAnswer((_) async => [tCollection]);
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
    final stream = useCase(collectionId: tCollectionId);

    // Assert
    await expectLater(
      stream,
      emitsInOrder([
        // 1. Loading state
        isA<BoardDataChunk>()
            .having((c) => c.boardId, 'boardId', tBoardIdentity.boardId)
            .having((c) => c.isLoading, 'isLoading', true),
        // 2. Data state
        isA<BoardDataChunk>()
            .having((c) => c.boardId, 'boardId', tBoardIdentity.boardId)
            .having((c) => c.isLoading, 'isLoading', false)
            .having((c) => c.threads, 'threads', hasLength(1)),
      ]),
    );
  });

  test('當 fetchBoardThreads 發生錯誤時應該發射 error chunk', () async {
    // Arrange
    when(
      () => mockCollectionRepo.list(),
    ).thenAnswer((_) async => [tCollection]);
    when(
      () => mockThreadRepo.listThreads(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        sort: any(named: 'sort'),
        pagination: any(named: 'pagination'),
        keywords: any(named: 'keywords'),
      ),
    ).thenThrow(Exception('Network error'));

    // Act
    final stream = useCase(collectionId: tCollectionId);

    // Assert
    await expectLater(
      stream,
      emitsInOrder([
        // Loading
        isA<BoardDataChunk>().having((c) => c.isLoading, 'isLoading', true),
        // Error
        isA<BoardDataChunk>()
            .having((c) => c.error, 'error', isNotEmpty)
            .having((c) => c.isLoading, 'isLoading', false),
      ]),
    );
  });
}
