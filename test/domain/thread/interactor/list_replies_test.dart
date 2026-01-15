import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/extension/interactor/get_installed_extension.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_replies.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/shared/models.dart';

import '../../../helpers/test_data_factory.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockBoardRepository extends Mock implements BoardRepository {}

class MockGetInstalledExtension extends Mock implements GetInstalledExtension {}

void main() {
  late ListReplies useCase;
  late MockThreadRepository mockThreadRepo;
  late MockBoardRepository mockBoardRepo;
  late MockGetInstalledExtension mockGetInstalledExt;

  setUp(() {
    mockThreadRepo = MockThreadRepository();
    mockBoardRepo = MockBoardRepository();
    mockGetInstalledExt = MockGetInstalledExtension();
    useCase = ListReplies(
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
  final tReply = TestDataFactory.createArticlePost(
    extensionPkgName: tPkgName,
    boardId: tBoardId,
    threadId: tThreadId,
    id: 'reply1',
  );

  test('應該成功取得 replies 並組合回傳', () async {
    // Arrange
    when(
      () => mockGetInstalledExt.get(tPkgName),
    ).thenAnswer((_) async => Result.completed(tExtension));
    when(() => mockBoardRepo.list(tPkgName)).thenAnswer((_) async => [tBoard]);
    when(
      () => mockThreadRepo.listReplies(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
        parentId: any(named: 'parentId'),
        pagination: any(named: 'pagination'),
      ),
    ).thenAnswer((_) async => [tReply]);

    // Act
    final result = await useCase(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: tThreadId,
    );

    // Assert
    expect(result, isA<ResultCompleted<List<ArticlePostWithExtension>>>());
    final data =
        (result as ResultCompleted).data as List<ArticlePostWithExtension>;
    expect(data.length, 1);
    expect(data.first.post, tReply);
    expect(data.first.board, tBoard);
    expect(data.first.extension, tExtension);
  });
}
