import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/app/service/connection/interface.dart';
import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/app/sidecar/preferences/sidecar_preferences.dart';
import 'package:news_hub/app/sidecar/repository/sidecar_repository_impl.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';

class MockSidecarConnectionManager extends Mock
    implements SidecarConnectionManager {}

class MockSidecarPreferences extends Mock implements SidecarPreferences {}

class MockPreference<T> extends Mock implements Preference<T> {}

void main() {
  late SidecarRepositoryImpl repository;
  late MockSidecarConnectionManager mockConnectionManager;
  late MockSidecarPreferences mockPreferences;
  late MockPreference<String> mockLogLevelPref;
  late MockPreference<int> mockMaxLogEntriesPref;
  late MockPreference<bool> mockAutoScrollPref;

  setUp(() {
    mockConnectionManager = MockSidecarConnectionManager();
    mockPreferences = MockSidecarPreferences();
    mockLogLevelPref = MockPreference<String>();
    mockMaxLogEntriesPref = MockPreference<int>();
    mockAutoScrollPref = MockPreference<bool>();

    when(() => mockPreferences.logLevel).thenReturn(mockLogLevelPref);
    when(() => mockPreferences.maxLogEntries).thenReturn(mockMaxLogEntriesPref);
    when(() => mockPreferences.autoScroll).thenReturn(mockAutoScrollPref);

    repository = SidecarRepositoryImpl(mockConnectionManager, mockPreferences);
  });

  group('SidecarRepositoryImpl', () {
    test('watchHealth delegates to connection manager', () {
      when(
        () => mockConnectionManager.state,
      ).thenReturn(SidecarConnectionState.uninitialized);
      when(
        () => mockConnectionManager.stateStream,
      ).thenAnswer((_) => Stream.value(SidecarConnectionState.connected));

      expect(
        repository.watchHealth(),
        emitsInOrder([
          SidecarConnectionState.uninitialized,
          SidecarConnectionState.connected,
        ]),
      );
    });

    test('getHealthStatus ensures connected and returns state', () async {
      when(
        () => mockConnectionManager.waitUntilConnected(),
      ).thenAnswer((_) async {});
      when(
        () => mockConnectionManager.state,
      ).thenReturn(SidecarConnectionState.connected);

      final status = await repository.getHealthStatus();

      verify(() => mockConnectionManager.waitUntilConnected()).called(1);
      expect(status, SidecarConnectionState.connected);
    });

    test('getSettings retrieves values from preferences', () async {
      when(() => mockLogLevelPref.get()).thenAnswer((_) async => 'DEBUG');
      when(() => mockMaxLogEntriesPref.get()).thenAnswer((_) async => 2000);
      when(() => mockAutoScrollPref.get()).thenAnswer((_) async => false);

      final settings = await repository.getSettings();

      expect(settings.logLevel, LogLevel.debug);
      expect(settings.maxLogEntries, 2000);
      expect(settings.autoScroll, false);
    });

    test('watchSettings combines preference streams', () {
      when(
        () => mockLogLevelPref.changes(),
      ).thenAnswer((_) => Stream.value('INFO'));
      when(
        () => mockMaxLogEntriesPref.changes(),
      ).thenAnswer((_) => Stream.value(100));
      when(
        () => mockAutoScrollPref.changes(),
      ).thenAnswer((_) => Stream.value(true));

      expect(
        repository.watchSettings(),
        emits(
          isA<SidecarSettings>()
              .having((s) => s.logLevel, 'logLevel', LogLevel.info)
              .having((s) => s.maxLogEntries, 'maxLogEntries', 100)
              .having((s) => s.autoScroll, 'autoScroll', true),
        ),
      );
    });
  });
}
