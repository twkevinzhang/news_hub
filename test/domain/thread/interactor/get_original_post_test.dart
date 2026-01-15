import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/shared/models.dart';

import '../../../helpers/test_data_factory.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockBoardRepository extends Mock implements BoardRepository {}

class MockGetInstalledExtension extends Mock implements GetInstalledExtension {}

void main() {
  late GetOriginalPost useCase;
  late MockThreadRepository mockThreadRepo;
  late MockBoardRepository mockBoardRepo;
  late MockGetInstalledExtension mockGetInstalledExt;

  setUpAll(() {
    registerFallbackValue(TestDataFactory.createExtension());
  });

  setUp(() {
    mockThreadRepo = MockThreadRepository();
    mockBoardRepo = MockBoardRepository();
    mockGetInstalledExt = MockGetInstalledExtension();
    useCase = GetOriginalPost(
      threadRepository: mockThreadRepo,
      boardRepository: mockBoardRepo,
      installedRepository: mockGetInstalledExt,
    );
  });

  const tPkgName = 'com.example';
  const tBoardId = 'board1';
  const tThreadId = 'thread1';

  final tExtension = TestDataFactory.createExtension(pkgName: tPkgName);
  final tBoard = TestDataFactory.createBoard(
    id: tBoardId,
    extensionPkgName: tPkgName,
  );
  final tPost = TestDataFactory.createArticlePost(
    extensionPkgName: tPkgName,
    boardId: tBoardId,
    threadId: tThreadId,
  );

  test('應該成功取得所有數據並組合回傳', () async {
    // Arrange
    when(
      () => mockGetInstalledExt.get(tPkgName),
    ).thenAnswer((_) async => Result.completed(tExtension));
    when(() => mockBoardRepo.list(tPkgName)).thenAnswer((_) async => [tBoard]);
    when(
      () => mockThreadRepo.getOriginalPost(
        extensionPkgName: tPkgName,
        boardId: tBoardId,
        threadId: tThreadId,
      ),
    ).thenAnswer((_) async => tPost);

    // Act
    final result = await useCase(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: tThreadId,
    );

    // Assert
    expect(result, isA<ResultCompleted<ArticlePostWithExtension>>());
    final data = (result as ResultCompleted<ArticlePostWithExtension>).data;
    expect(data.post, tPost);
    expect(data.board, tBoard);
    expect(data.extension, tExtension);
  });

  test('當 extension 獲取失敗時應該回傳 error', () async {
    // Arrange
    final tError = Exception('Ext Error');
    when(
      () => mockGetInstalledExt.get(tPkgName),
    ).thenAnswer((_) async => Result.error(tError));
    when(() => mockBoardRepo.list(any())).thenAnswer((_) async => []);
    when(
      () => mockThreadRepo.getOriginalPost(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
      ),
    ).thenAnswer((_) async => tPost);

    // Act
    final result = await useCase(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: tThreadId,
    );

    // Assert
    expect(result, isA<ResultError>());
    expect((result as ResultError).error, tError);
  });
}
