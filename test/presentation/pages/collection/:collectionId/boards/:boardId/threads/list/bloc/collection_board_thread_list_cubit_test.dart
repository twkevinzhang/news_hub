import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/interactor/get_collection.dart';
import 'package:news_hub/domain/collection/interactor/get_collection_board.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_board_threads.dart';
import 'package:news_hub/presentation/pages/collection/:collectionId/boards/:boardId/threads/list/bloc/collection_board_thread_list_cubit.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/shared/failures.dart';

import '../../../../../../../../../helpers/test_data_factory.dart';

class MockGetCollection extends Mock implements GetCollection {}

class MockGetCollectionBoard extends Mock implements GetCollectionBoard {}

class MockListBoardThreads extends Mock implements ListBoardThreads {}

void main() {
  group('CollectionBoardThreadListCubit', () {
    late MockGetCollection mockGetCollection;
    late MockGetCollectionBoard mockGetCollectionBoard;
    late MockListBoardThreads mockListBoardThreads;

    const tCollectionId = 'col1';
    const tBoardId = 'b1';

    final tCollection = TestDataFactory.createCollection(id: tCollectionId);
    final tBoard = TestDataFactory.createCollectionBoard(
      collectionId: tCollectionId,
      identity: TestDataFactory.createBoardIdentity(boardId: tBoardId),
    );
    final tThread = TestDataFactory.createSingleImagePostWithExtension();

    setUp(() {
      mockGetCollection = MockGetCollection();
      mockGetCollectionBoard = MockGetCollectionBoard();
      mockListBoardThreads = MockListBoardThreads();
    });

    test('initial state is correct', () {
      final cubit = CollectionBoardThreadListCubit(
        mockGetCollection,
        mockGetCollectionBoard,
        mockListBoardThreads,
      );
      expect(cubit.state, const CollectionBoardThreadListState());
      cubit.close();
    });

    group('init', () {
      blocTest<CollectionBoardThreadListCubit, CollectionBoardThreadListState>(
        'emits success state when all calls succeed',
        build: () {
          when(
            () => mockGetCollection(any()),
          ).thenAnswer((_) async => Result.completed(tCollection));
          when(
            () => mockGetCollectionBoard(
              collectionId: any(named: 'collectionId'),
              boardId: any(named: 'boardId'),
            ),
          ).thenAnswer((_) async => Result.completed(tBoard));
          when(
            () => mockListBoardThreads(
              collectionId: any(named: 'collectionId'),
              boardId: any(named: 'boardId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) async => Result.completed([tThread]));

          return CollectionBoardThreadListCubit(
            mockGetCollection,
            mockGetCollectionBoard,
            mockListBoardThreads,
          );
        },
        act: (cubit) =>
            cubit.init(collectionId: tCollectionId, boardId: tBoardId),
        expect: () => [
          // Loading
          const CollectionBoardThreadListState(isLoading: true),
          // Success
          CollectionBoardThreadListState(
            collection: tCollection,
            board: tBoard,
            threads: [tThread],
            isLoading: false,
          ),
        ],
        verify: (cubit) {
          expect(cubit.pagingController.itemList, [tThread]);
        },
      );

      blocTest<CollectionBoardThreadListCubit, CollectionBoardThreadListState>(
        'emits error state when one call fails',
        build: () {
          when(() => mockGetCollection(any())).thenAnswer(
            (_) async =>
                const Result.error(Failure.unexpected(message: 'fail')),
          );
          when(
            () => mockGetCollectionBoard(
              collectionId: any(named: 'collectionId'),
              boardId: any(named: 'boardId'),
            ),
          ).thenAnswer((_) async => Result.completed(tBoard));
          when(
            () => mockListBoardThreads(
              collectionId: any(named: 'collectionId'),
              boardId: any(named: 'boardId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) async => Result.completed([tThread]));

          return CollectionBoardThreadListCubit(
            mockGetCollection,
            mockGetCollectionBoard,
            mockListBoardThreads,
          );
        },
        act: (cubit) =>
            cubit.init(collectionId: tCollectionId, boardId: tBoardId),
        expect: () => [
          // Loading
          const CollectionBoardThreadListState(isLoading: true),
          // Error
          const CollectionBoardThreadListState(
            isLoading: false,
            error: Failure.unexpected(message: 'fail'),
          ),
        ],
      );
    });

    group('Filter', () {
      const tFilter = ThreadsFilter(boardSorts: {}, keywords: 'test');

      blocTest<CollectionBoardThreadListCubit, CollectionBoardThreadListState>(
        'applyFilter updates activeFilter',
        build: () => CollectionBoardThreadListCubit(
          mockGetCollection,
          mockGetCollectionBoard,
          mockListBoardThreads,
        ),
        act: (cubit) => cubit.applyFilter(tFilter),
        expect: () => [
          const CollectionBoardThreadListState(activeFilter: tFilter),
        ],
      );

      blocTest<CollectionBoardThreadListCubit, CollectionBoardThreadListState>(
        'clearFilter resets filter and refreshes if loaded',
        build: () {
          when(
            () => mockGetCollection(any()),
          ).thenAnswer((_) async => Result.completed(tCollection));
          when(
            () => mockGetCollectionBoard(
              collectionId: any(named: 'collectionId'),
              boardId: any(named: 'boardId'),
            ),
          ).thenAnswer((_) async => Result.completed(tBoard));
          when(
            () => mockListBoardThreads(
              collectionId: any(named: 'collectionId'),
              boardId: any(named: 'boardId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) async => Result.completed([tThread]));

          return CollectionBoardThreadListCubit(
            mockGetCollection,
            mockGetCollectionBoard,
            mockListBoardThreads,
          );
        },
        seed: () => CollectionBoardThreadListState(
          collection: tCollection,
          board: tBoard,
          activeFilter: tFilter,
        ),
        act: (cubit) => cubit.clearFilter(),
        expect: () => [
          // Reset filter
          CollectionBoardThreadListState(
            collection: tCollection,
            board: tBoard,
            activeFilter: const ThreadsFilter(boardSorts: {}, keywords: ''),
          ),
          // Refresh -> Loading
          CollectionBoardThreadListState(
            collection: tCollection,
            board: tBoard,
            isLoading: true,
            activeFilter: const ThreadsFilter(boardSorts: {}, keywords: ''),
          ),
          // Refresh -> Success
          CollectionBoardThreadListState(
            collection: tCollection,
            board: tBoard,
            threads: [tThread],
            isLoading: false,
            activeFilter: const ThreadsFilter(boardSorts: {}, keywords: ''),
          ),
        ],
      );
    });
  });
}
