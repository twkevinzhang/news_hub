import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/thread/interactor/list_board_threads.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/shared/failures.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockBoardRepository extends Mock implements BoardRepository {}

void main() {
  late ListBoardThreads useCase;
  late MockThreadRepository mockThreadRepository;
  late MockBoardRepository mockBoardRepository;

  setUpAll(() {
    registerFallbackValue(const Pagination());
  });

  setUp(() {
    mockThreadRepository = MockThreadRepository();
    mockBoardRepository = MockBoardRepository();
    useCase = ListBoardThreads(
      repository: mockThreadRepository,
      boardRepository: mockBoardRepository,
    );
  });

  const tCollectionId = 'col_1';
  const tBoardId = 'board_1';
  final tBoard = Board(
    id: tBoardId,
    name: 'Test Board',
    extensionPkgName: 'test.pkg',
    icon: '',
    largeWelcomeImage: '',
    url: '',
    sortOptions: {},
    collectionId: tCollectionId,
  );

  final List<Post> tPosts = [
    SingleImagePost(
      id: 'post_1',
      title: 'Title 1',
      url: 'url1',
      extensionPkgName: 'test.pkg',
      boardId: tBoardId,
      threadId: 'thread_1',
      createdAt: DateTime.fromMillisecondsSinceEpoch(123456789),
      authorId: 'auth_1',
      authorName: 'Author 1',
      image: null,
      contents: [],
      liked: 0,
      disliked: 0,
      tags: [],
    ),
  ];

  test('當順利取得資料時，應回傳 Result.completed 包含貼文列表', () async {
    // Arrange
    when(
      () => mockBoardRepository.getBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenAnswer((_) async => tBoard);

    when(
      () => mockThreadRepository.listThreads(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        sort: any(named: 'sort'),
        pagination: any(named: 'pagination'),
        keywords: any(named: 'keywords'),
      ),
    ).thenAnswer((_) async => tPosts);

    // Act
    final result = await useCase.call(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultCompleted<List<SingleImagePostWithExtension>>>());
    final data =
        (result as ResultCompleted).data as List<SingleImagePostWithExtension>;
    expect(data.length, 1);
    expect(data.first.id, 'post_1');
    expect(data.first.board.id, tBoardId);
  });

  test('當 BoardRepository 拋出異常時，應回傳 Result.error 包含 Failure', () async {
    // Arrange
    final exception = Exception('Board not found');
    when(
      () => mockBoardRepository.getBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenThrow(exception);

    // Act
    final result = await useCase.call(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultError<List<SingleImagePostWithExtension>>>());
    final errorResult = result as ResultError;
    expect(errorResult.error, isA<Failure>());
  });

  test('當 ThreadRepository 拋出異常時，應回傳 Result.error 包含 Failure', () async {
    // Arrange
    when(
      () => mockBoardRepository.getBoard(
        boardId: any(named: 'boardId'),
        collectionId: any(named: 'collectionId'),
      ),
    ).thenAnswer((_) async => tBoard);

    when(
      () => mockThreadRepository.listThreads(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        sort: any(named: 'sort'),
        pagination: any(named: 'pagination'),
        keywords: any(named: 'keywords'),
      ),
    ).thenThrow(Exception('Network error'));

    // Act
    final result = await useCase.call(
      collectionId: tCollectionId,
      boardId: tBoardId,
    );

    // Assert
    expect(result, isA<ResultError<List<SingleImagePostWithExtension>>>());
  });
}
