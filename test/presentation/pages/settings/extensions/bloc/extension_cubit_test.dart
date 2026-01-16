import 'dart:async';
import 'package:bloc_test/bloc_test.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/interactor/install_extension.dart';
import 'package:news_hub/domain/extension/interactor/list_extensions.dart';
import 'package:news_hub/domain/extension/interactor/uninstall_extension.dart';
import 'package:news_hub/domain/extension/repository.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/extension_cubit.dart';
import 'package:news_hub/shared/models.dart';

import '../../../../../helpers/test_data_factory.dart';

class MockListExtensions extends Mock implements ListExtensions {}

class MockInstallExtension extends Mock implements InstallExtension {}

class MockUninstallExtension extends Mock implements UninstallExtension {}

void main() {
  late ExtensionCubit cubit;
  late MockListExtensions mockListExtensions;
  late MockInstallExtension mockInstallExtension;
  late MockUninstallExtension mockUninstallExtension;

  setUpAll(() {
    registerFallbackValue(TestDataFactory.createExtension());
  });

  setUp(() {
    mockListExtensions = MockListExtensions();
    mockInstallExtension = MockInstallExtension();
    mockUninstallExtension = MockUninstallExtension();
    cubit = ExtensionCubit(
      listExtensions: mockListExtensions,
      installExtension: mockInstallExtension,
      uninstallExtension: mockUninstallExtension,
    );
  });

  tearDown(() {
    // blocTest will close the cubit
  });

  group('ExtensionCubit', () {
    final tExtension = TestDataFactory.createExtension();
    final tExtensions = Extensions(
      installed: {tExtension},
      updates: {},
      deprecated: {},
      notInstalled: {},
    );

    test('initial state is correct', () {
      expect(
        cubit.state,
        const ExtensionState(
          keyword: null,
          extensions: Result.initial(),
          installingExtensions: {},
        ),
      );
    });

    group('loadExtensions', () {
      blocTest<ExtensionCubit, ExtensionState>(
        'emits Result.completed with extensions on success',
        build: () {
          when(
            () => mockListExtensions(any()),
          ).thenAnswer((_) async => Result.completed(tExtensions));
          return cubit;
        },
        act: (cubit) => cubit.loadExtensions(),
        expect: () => [
          cubit.state.copyWith(extensions: Result.completed(tExtensions)),
        ],
      );
    });

    group('installExtension', () {
      late StreamController<Pair<InstallStatus, double>> streamController;

      setUp(() {
        streamController = StreamController<Pair<InstallStatus, double>>();
      });

      tearDown(() {
        streamController.close();
      });

      blocTest<ExtensionCubit, ExtensionState>(
        'tracks progress and reloads on completion',
        build: () {
          when(
            () => mockInstallExtension.call(any()),
          ).thenAnswer((_) => streamController.stream);
          when(
            () => mockListExtensions(any()),
          ).thenAnswer((_) async => Result.completed(tExtensions));
          return cubit;
        },
        act: (cubit) async {
          await cubit.installExtension(tExtension);
          streamController.add(const Pair(InstallStatus.downloading, 0.5));
          streamController.add(const Pair(InstallStatus.completed, 1.0));
        },
        expect: () => [
          // Downloading
          predicate<ExtensionState>(
            (state) =>
                state.installingExtensions[tExtension.pkgName]?.first ==
                InstallStatus.downloading,
          ),
          // Completed (first emit before removal)
          predicate<ExtensionState>(
            (state) =>
                state.installingExtensions[tExtension.pkgName]?.first ==
                InstallStatus.completed,
          ),
          // After removal
          predicate<ExtensionState>(
            (state) =>
                !state.installingExtensions.containsKey(tExtension.pkgName),
          ),
          // Reloaded extensions
          predicate<ExtensionState>(
            (state) => state.extensions is ResultCompleted,
          ),
        ],
      );

      blocTest<ExtensionCubit, ExtensionState>(
        'removes from installing on error',
        build: () {
          when(
            () => mockInstallExtension.call(any()),
          ).thenAnswer((_) => streamController.stream);
          return cubit;
        },
        act: (cubit) async {
          await cubit.installExtension(tExtension);
          streamController.addError(Exception('fail'));
        },
        expect: () => [
          // Initial entry (skipped if we want, but here we expect the error handling)
          predicate<ExtensionState>(
            (state) => state.installingExtensions.isEmpty,
          ),
        ],
      );
    });

    group('uninstallExtension', () {
      blocTest<ExtensionCubit, ExtensionState>(
        'calls uninstall and reloads',
        build: () {
          when(
            () => mockUninstallExtension.call(any()),
          ).thenAnswer((_) async {});
          when(
            () => mockListExtensions(any()),
          ).thenAnswer((_) async => Result.completed(tExtensions));
          return cubit;
        },
        act: (cubit) => cubit.uninstallExtension(tExtension),
        verify: (_) {
          verify(() => mockUninstallExtension.call(tExtension)).called(1);
          verify(() => mockListExtensions(any())).called(1);
        },
      );

      blocTest<ExtensionCubit, ExtensionState>(
        'does nothing if extension is installing',
        seed: () => ExtensionState(
          keyword: null,
          extensions: Result.completed(tExtensions),
          installingExtensions: {
            tExtension.pkgName: const Pair(InstallStatus.downloading, 0.5),
          },
        ),
        build: () => cubit,
        act: (cubit) => cubit.uninstallExtension(tExtension),
        verify: (_) {
          verifyNever(() => mockUninstallExtension.call(any()));
        },
      );
    });
  });
}
