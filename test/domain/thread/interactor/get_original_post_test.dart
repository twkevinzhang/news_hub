import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockBoardRepository extends Mock implements BoardRepository {}

class MockGetInstalledExtension extends Mock implements GetInstalledExtension {}

void main() {
  late GetOriginalPost useCase;
  late MockThreadRepository mockThreadRepo;
  late MockBoardRepository mockBoardRepo;
  late MockGetInstalledExtension mockGetInstalled;

  setUp(() {
    mockThreadRepo = MockThreadRepository();
    mockBoardRepo = MockBoardRepository();
    mockGetInstalled = MockGetInstalledExtension();
    useCase = GetOriginalPost(
      threadRepository: mockThreadRepo,
      boardRepository: mockBoardRepo,
      installedRepository: mockGetInstalled,
    );
  });

  const tPkgName = 'test.pkg';
  const tBoardId = 'board_1';
  final tExtension = Extension(
    pkgName: tPkgName,
    displayName: 'Ext',
    version: 1,
    pythonVersion: 3,
    isNsfw: false,
  );
  const tBoard = Board(
    id: tBoardId,
    name: 'Board',
    extensionPkgName: tPkgName,
    icon: '',
    largeWelcomeImage: '',
    url: '',
    sortOptions: {},
  );
  final tPost = ArticlePost(
    id: 'post_1',
    extensionPkgName: tPkgName,
    boardId: tBoardId,
    threadId: 'thread_1',
    title: 'Title',
    url: 'url',
    createdAt: DateTime.now(),
    authorId: 'a1',
    authorName: 'Author',
    liked: 0,
    disliked: 0,
    contents: [],
    tags: [],
  );

  test('應從多個來源組合資料並回傳 ArticlePostWithExtension', () async {
    // Arrange
    when(
      () => mockGetInstalled.get(any()),
    ).thenAnswer((_) async => Result.completed(tExtension));
    when(() => mockBoardRepo.list(any())).thenAnswer((_) async => [tBoard]);
    when(
      () => mockThreadRepo.getOriginalPost(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
        postId: any(named: 'postId'),
      ),
    ).thenAnswer((_) async => tPost);

    // Act
    final result = await useCase.call(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: 'thread_1',
    );

    // Assert
    expect(result, isA<ResultCompleted<ArticlePostWithExtension>>());
    final data = (result as ResultCompleted).data as ArticlePostWithExtension;
    expect(data.id, 'post_1');
    expect(data.extension.pkgName, tPkgName);
    expect(data.board.id, tBoardId);
  });

  test('當擴充功能載入失敗時，應回傳錯誤', () async {
    when(
      () => mockGetInstalled.get(any()),
    ).thenAnswer((_) async => const Result.error('Fail'));
    when(() => mockBoardRepo.list(any())).thenAnswer((_) async => [tBoard]);
    when(
      () => mockThreadRepo.getOriginalPost(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
      ),
    ).thenAnswer((_) async => tPost);

    final result = await useCase.call(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: 'thread_1',
    );

    expect(result, isA<ResultError<ArticlePostWithExtension>>());
  });
}
