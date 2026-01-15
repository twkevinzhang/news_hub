import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/interactor/list_extensions.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/extension/interactor/list_remote_extensions.dart';
import 'package:news_hub/domain/extension/services/extension_settings.dart';
import 'package:news_hub/app/service/preferences/preference.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/shared/failures.dart';

class MockExtensionSettings extends Mock implements ExtensionSettings {}

class MockListInstalledExtensions extends Mock
    implements ListInstalledExtensions {}

class MockListRemoteExtensions extends Mock implements ListRemoteExtensions {}

class MockPreference<T> extends Mock implements Preference<T> {}

void main() {
  late ListExtensions useCase;
  late MockExtensionSettings mockSettings;
  late MockListInstalledExtensions mockListInstalled;
  late MockListRemoteExtensions mockListRemote;

  setUp(() {
    mockSettings = MockExtensionSettings();
    mockListInstalled = MockListInstalledExtensions();
    mockListRemote = MockListRemoteExtensions();
    useCase = ListExtensions(
      prefService: mockSettings,
      listInstalledExtensions: mockListInstalled,
      listRemoteExtensions: mockListRemote,
    );
  });

  final List<Extension> tInstalled = [
    const Extension(
      pkgName: 'ext.a',
      displayName: 'Ext A',
      version: 1,
      pythonVersion: 3,
      lang: 'en',
      isNsfw: false,
    ),
  ];
  final List<RemoteExtension> tRemotes = [
    const RemoteExtension(
      pkgName: 'ext.a',
      displayName: 'Ext A',
      version: 2,
      pythonVersion: 3,
      lang: 'en',
      isNsfw: false,
      repoUrl: '',
      iconUrl: '',
    ),
    const RemoteExtension(
      pkgName: 'ext.b',
      displayName: 'Ext B',
      version: 1,
      pythonVersion: 3,
      lang: 'en',
      isNsfw: false,
      repoUrl: '',
      iconUrl: '',
    ),
  ];

  test('asStream 應先發射 Loading 然後發射組合後的 Extensions', () async {
    // Arrange
    final mockLangsPref = MockPreference<Set<String>>();
    when(() => mockSettings.enabledLanguages()).thenReturn(mockLangsPref);
    when(() => mockLangsPref.get()).thenAnswer((_) async => {'en'});
    when(() => mockLangsPref.changes()).thenAnswer(
      (_) => Stream.fromIterable([
        {'en'},
      ]),
    );

    when(
      () => mockListInstalled.call(),
    ).thenAnswer((_) async => Result.completed(tInstalled));
    when(
      () => mockListRemote.call(),
    ).thenAnswer((_) async => Result.completed(tRemotes));

    // Act & Assert
    final stream = useCase.asStream(null);
    final results = await stream.take(2).toList();

    expect(results[0], isA<ResultLoading<Extensions>>());
    expect(results[1], isA<ResultCompleted<Extensions>>());

    final result = results[1] as ResultCompleted<Extensions>;
    expect(result.data.installed.length, 1);
    expect(result.data.updates.length, 1); // ext.a v1 < v2
    expect(result.data.notInstalled.length, 1); // ext.b
  });

  test('當其中一個子任務失敗時，應發射 Result.error', () async {
    // Arrange
    final mockLangsPref = MockPreference<Set<String>>();
    when(() => mockSettings.enabledLanguages()).thenReturn(mockLangsPref);
    when(() => mockLangsPref.get()).thenAnswer((_) async => {'en'});

    when(() => mockListInstalled.call()).thenAnswer(
      (_) async => const Result.error(Failure.unexpected(message: 'Fail')),
    );
    when(
      () => mockListRemote.call(),
    ).thenAnswer((_) async => Result.completed(tRemotes));

    // Act
    final stream = useCase.asStream(null);

    // Assert
    expect(
      stream,
      emitsInOrder([
        isA<ResultLoading<Extensions>>(),
        isA<ResultError<Extensions>>(),
      ]),
    );
  });
}
