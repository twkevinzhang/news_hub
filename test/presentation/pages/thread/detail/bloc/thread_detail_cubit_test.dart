import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';
import 'package:news_hub/domain/thread/interactor/list_comments.dart';
import 'package:news_hub/domain/thread/interactor/list_replies.dart';
import 'package:news_hub/presentation/pages/thread/detail/bloc/thread_detail_cubit.dart';
import 'package:news_hub/shared/failures.dart';
import 'package:news_hub/shared/models.dart';
import '../../../../../helpers/test_data_factory.dart';

class MockGetOriginalPost extends Mock implements GetOriginalPost {}

class MockListReplies extends Mock implements ListReplies {}

class MockListComments extends Mock implements ListComments {}

void main() {
  late ThreadDetailCubit cubit;
  late MockGetOriginalPost mockGetOriginalPost;
  late MockListReplies mockListReplies;
  late MockListComments mockListComments;

  setUp(() {
    mockGetOriginalPost = MockGetOriginalPost();
    mockListReplies = MockListReplies();
    mockListComments = MockListComments();

    cubit = ThreadDetailCubit(
      getOriginalPost: mockGetOriginalPost,
      listReplies: mockListReplies,
      listComments: mockListComments,
    );

    registerFallbackValue(const Pagination(page: 1, pageSize: 10));
  });

  tearDown(() {
    cubit.close();
  });

  const tExtPkg = TestDataFactory.tExtensionPkgName;
  const tBoardId = TestDataFactory.tBoardId;
  const tThreadId = TestDataFactory.tThreadId;

  final tArticlePost = TestDataFactory.createArticlePost(id: tThreadId);
  final tArticlePostWithExt = TestDataFactory.createArticlePostWithExtension(
    post: tArticlePost,
  );

  final tReplyPost = TestDataFactory.createArticlePost(
    id: 'reply_1',
    title: 'Reply Title',
  );
  final tReplyPostWithExt = TestDataFactory.createArticlePostWithExtension(
    post: tReplyPost,
  );

  group('ThreadDetailCubit', () {
    test('initial state is correct', () {
      expect(
        cubit.state,
        const ThreadDetailState(
          extensionPkgName: '',
          boardId: '',
          threadId: '',
          threadMap: {},
          repliesMap: {},
        ),
      );
    });

    blocTest<ThreadDetailCubit, ThreadDetailState>(
      'init updates state with ids',
      build: () => cubit,
      act: (cubit) => cubit.init(
        extensionPkgName: tExtPkg,
        boardId: tBoardId,
        threadId: tThreadId,
      ),
      expect: () => [
        const ThreadDetailState(
          extensionPkgName: tExtPkg,
          boardId: tBoardId,
          threadId: tThreadId,
          threadMap: {},
          repliesMap: {},
        ),
      ],
    );

    test(
      'loadPosts (page 1) successful updates state and pagingController',
      () async {
        // Arrange
        cubit.init(
          extensionPkgName: tExtPkg,
          boardId: tBoardId,
          threadId: tThreadId,
        );

        when(
          () => mockGetOriginalPost.call(
            extensionPkgName: tExtPkg,
            boardId: tBoardId,
            threadId: tThreadId,
          ),
        ).thenAnswer((_) async => Result.completed(tArticlePostWithExt));

        when(
          () => mockListReplies.call(
            extensionPkgName: tExtPkg,
            boardId: tBoardId,
            threadId: tThreadId,
            parentId: null,
            pagination: any(named: 'pagination'),
          ),
        ).thenAnswer((_) async => Result.completed([tReplyPostWithExt]));

        // Act
        // Trigger the listener by requesting first page
        cubit.pagingController.notifyPageRequestListeners(1);

        // Wait for async operations
        await untilCalled(
          () => mockGetOriginalPost.call(
            extensionPkgName: any(named: 'extensionPkgName'),
            boardId: any(named: 'boardId'),
            threadId: any(named: 'threadId'),
          ),
        );

        // Give a small delay for the future completions to propagate to the cubit/pagingController
        await Future.delayed(Duration.zero);

        // Assert
        expect(cubit.state.threadMap.containsKey(tThreadId), true);
        expect(cubit.state.threadMap.containsKey('reply_1'), true);

        expect(cubit.pagingController.itemList, isNotNull);
        expect(cubit.pagingController.itemList!.length, 2); // Thread + Reply
      },
    );

    test(
      'loadPosts (page 1) failure on thread fetch sets error to PagingController',
      () async {
        cubit.init(
          extensionPkgName: tExtPkg,
          boardId: tBoardId,
          threadId: tThreadId,
        );

        const failure = Failure.network(message: 'Error');
        when(
          () => mockGetOriginalPost.call(
            extensionPkgName: tExtPkg,
            boardId: tBoardId,
            threadId: tThreadId,
          ),
        ).thenAnswer((_) async => const Result.error(failure));

        when(
          () => mockListReplies.call(
            extensionPkgName: tExtPkg,
            boardId: tBoardId,
            threadId: tThreadId,
            parentId: null,
            pagination: any(named: 'pagination'),
          ),
        ).thenAnswer((_) async => const Result.completed([]));

        cubit.pagingController.notifyPageRequestListeners(1);

        await untilCalled(
          () => mockGetOriginalPost.call(
            extensionPkgName: any(named: 'extensionPkgName'),
            boardId: any(named: 'boardId'),
            threadId: any(named: 'threadId'),
          ),
        );

        await Future.delayed(const Duration(milliseconds: 10));

        expect(cubit.pagingController.error, failure);
      },
    );

    test('refresh calls pagingController.refresh', () {
      cubit.refresh();
      // Only verifying no crash
    });
  });
}
