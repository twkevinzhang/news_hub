import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/presentation/components/rendering/boards-picker/bloc/boards_picker_cubit.dart';
import 'package:news_hub/shared/models.dart';

import '../../../../../helpers/test_data_factory.dart';

class MockListInstalledExtensions extends Mock
    implements ListInstalledExtensions {}

void main() {
  group('BoardsPickerCubit', () {
    late MockListInstalledExtensions mockListExtensions;

    const tExtPkg = 'ext1';
    final tBoard1 = TestDataFactory.createBoard(
      id: 'b1',
      extensionPkgName: tExtPkg,
      name: 'B1',
    );
    final tBoard2 = TestDataFactory.createBoard(
      id: 'b2',
      extensionPkgName: tExtPkg,
      name: 'B2',
    );

    final tExtensionWithBoards = TestDataFactory.createExtensionWithBoards(
      pkgName: tExtPkg,
      boards: {tBoard1, tBoard2},
    );

    setUp(() {
      mockListExtensions = MockListInstalledExtensions();
    });

    test('initial state is correct', () {
      final cubit = BoardsPickerCubit(mockListExtensions);
      expect(
        cubit.state,
        const BoardsPickerState(
          extensionBoards: Result.initial(),
          chosenBoards: {},
          submittedChosenBoards: {},
        ),
      );
      cubit.close();
    });

    group('init', () {
      test('loads extensions and updates state', () async {
        final cubit = BoardsPickerCubit(mockListExtensions);
        when(
          () => mockListExtensions.withBoards(),
        ).thenAnswer((_) async => Result.completed([tExtensionWithBoards]));

        await cubit.init();

        expect(
          cubit.state.extensionBoards,
          Result.completed([tExtensionWithBoards]),
        );
        cubit.close();
      });

      test('initializes with chosenBoards', () async {
        final cubit = BoardsPickerCubit(mockListExtensions);
        when(
          () => mockListExtensions.withBoards(),
        ).thenAnswer((_) async => Result.completed([tExtensionWithBoards]));
        final chosen = {'b1': 'hot'};

        await cubit.init(chosenBoards: chosen);

        expect(cubit.state.chosenBoards, chosen);
        expect(cubit.state.submittedChosenBoards, chosen);
        cubit.close();
      });
    });

    group('Checkbox Logic', () {
      late BoardsPickerCubit cubit;

      setUp(() {
        cubit = BoardsPickerCubit(mockListExtensions);
        // Pre-load data
        when(
          () => mockListExtensions.withBoards(),
        ).thenAnswer((_) async => Result.completed([tExtensionWithBoards]));
      });

      tearDown(() => cubit.close());

      test('getBoardCheckboxValue returns correct value', () async {
        await cubit.init(chosenBoards: {'b1': ''}); // select b1
        expect(cubit.getBoardCheckboxValue('b1'), true);
        expect(cubit.getBoardCheckboxValue('b2'), false);
      });

      test('getExtensionCheckboxValue returns correct value', () async {
        await cubit.init(chosenBoards: {});
        // none selected
        expect(cubit.getExtensionCheckboxValue(tExtPkg), false);

        await cubit.init(chosenBoards: {'b1': ''});
        // partial. returns null (indeterminate)
        expect(cubit.getExtensionCheckboxValue(tExtPkg), null);

        await cubit.init(chosenBoards: {'b1': '', 'b2': ''});
        // all
        expect(cubit.getExtensionCheckboxValue(tExtPkg), true);
      });
    });

    group('Toggling', () {
      blocTest<BoardsPickerCubit, BoardsPickerState>(
        'toggleBoard selects/deselects board',
        build: () {
          when(
            () => mockListExtensions.withBoards(),
          ).thenAnswer((_) async => Result.completed([tExtensionWithBoards]));
          return BoardsPickerCubit(mockListExtensions);
        },
        act: (cubit) async {
          await cubit.init();
          cubit.toggleBoard('b1', true); // Select
          cubit.toggleBoard('b1', false); // Deselect
        },
        expect: () => [
          // init loading
          const BoardsPickerState(
            extensionBoards: Result.loading(),
            chosenBoards: {},
            submittedChosenBoards: {},
          ),
          // init completed
          BoardsPickerState(
            extensionBoards: Result.completed([tExtensionWithBoards]),
            chosenBoards: {},
            submittedChosenBoards: {},
          ),
          // toggle true
          BoardsPickerState(
            extensionBoards: Result.completed([tExtensionWithBoards]),
            chosenBoards: {'b1': ''},
            submittedChosenBoards: {},
          ),
          // toggle false
          BoardsPickerState(
            extensionBoards: Result.completed([tExtensionWithBoards]),
            chosenBoards: {},
            submittedChosenBoards: {},
          ),
        ],
      );

      blocTest<BoardsPickerCubit, BoardsPickerState>(
        'toggleExtension selects/deselects all boards',
        build: () {
          when(
            () => mockListExtensions.withBoards(),
          ).thenAnswer((_) async => Result.completed([tExtensionWithBoards]));
          return BoardsPickerCubit(mockListExtensions);
        },
        act: (cubit) async {
          await cubit.init();
          cubit.toggleExtension(tExtPkg, true);
          cubit.toggleExtension(tExtPkg, false);
        },
        skip: 2, // Skip init states
        expect: () => [
          // Select All
          BoardsPickerState(
            extensionBoards: Result.completed([tExtensionWithBoards]),
            chosenBoards: {'b1': '', 'b2': ''},
            submittedChosenBoards: {},
          ),
          // Deselect All
          BoardsPickerState(
            extensionBoards: Result.completed([tExtensionWithBoards]),
            chosenBoards: {},
            submittedChosenBoards: {},
          ),
        ],
      );
    });

    group('Sorting & Submission', () {
      blocTest<BoardsPickerCubit, BoardsPickerState>(
        'setBoardSorting updates chosen boards',
        build: () => BoardsPickerCubit(mockListExtensions),
        act: (cubit) => cubit.setBoardSorting('b1', 'hot'),
        expect: () => [
          const BoardsPickerState(
            extensionBoards: Result.initial(),
            chosenBoards: {'b1': 'hot'},
            submittedChosenBoards: {},
          ),
        ],
      );

      blocTest<BoardsPickerCubit, BoardsPickerState>(
        'submit updates submittedChosenBoards',
        build: () => BoardsPickerCubit(mockListExtensions),
        seed: () => const BoardsPickerState(
          extensionBoards: Result.initial(),
          chosenBoards: {'b1': 'hot'},
          submittedChosenBoards: {},
        ),
        act: (cubit) => cubit.submit(),
        expect: () => [
          const BoardsPickerState(
            extensionBoards: Result.initial(),
            chosenBoards: {'b1': 'hot'},
            submittedChosenBoards: {'b1': 'hot'},
          ),
        ],
      );

      blocTest<BoardsPickerCubit, BoardsPickerState>(
        'reset reverts chosenBoards to submitted',
        build: () => BoardsPickerCubit(mockListExtensions),
        seed: () => const BoardsPickerState(
          extensionBoards: Result.initial(),
          chosenBoards: {'b1': 'new_change'},
          submittedChosenBoards: {'b1': 'original'},
        ),
        act: (cubit) => cubit.reset(),
        expect: () => [
          const BoardsPickerState(
            extensionBoards: Result.initial(),
            chosenBoards: {'b1': 'original'},
            submittedChosenBoards: {'b1': 'original'},
          ),
        ],
      );
    });
  });
}
