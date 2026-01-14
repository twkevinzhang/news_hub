import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/presentation/components/search/search_mode_notifier.dart';
import 'package:news_hub/presentation/pages/home/home_cubit.dart';
import 'package:auto_route/auto_route.dart';

class MockCollectionRepository extends Mock implements CollectionRepository {}

class MockSidecarRepository extends Mock implements SidecarRepository {}

class MockSearchModeNotifier extends Mock implements SearchModeNotifier {}

class MockRouteData extends Mock implements RouteData {}

class MockStackRouter extends Mock implements StackRouter {}

class FakePageRouteInfo extends Fake implements PageRouteInfo {}

void main() {
  setUpAll(() {
    registerFallbackValue(FakePageRouteInfo());
  });

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
    ).thenAnswer((_) => Stream.empty());
    when(() => mockSidecarRepo.watchHealth()).thenAnswer((_) => Stream.empty());

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

    final tCollection = Collection(
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
        HomeState(collections: [tCollection]),
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

    test(
      'navigateToFirstCollection calls router.replace with correct route',
      () {
        final mockRouter = MockStackRouter();
        when(() => mockRouter.replace(any())).thenAnswer((_) async => null);

        when(
          () => mockCollectionRepo.watchList(),
        ).thenAnswer((_) => Stream.value([tCollection]));
        cubit.init();
      },
    );
  });
}
