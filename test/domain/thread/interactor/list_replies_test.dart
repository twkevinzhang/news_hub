import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';
import 'package:news_hub/domain/thread/interactor/list_replies.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockBoardRepository extends Mock implements BoardRepository {}

class MockGetInstalledExtension extends Mock implements GetInstalledExtension {}

void main() {
  late ListReplies useCase;
  late MockThreadRepository mockThreadRepo;
  late MockBoardRepository mockBoardRepo;
  late MockGetInstalledExtension mockGetInstalled;

  setUpAll(() {
    registerFallbackValue(const Pagination());
  });

  setUp(() {
    mockThreadRepo = MockThreadRepository();
    mockBoardRepo = MockBoardRepository();
    mockGetInstalled = MockGetInstalledExtension();
    useCase = ListReplies(
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
    id: 'reply_1',
    extensionPkgName: tPkgName,
    boardId: tBoardId,
    threadId: 'thread_1',
    title: 'Reply',
    url: 'url',
    createdAt: DateTime.now(),
    authorId: 'a1',
    authorName: 'Author',
    liked: 0,
    disliked: 0,
    contents: [],
    tags: [],
  );

  test('應回傳回覆列表並轉換為 ArticlePostWithExtension', () async {
    // Arrange
    when(
      () => mockGetInstalled.get(any()),
    ).thenAnswer((_) async => Result.completed(tExtension));
    when(() => mockBoardRepo.list(any())).thenAnswer((_) async => [tBoard]);
    when(
      () => mockThreadRepo.listReplies(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
        parentId: any(named: 'parentId'),
        pagination: any(named: 'pagination'),
      ),
    ).thenAnswer((_) async => [tPost]);

    // Act
    final result = await useCase.call(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: 'thread_1',
    );

    // Assert
    expect(result, isA<ResultCompleted<List<ArticlePostWithExtension>>>());
    final data =
        (result as ResultCompleted).data as List<ArticlePostWithExtension>;
    expect(data.length, 1);
    expect(data.first.id, 'reply_1');
  });
}
