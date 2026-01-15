import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/board/interactor/get_board_sort_options.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/components/forms/collection/bloc/collection_form_cubit.dart';
import 'package:news_hub/shared/models.dart';

import '../../../../../helpers/test_data_factory.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

class MockGetBoardSortOptions extends Mock implements GetBoardSortOptions {}

void main() {
  late CollectionFormCubit cubit;
  late MockCollectionRepository mockCollectionRepository;
  late MockGetBoardSortOptions mockGetBoardSortOptions;

  setUpAll(() {
    registerFallbackValue(TestDataFactory.createCollection());
    registerFallbackValue(<CollectionBoard>[]);
  });

  setUp(() {
    mockCollectionRepository = MockCollectionRepository();
    mockGetBoardSortOptions = MockGetBoardSortOptions();
    cubit = CollectionFormCubit(
      mockCollectionRepository,
      mockGetBoardSortOptions,
    );
  });

  tearDown(() {
    // cubit.close(); // let blocTest handle it
  });

  group('CollectionFormCubit', () {
    final tBoard = TestDataFactory.createBoard(id: 'b1', name: 'Board 1');
    final tCollection = TestDataFactory.createCollection(
      id: 'col_1',
      name: 'Existing Collection',
      boards: [
        TestDataFactory.createCollectionBoard(
          identity: TestDataFactory.createBoardIdentity(
            boardId: 'b1',
            boardName: 'Board 1',
          ),
          collectionId: 'col_1',
          selectedSort: 'hot',
        ),
      ],
    );

    test('initial state is correct', () {
      expect(cubit.state, const CollectionFormState());
    });

    group('init', () {
      blocTest<CollectionFormCubit, CollectionFormState>(
        'populates state from existing collection',
        build: () {
          when(() => mockGetBoardSortOptions(any())).thenAnswer(
            (_) async => const Result.completed({
              'b1': ['hot', 'latest'],
            }),
          );
          return cubit;
        },
        act: (cubit) => cubit.init(tCollection),
        expect: () => [
          // First emit from init populating boards
          predicate<CollectionFormState>(
            (state) =>
                state.name == 'Existing Collection' &&
                state.selectedBoards.length == 1 &&
                state.selectedBoards.first.id == 'b1' &&
                state.boardSorts['b1'] == 'hot' &&
                state.editingCollectionId == 'col_1',
          ),
          // Second emit after getting sort options
          predicate<CollectionFormState>(
            (state) =>
                state.boardSortOptions['b1']?.length == 2 &&
                state.boardSorts['b1'] == 'hot',
          ),
        ],
      );
    });

    group('updates', () {
      blocTest<CollectionFormCubit, CollectionFormState>(
        'updateName updates name and clears error',
        seed: () => const CollectionFormState(errorMessage: 'some error'),
        build: () => cubit,
        act: (cubit) => cubit.updateName('New Name'),
        expect: () => [
          const CollectionFormState(name: 'New Name', errorMessage: null),
        ],
      );

      blocTest<CollectionFormCubit, CollectionFormState>(
        'updateBoardSort updates specific board sort',
        seed: () => const CollectionFormState(boardSorts: {'b1': 'hot'}),
        build: () => cubit,
        act: (cubit) => cubit.updateBoardSort('b1', 'latest'),
        expect: () => [
          const CollectionFormState(boardSorts: {'b1': 'latest'}),
        ],
      );
    });

    group('board selection', () {
      final tBoards = [tBoard];
      final tOptions = {
        'b1': ['latest', 'hot'],
      };

      blocTest<CollectionFormCubit, CollectionFormState>(
        'updateSelectedBoards updates boards and fetches options',
        build: () {
          when(
            () => mockGetBoardSortOptions(any()),
          ).thenAnswer((_) async => Result.completed(tOptions));
          return cubit;
        },
        act: (cubit) => cubit.updateSelectedBoards(tBoards),
        expect: () => [
          // Update selected boards
          predicate<CollectionFormState>(
            (state) =>
                state.selectedBoards.length == 1 &&
                state.selectedBoards.first.id == 'b1',
          ),
          // Update options and auto-select
          predicate<CollectionFormState>(
            (state) =>
                state.boardSortOptions.containsKey('b1') &&
                state.boardSorts['b1'] == 'latest', // first option
          ),
        ],
      );
    });

    group('submit', () {
      blocTest<CollectionFormCubit, CollectionFormState>(
        'fails if no boards selected',
        build: () => cubit,
        act: (cubit) => cubit.submit(),
        expect: () => [const CollectionFormState(errorMessage: '請至少選擇一個版塊')],
      );

      blocTest<CollectionFormCubit, CollectionFormState>(
        'creates new collection when not editing',
        seed: () => CollectionFormState(
          name: 'New Col',
          selectedBoards: [tBoard],
          boardSorts: {'b1': 'latest'},
        ),
        build: () {
          when(
            () => mockCollectionRepository.create(any(), any()),
          ).thenAnswer((_) async => 'new_id');
          return cubit;
        },
        act: (cubit) => cubit.submit(),
        expect: () => [
          predicate<CollectionFormState>(
            (state) => state.isSaving && state.errorMessage == null,
          ),
          predicate<CollectionFormState>(
            (state) => !state.isSaving && state.isSuccess,
          ),
        ],
        verify: (_) {
          verify(
            () => mockCollectionRepository.create('New Col', any()),
          ).called(1);
        },
      );

      blocTest<CollectionFormCubit, CollectionFormState>(
        'updates existing collection when editing',
        seed: () => CollectionFormState(
          name: 'Updated Col',
          selectedBoards: [tBoard],
          boardSorts: {'b1': 'latest'},
          editingCollectionId: 'col_1',
        ),
        build: () {
          when(
            () => mockCollectionRepository.update(any()),
          ).thenAnswer((_) async => null);
          return cubit;
        },
        act: (cubit) => cubit.submit(),
        expect: () => [
          predicate<CollectionFormState>((state) => state.isSaving),
          predicate<CollectionFormState>((state) => state.isSuccess),
        ],
        verify: (_) {
          verify(
            () => mockCollectionRepository.update(
              any(that: isA<Collection>().having((c) => c.id, 'id', 'col_1')),
            ),
          ).called(1);
        },
      );

      blocTest<CollectionFormCubit, CollectionFormState>(
        'uses defaultName when name is empty',
        seed: () => CollectionFormState(
          name: '',
          selectedBoards: [tBoard],
          boardSorts: {'b1': 'latest'},
        ),
        build: () {
          when(
            () => mockCollectionRepository.create(any(), any()),
          ).thenAnswer((_) async => 'id');
          return cubit;
        },
        act: (cubit) => cubit.submit(),
        verify: (_) {
          verify(
            () => mockCollectionRepository.create(tBoard.name, any()),
          ).called(1);
        },
      );
    });
  });
}
