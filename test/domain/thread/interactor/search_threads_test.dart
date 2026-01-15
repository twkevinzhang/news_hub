import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/search_threads.dart';
import 'package:news_hub/domain/thread/repository.dart';
import 'package:news_hub/shared/models.dart';

import '../../../helpers/test_data_factory.dart';

class MockThreadRepository extends Mock implements ThreadRepository {}

class MockListInstalledExtensions extends Mock
    implements ListInstalledExtensions {}

void main() {
  late SearchThreads useCase;
  late MockThreadRepository mockRepo;
  late MockListInstalledExtensions mockListInstalled;

  setUp(() {
    mockRepo = MockThreadRepository();
    mockListInstalled = MockListInstalledExtensions();
    useCase = SearchThreads(
      repository: mockRepo,
      listInstalledExtensions: mockListInstalled,
    );
  });

  const tPkgName = 'com.example';
  const tBoardId = 'board1';

  final tBoard = TestDataFactory.createBoard(
    id: tBoardId,
    extensionPkgName: tPkgName,
  );
  final tExtensionWithBoards = TestDataFactory.createExtensionWithBoards(
    pkgName: tPkgName,
    boards: {tBoard},
  );

  final tThread = TestDataFactory.createSingleImagePost(
    extensionPkgName: tPkgName,
    boardId: tBoardId,
  );

  test('應該針對符合的 boards 進行搜尋', () async {
    // Arrange
    const tKeywords = 'keyword';
    final tFilter = ThreadsFilter(
      keywords: tKeywords,
      boardSorts: {tBoardId: 'latest'},
    );

    when(
      () => mockListInstalled.withBoards(),
    ).thenAnswer((_) async => Result.completed([tExtensionWithBoards]));

    when(
      () => mockRepo.listThreads(
        extensionPkgName: any(named: 'extensionPkgName'),
        boardId: any(named: 'boardId'),
        sort: any(named: 'sort'),
        pagination: any(named: 'pagination'),
        keywords: any(named: 'keywords'),
      ),
    ).thenAnswer((_) async => [tThread]);

    // Act
    final result = await useCase(filter: tFilter);

    // Assert
    expect(result, isA<ResultCompleted<List<SingleImagePostWithExtension>>>());
    final data =
        (result as ResultCompleted).data as List<SingleImagePostWithExtension>;
    expect(data.length, 1);
    expect(data.first.post, tThread);

    verify(
      () => mockRepo.listThreads(
        extensionPkgName: tPkgName,
        boardId: tBoardId,
        sort: 'latest',
        keywords: tKeywords,
      ),
    ).called(1);
  });
}
