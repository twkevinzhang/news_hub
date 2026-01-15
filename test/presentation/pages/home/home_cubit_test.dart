import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/presentation/components/forms/thread-search/search_mode_notifier.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

class MockSidecarRepository extends Mock implements SidecarRepository {}

class MockSearchModeNotifier extends Mock implements SearchModeNotifier {}

void main() {
  late HomeCubit cubit;
  late MockCollectionRepository mockCollectionRepo;
  late MockSidecarRepository mockSidecarRepo;
  late MockSearchModeNotifier mockSearchModeNotifier;

  setUp(() {
    mockCollectionRepo = MockCollectionRepository();
    mockSidecarRepo = MockSidecarRepository();
    mockSearchModeNotifier = MockSearchModeNotifier();

    // Default mocks
    when(
      () => mockCollectionRepo.watchList(),
    ).thenAnswer((_) => const Stream.empty());
    when(
      () => mockSidecarRepo.watchHealth(),
    ).thenAnswer((_) => const Stream.empty());

    cubit = HomeCubit(
      mockCollectionRepo,
      mockSidecarRepo,
      mockSearchModeNotifier,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('HomeCubit', () {
    test('initial state is correct', () {
      expect(cubit.state, const HomeState());
    });

    blocTest<HomeCubit, HomeState>(
      'init subscribes to repositories',
      build: () => cubit,
      act: (cubit) => cubit.init(),
      verify: (_) {
        verify(() => mockCollectionRepo.watchList()).called(1);
        verify(() => mockSidecarRepo.watchHealth()).called(1);
      },
    );

    const tCollection = Collection(
      id: 'col1',
      name: 'My Collection',
      boards: [],
    );

    blocTest<HomeCubit, HomeState>(
      'emits collection updates when repository stream emits',
      build: () {
        when(
          () => mockCollectionRepo.watchList(),
        ).thenAnswer((_) => Stream.value([tCollection]));
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const HomeState(collections: [tCollection]),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits sidecar status updates when repository stream emits',
      build: () {
        when(
          () => mockSidecarRepo.watchHealth(),
        ).thenAnswer((_) => Stream.value(SidecarConnectionState.connected));
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const HomeState(sidecarStatus: SidecarConnectionState.connected),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'emits sidecar failure when subscription errors',
      build: () {
        when(
          () => mockSidecarRepo.watchHealth(),
        ).thenAnswer((_) => Stream.error(Exception('fail')));
        return cubit;
      },
      act: (cubit) => cubit.init(),
      expect: () => [
        const HomeState(
          sidecarStatus: SidecarConnectionState.failed,
          sidecarMessage: 'Connection error: Exception: fail',
        ),
      ],
    );

    blocTest<HomeCubit, HomeState>(
      'toggleCollectionExpansion updates expandedCollectionId',
      build: () => cubit,
      seed: () => const HomeState(expandedCollectionId: null),
      act: (cubit) => cubit.toggleCollectionExpansion('col1'),
      expect: () => [const HomeState(expandedCollectionId: 'col1')],
    );

    blocTest<HomeCubit, HomeState>(
      'toggleCollectionExpansion with same id clears it',
      build: () => cubit,
      seed: () => const HomeState(expandedCollectionId: 'col1'),
      act: (cubit) => cubit.toggleCollectionExpansion('col1'),
      expect: () => [const HomeState(expandedCollectionId: null)],
    );

    test('triggerSearch enters search mode', () {
      cubit.triggerSearch();
      verify(() => mockSearchModeNotifier.enterSearchMode()).called(1);
    });
  });
}
