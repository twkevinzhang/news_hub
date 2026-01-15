import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/pages/settings/collections/bloc/collection_cubit.dart';

import '../../../../../helpers/test_data_factory.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

void main() {
  late CollectionCubit cubit;
  late MockCollectionRepository mockRepository;

  setUp(() {
    mockRepository = MockCollectionRepository();
    cubit = CollectionCubit(mockRepository);
  });

  tearDown(() {
    // cubit.close();
  });

  group('CollectionCubit', () {
    final tCollection = TestDataFactory.createCollection(
      id: 'col_1',
      name: 'Collection 1',
    );
    final List<Collection> tCollections = [tCollection];

    test('initial state is correct', () {
      expect(cubit.state, const CollectionState());
    });

    group('load', () {
      late StreamController<List<Collection>> streamController;

      setUp(() {
        streamController = StreamController<List<Collection>>();
      });

      tearDown(() {
        streamController.close();
      });

      blocTest<CollectionCubit, CollectionState>(
        'emits loading and then collections from stream',
        build: () {
          when(
            () => mockRepository.watchList(),
          ).thenAnswer((_) => streamController.stream);
          return cubit;
        },
        act: (cubit) async {
          await cubit.load();
          streamController.add(tCollections);
        },
        expect: () => [
          const CollectionState(isLoading: true),
          CollectionState(collections: tCollections, isLoading: false),
        ],
      );

      blocTest<CollectionCubit, CollectionState>(
        'emits error state when stream has error',
        build: () {
          when(
            () => mockRepository.watchList(),
          ).thenAnswer((_) => streamController.stream);
          return cubit;
        },
        act: (cubit) async {
          await cubit.load();
          streamController.addError('fail');
        },
        expect: () => [
          const CollectionState(isLoading: true),
          const CollectionState(isLoading: false, errorMessage: 'fail'),
        ],
      );
    });

    group('actions', () {
      blocTest<CollectionCubit, CollectionState>(
        'deleteCollection calls repository delete',
        build: () {
          when(() => mockRepository.delete(any())).thenAnswer((_) async {});
          return cubit;
        },
        act: (cubit) => cubit.deleteCollection('col_1'),
        verify: (_) {
          verify(() => mockRepository.delete('col_1')).called(1);
        },
      );

      blocTest<CollectionCubit, CollectionState>(
        'reorderCollections performs optimistic update and calls reorder',
        seed: () => CollectionState(
          collections: [
            TestDataFactory.createCollection(id: '1'),
            TestDataFactory.createCollection(id: '2'),
          ],
        ),
        build: () {
          when(() => mockRepository.reorder(any())).thenAnswer((_) async {});
          return cubit;
        },
        act: (cubit) => cubit.reorderCollections(0, 2),
        expect: () => [
          predicate<CollectionState>(
            (state) =>
                state.collections.length == 2 &&
                state.collections[0].id == '2' &&
                state.collections[1].id == '1',
          ),
        ],
        verify: (_) {
          verify(() => mockRepository.reorder(['2', '1'])).called(1);
        },
      );

      blocTest<CollectionCubit, CollectionState>(
        'toggleSortingMode toggles boolean values',
        build: () => cubit,
        act: (cubit) => cubit.toggleSortingMode(),
        expect: () => [const CollectionState(isSortingMode: true)],
      );
    });
  });
}
