import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/domain/thread/interactor/list_comments.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

void main() {
  late ListComments useCase;
  late MockThreadRepository mockRepo;

  setUpAll(() {
    registerFallbackValue(const Pagination());
  });

  setUp(() {
    mockRepo = MockThreadRepository();
    useCase = ListComments(threadRepository: mockRepo);
  });

  test('應回傳評論列表', () async {
    final List<Comment> tComments = [
      Comment(
        extensionPkgName: 'pkg',
        boardId: 'b1',
        threadId: 't1',
        postId: 'p1',
        id: 'c1',
        authorId: 'a1',
        authorName: 'name',
        createdAt: DateTime.now(),
        contents: [],
      ),
    ];
    when(
      () => mockRepo.listComments(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        threadId: any(named: 'threadId'),
        postId: any(named: 'postId'),
        pagination: any(named: 'pagination'),
      ),
    ).thenAnswer((_) async => tComments);

    final result = await useCase.call(
      extensionPkgName: 'pkg',
      boardId: 'b1',
      threadId: 't1',
      postId: 'p1',
    );

    expect(result, isA<ResultCompleted<List<Comment>>>());
    expect((result as ResultCompleted).data, tComments);
  });
}
