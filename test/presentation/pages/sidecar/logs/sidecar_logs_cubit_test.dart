import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/app/service/connection/interface.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/models/sidecar/log_entry.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/presentation/pages/sidecar/logs/sidecar_logs_cubit.dart';

import '../../../../helpers/test_data_factory.dart';

class MockSidecarRepository extends Mock implements SidecarRepository {}

class MockSidecarConnectionManager extends Mock
    implements SidecarConnectionManager {}

void main() {
  group('SidecarLogsCubit', () {
    late MockSidecarRepository mockRepository;
    late MockSidecarConnectionManager mockConnectionManager;

    final tLog = TestDataFactory.createLogEntry();
    final tSettings = SidecarSettings(
      logLevel: LogLevel.info,
      maxLogEntries: 3,
      autoScroll: true,
    );

    setUpAll(() {
      registerFallbackValue(LogLevel.info);
    });

    setUp(() {
      mockRepository = MockSidecarRepository();
      mockConnectionManager = MockSidecarConnectionManager();

      when(
        () => mockRepository.getSettings(),
      ).thenAnswer((_) async => tSettings);

      when(
        () => mockRepository.watchLogs(minLevel: any(named: 'minLevel')),
      ).thenAnswer((_) => const Stream.empty());
      when(
        () => mockRepository.watchHealth(),
      ).thenAnswer((_) => const Stream.empty());
    });

    test('initial state is correct', () {
      final cubit = SidecarLogsCubit(mockRepository, mockConnectionManager);
      expect(cubit.state, const SidecarLogsState());
      cubit.close();
    });

    group('startWatching', () {
      blocTest<SidecarLogsCubit, SidecarLogsState>(
        'fetching settings and listening to streams',
        build: () {
          when(
            () => mockRepository.watchLogs(minLevel: any(named: 'minLevel')),
          ).thenAnswer((_) => Stream.value(tLog));
          when(
            () => mockRepository.watchHealth(),
          ).thenAnswer((_) => Stream.value(SidecarConnectionState.connected));
          return SidecarLogsCubit(mockRepository, mockConnectionManager);
        },
        act: (cubit) => cubit.startWatching(),
        expect: () => [
          const SidecarLogsState(autoScroll: true),
          SidecarLogsState(autoScroll: true, logs: [tLog]),
          SidecarLogsState(
            autoScroll: true,
            logs: [tLog],
            connectionStatus: SidecarConnectionState.connected,
          ),
        ],
      );

      blocTest<SidecarLogsCubit, SidecarLogsState>(
        'respects max log entries',
        build: () {
          final logs = List.generate(
            4,
            (i) => TestDataFactory.createLogEntry(message: '$i'),
          );
          when(
            () => mockRepository.watchLogs(minLevel: any(named: 'minLevel')),
          ).thenAnswer((_) => Stream.fromIterable(logs));
          return SidecarLogsCubit(mockRepository, mockConnectionManager);
        },
        act: (cubit) => cubit.startWatching(),
        verify: (cubit) {
          expect(cubit.state.logs.length, 3);
          // Newest at end
          expect(cubit.state.logs.last.message, '3');
          expect(cubit.state.logs.first.message, '1');
        },
      );
    });

    group('Logic', () {
      blocTest<SidecarLogsCubit, SidecarLogsState>(
        'clearLogs clears logs',
        build: () => SidecarLogsCubit(mockRepository, mockConnectionManager),
        seed: () => SidecarLogsState(logs: [tLog]),
        act: (cubit) => cubit.clearLogs(),
        expect: () => [const SidecarLogsState(logs: [])],
      );

      blocTest<SidecarLogsCubit, SidecarLogsState>(
        'toggleAutoScroll updates state',
        build: () => SidecarLogsCubit(mockRepository, mockConnectionManager),
        act: (cubit) => cubit.toggleAutoScroll(false),
        expect: () => [const SidecarLogsState(autoScroll: false)],
      );

      blocTest<SidecarLogsCubit, SidecarLogsState>(
        'search query updates state',
        build: () => SidecarLogsCubit(mockRepository, mockConnectionManager),
        act: (cubit) => cubit.setSearchQuery('query'),
        expect: () => [const SidecarLogsState(searchQuery: 'query')],
      );

      blocTest<SidecarLogsCubit, SidecarLogsState>(
        'toggleSearch toggles',
        build: () => SidecarLogsCubit(mockRepository, mockConnectionManager),
        act: (cubit) => cubit.toggleSearch(),
        expect: () => [
          const SidecarLogsState(isSearching: true, searchQuery: ''),
        ],
      );

      blocTest<SidecarLogsCubit, SidecarLogsState>(
        'toggleSearch off clears query',
        build: () => SidecarLogsCubit(mockRepository, mockConnectionManager),
        seed: () =>
            const SidecarLogsState(isSearching: true, searchQuery: 'xxx'),
        act: (cubit) => cubit.toggleSearch(),
        expect: () => [
          const SidecarLogsState(isSearching: false, searchQuery: ''),
        ],
      );
    });

    blocTest<SidecarLogsCubit, SidecarLogsState>(
      'retryConnection calls reconnect',
      build: () {
        when(() => mockConnectionManager.reconnect()).thenAnswer((_) async {});
        return SidecarLogsCubit(mockRepository, mockConnectionManager);
      },
      act: (cubit) => cubit.retryConnection(),
      verify: (_) {
        verify(() => mockConnectionManager.reconnect()).called(1);
      },
    );
  });
}
