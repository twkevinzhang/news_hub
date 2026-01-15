import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/list_collection_threads.dart';

import 'package:news_hub/presentation/pages/collection/:collectionId/threads/search/result/bloc/search_result_cubit.dart';

import '../../../../../../../../helpers/test_data_factory.dart';

class MockListCollectionThreads extends Mock implements ListCollectionThreads {}

void main() {
  group('SearchResultCubit', () {
    late MockListCollectionThreads mockListCollectionThreads;

    const tCollectionId = 'col1';
    const tFilter = ThreadsFilter(keywords: 'test', boardSorts: {});
    final tThread = TestDataFactory.createSingleImagePostWithExtension();
    final tChunk = BoardDataChunk(
      boardId: 'b1',
      threads: [tThread],
      isLoading: false,
    );

    setUp(() {
      mockListCollectionThreads = MockListCollectionThreads();
    });

    test('initial state is correct', () {
      final cubit = SearchResultCubit(mockListCollectionThreads);
      expect(
        cubit.state,
        const SearchResultState(
          collectionId: '',
          filter: ThreadsFilter(boardSorts: {}, keywords: ''),
        ),
      );
      cubit.close();
    });

    group('init', () {
      test('updates state and loads results', () async {
        final cubit = SearchResultCubit(mockListCollectionThreads);
        when(
          () => mockListCollectionThreads(
            collectionId: any(named: 'collectionId'),
            filter: any(named: 'filter'),
          ),
        ).thenAnswer((_) => Stream.value(tChunk));

        cubit.init(tCollectionId, tFilter);

        expect(cubit.state.collectionId, tCollectionId);
        expect(cubit.state.filter, tFilter);

        await Future.delayed(Duration.zero);

        verify(
          () => mockListCollectionThreads(
            collectionId: tCollectionId,
            filter: tFilter,
          ),
        ).called(1);
        await cubit.close();
      });
    });

    group('_loadResults', () {
      blocTest<SearchResultCubit, SearchResultState>(
        'emits [isLoading: true, isLoading: false] when data loads successfully',
        build: () {
          when(
            () => mockListCollectionThreads(
              collectionId: any(named: 'collectionId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) => Stream.value(tChunk));
          return SearchResultCubit(mockListCollectionThreads);
        },
        act: (cubit) => cubit.init(tCollectionId, tFilter),
        expect: () => [
          const SearchResultState(collectionId: tCollectionId, filter: tFilter),
          const SearchResultState(
            collectionId: tCollectionId,
            filter: tFilter,
            isLoading: true,
          ),
          const SearchResultState(
            collectionId: tCollectionId,
            filter: tFilter,
            isLoading: false,
          ),
        ],
        verify: (cubit) {
          expect(cubit.pagingController.itemList, [tThread]);
        },
      );

      blocTest<SearchResultCubit, SearchResultState>(
        'emits error when stream emits error',
        build: () {
          when(
            () => mockListCollectionThreads(
              collectionId: any(named: 'collectionId'),
              filter: any(named: 'filter'),
            ),
          ).thenAnswer((_) => Stream.error(Exception('error')));
          return SearchResultCubit(mockListCollectionThreads);
        },
        act: (cubit) => cubit.init(tCollectionId, tFilter),
        expect: () => [
          const SearchResultState(collectionId: tCollectionId, filter: tFilter),
          const SearchResultState(
            collectionId: tCollectionId,
            filter: tFilter,
            isLoading: true,
          ),
          const SearchResultState(
            collectionId: tCollectionId,
            filter: tFilter,
            isLoading: false,
            error: 'Exception: error',
          ),
        ],
        verify: (cubit) {
          expect(cubit.pagingController.error, isInstanceOf<Exception>());
        },
      );
    });
  });
}
