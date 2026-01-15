import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/bookmark/repository.dart';
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockBookmarkRepository extends Mock implements BookmarkRepository {}

void main() {
  late ListBookmarks useCase;
  late MockBookmarkRepository mockRepo;

  setUp(() {
    mockRepo = MockBookmarkRepository();
    useCase = ListBookmarks(repo: mockRepo);
  });

  test('應回傳書籤列表', () async {
    final tBookmarks = [
      const Bookmark(
        id: '1',
        filter: ThreadsFilter(boardSorts: {}, keywords: ''),
        sorting: ThreadsSorting(boardsOrder: []),
      ),
    ];
    when(() => mockRepo.getAll()).thenAnswer((_) async => tBookmarks);

    final result = await useCase.call();

    expect(result, isA<ResultCompleted<List<Bookmark>>>());
    expect((result as ResultCompleted).data, tBookmarks);
  });
}
