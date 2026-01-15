import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/thread/interactor/list_comments.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/models/models.dart';

import '../../../helpers/test_data_factory.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

void main() {
  late ListComments useCase;
  late MockThreadRepository mockRepo;

  setUp(() {
    mockRepo = MockThreadRepository();
    useCase = ListComments(threadRepository: mockRepo);
  });

  const tPkgName = 'com.example';
  const tBoardId = 'board1';
  const tThreadId = 'thread1';
  const tPostId = 'post1';

  final tComments = [
    TestDataFactory.createComment(id: 'c1'),
    TestDataFactory.createComment(id: 'c2'),
  ];

  test('應該呼叫 repository.listComments 並回傳結果', () async {
    // Arrange
    when(
      () => mockRepo.listComments(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
        postId: any(named: 'postId'),
        pagination: any(named: 'pagination'),
      ),
    ).thenAnswer((_) async => tComments);

    // Act
    final result = await useCase(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: tThreadId,
      postId: tPostId,
    );

    // Assert
    expect(result, isA<ResultCompleted<List<Comment>>>());
    expect((result as ResultCompleted).data, tComments);
    verify(
      () => mockRepo.listComments(
        extensionPkgName: tPkgName,
        boardId: tBoardId,
        threadId: tThreadId,
        postId: tPostId,
      ),
    ).called(1);
  });

  test('當 repository 拋出異常時應該回傳 Result.error', () async {
    // Arrange
    final tException = Exception('Network error');
    when(
      () => mockRepo.listComments(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
        postId: any(named: 'postId'),
        pagination: any(named: 'pagination'),
      ),
    ).thenThrow(tException);

    // Act
    final result = await useCase(
      extensionPkgName: tPkgName,
      boardId: tBoardId,
      threadId: tThreadId,
      postId: tPostId,
    );

    // Assert
    expect(result, isA<ResultError<List<Comment>>>());
  });
}
