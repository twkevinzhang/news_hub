import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/interactor/get_collection.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/bloc/collection_thread_list_cubit.dart';
import 'package:news_hub/shared/models.dart';

import '../../../../../../../helpers/test_data_factory.dart';

class MockGetCollection extends Mock implements GetCollection {}

class MockListCollectionThreads extends Mock implements ListCollectionThreads {}

void main() {
  late CollectionThreadListCubit cubit;
  late MockGetCollection mockGetCollection;
  late MockListCollectionThreads mockListCollectionThreads;

  setUp(() {
    mockGetCollection = MockGetCollection();
    mockListCollectionThreads = MockListCollectionThreads();
    cubit = CollectionThreadListCubit(
      mockGetCollection,
      mockListCollectionThreads,
    );
  });

  // tearDown(() {
  //   cubit.close();
  // });

  group('CollectionThreadListCubit', () {
    const tCollectionId = 'col_1';
    final tBoard = TestDataFactory.createBoard(id: 'b1', name: 'Board 1');
    final tCollection = TestDataFactory.createCollection(
      id: tCollectionId,
      boards: [
        TestDataFactory.createCollectionBoard(
          identity: TestDataFactory.createBoardIdentity(boardId: 'b1'),
        ),
      ],
    );
    final tPost = TestDataFactory.createSingleImagePostWithExtension(
      board: tBoard,
    );

    test('initial state is correct', () {
      expect(cubit.state, const CollectionThreadListState());
    });

    group('init', () {
      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        'emits state with collection and loads threads on success',
        build: () {
          when(
            () => mockGetCollection(any()),
          ).thenAnswer((_) async => Result.completed(tCollection));
          when(
            () => mockListCollectionThreads(
              collectionId: any(named: 'collectionId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) => const Stream.empty());
          return cubit;
        },
        act: (cubit) => cubit.init(tCollectionId),
        expect: () => [cubit.state.copyWith(collection: tCollection)],
        verify: (_) {
          verify(() => mockGetCollection(tCollectionId)).called(1);
          verify(
            () => mockListCollectionThreads(
              collectionId: tCollectionId,
              filter: cubit.state.activeFilter,
            ),
          ).called(1);
        },
      );

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        'emits error when GetCollection fails',
        build: () {
          when(
            () => mockGetCollection(any()),
          ).thenAnswer((_) async => const Result.error('fail'));
          return cubit;
        },
        act: (cubit) => cubit.init(tCollectionId),
        expect: () => [cubit.state.copyWith(error: 'fail')],
      );
    });

    group('Stream Handling', () {
      late StreamController<BoardDataChunk> streamController;

      setUp(() {
        streamController = StreamController<BoardDataChunk>();
      });

      tearDown(() {
        streamController.close();
      });

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        'handles multiple board chunks and updates pagingController',
        build: () {
          when(
            () => mockGetCollection(any()),
          ).thenAnswer((_) async => Result.completed(tCollection));
          when(
            () => mockListCollectionThreads(
              collectionId: any(named: 'collectionId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) => streamController.stream);
          return cubit;
        },
        act: (cubit) async {
          await cubit.init(tCollectionId);
          // Board 1 Loading
          streamController.add(
            const BoardDataChunk(boardId: 'b1', threads: [], isLoading: true),
          );
          // Board 1 Success
          streamController.add(
            BoardDataChunk(boardId: 'b1', threads: [tPost], isLoading: false),
          );
        },
        skip: 1, // Skip state from init
        expect: () => [
          // Loading b1
          cubit.state.copyWith(
            collection: tCollection,
            loadingBoardIds: {'b1'},
            boardData: {},
          ),
          // Success b1
          cubit.state.copyWith(
            collection: tCollection,
            loadingBoardIds: {},
            boardData: {
              'b1': [tPost],
            },
          ),
        ],
        verify: (cubit) {
          expect(cubit.pagingController.itemList?.length, 1);
          expect(cubit.pagingController.itemList?.first, tPost);
        },
      );

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        'shows skeletons when board is loading and no data',
        build: () {
          when(
            () => mockGetCollection(any()),
          ).thenAnswer((_) async => Result.completed(tCollection));
          when(
            () => mockListCollectionThreads(
              collectionId: any(named: 'collectionId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) => streamController.stream);
          return cubit;
        },
        act: (cubit) async {
          await cubit.init(tCollectionId);
          streamController.add(
            const BoardDataChunk(boardId: 'b1', threads: [], isLoading: true),
          );
        },
        skip: 1,
        expect: () => [
          cubit.state.copyWith(
            collection: tCollection,
            loadingBoardIds: {'b1'},
            boardData: {},
          ),
        ],
        verify: (cubit) {
          expect(cubit.pagingController.itemList?.length, 3);
          expect(
            cubit.pagingController.itemList?.every(
              (i) => i is CollectionBoardSkeleton,
            ),
            true,
          );
        },
      );
    });

    group('Filters', () {
      const tFilter = ThreadsFilter(boardSorts: {}, keywords: 'search');

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        'applyFilter updates activeFilter',
        build: () => cubit,
        act: (cubit) => cubit.applyFilter(tFilter),
        expect: () => [cubit.state.copyWith(activeFilter: tFilter)],
      );

      blocTest<CollectionThreadListCubit, CollectionThreadListState>(
        'clearFilter resets filter and reloads',
        seed: () => cubit.state.copyWith(
          collection: tCollection,
          activeFilter: tFilter,
        ),
        build: () {
          when(
            () => mockListCollectionThreads(
              collectionId: any(named: 'collectionId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) => const Stream.empty());
          return cubit;
        },
        act: (cubit) => cubit.clearFilter(),
        expect: () => [
          cubit.state.copyWith(
            collection: tCollection,
            activeFilter: const ThreadsFilter(boardSorts: {}, keywords: ''),
          ),
        ],
        verify: (_) {
          verify(
            () => mockListCollectionThreads(
              collectionId: tCollectionId,
              filter: const ThreadsFilter(boardSorts: {}, keywords: ''),
            ),
          ).called(1);
        },
      );
    });
  });
}
