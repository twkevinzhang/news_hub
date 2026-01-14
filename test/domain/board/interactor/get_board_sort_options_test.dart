import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/board_repository.dart';
import 'package:news_hub/domain/board/interactor/get_board_sort_options.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

class MockBoardRepository extends Mock implements BoardRepository {}

void main() {
  late GetBoardSortOptions useCase;
  late MockBoardRepository mockRepo;

  setUp(() {
    mockRepo = MockBoardRepository();
    useCase = GetBoardSortOptions(mockRepo);
  });

  test('應回傳看板排序選項對照表', () async {
    final tBoards = [
      Board(
        id: '1',
        name: 'b1',
        extensionPkgName: 'p1',
        icon: '',
        largeWelcomeImage: '',
        url: '',
        sortOptions: {},
      ),
    ];
    final tOptions = {
      '1': ['New', 'Hot'],
    };
    when(
      () => mockRepo.getBoardSortOptions(any()),
    ).thenAnswer((_) async => tOptions);

    final result = await useCase.call(tBoards);

    expect(result, isA<ResultCompleted<Map<String, List<String>>>>());
    expect((result as ResultCompleted).data, tOptions);
  });
}
