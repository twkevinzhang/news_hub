import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/suggestion/interactor/delete_all_suggestions.dart';
import 'package:news_hub/domain/suggestion/interactor/delete_suggestion.dart';
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart';
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart';
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart';
import 'package:news_hub/domain/thread/interactor/search_threads.dart';
import 'package:news_hub/presentation/components/forms/thread-search/bloc/search_form_cubit.dart';
import 'package:news_hub/shared/models.dart';

import '../../../../../helpers/test_data_factory.dart';

class MockListSuggestions extends Mock implements ListSuggestions {}

class MockUpdateSuggestionLatestUsedAt extends Mock
    implements UpdateSuggestionLatestUsedAt {}

class MockInsertSuggestion extends Mock implements InsertSuggestion {}

class MockDeleteSuggestion extends Mock implements DeleteSuggestion {}

class MockDeleteAllSuggestions extends Mock implements DeleteAllSuggestions {}

class MockSearchThreads extends Mock implements SearchThreads {}

void main() {
  late SearchFormCubit cubit;
  late MockListSuggestions mockListSuggestions;
  late MockUpdateSuggestionLatestUsedAt mockUpdateSuggestionLatestUsedAt;
  late MockInsertSuggestion mockInsertSuggestion;
  late MockDeleteSuggestion mockDeleteSuggestion;
  late MockDeleteAllSuggestions mockDeleteAllSuggestions;
  late MockSearchThreads mockSearchThreads;

  setUp(() {
    mockListSuggestions = MockListSuggestions();
    mockUpdateSuggestionLatestUsedAt = MockUpdateSuggestionLatestUsedAt();
    mockInsertSuggestion = MockInsertSuggestion();
    mockDeleteSuggestion = MockDeleteSuggestion();
    mockDeleteAllSuggestions = MockDeleteAllSuggestions();
    mockSearchThreads = MockSearchThreads();

    cubit = SearchFormCubit(
      listSuggestions: mockListSuggestions,
      updateSuggestionLatestUsedAt: mockUpdateSuggestionLatestUsedAt,
      insertSuggestion: mockInsertSuggestion,
      deleteSuggestion: mockDeleteSuggestion,
      deleteAllSuggestions: mockDeleteAllSuggestions,
      listThreadList: mockSearchThreads,
    );
  });

  tearDown(() {
    cubit.close();
  });

  group('SearchFormCubit', () {
    final tSuggestion = TestDataFactory.createSuggestion();
    final List<Suggestion> tSuggestions = [tSuggestion];
    final tFilter = const ThreadsFilter(boardSorts: {}, keywords: 'initial');

    test('initial state is correct', () {
      expect(
        cubit.state,
        const SearchFormState(
          suggestions: Result.initial(),
          resultFilteredSuggestions: [],
          filter: ThreadsFilter(boardSorts: {}, keywords: ''),
          submittedFilter: ThreadsFilter(boardSorts: {}, keywords: ''),
        ),
      );
    });

    group('init', () {
      blocTest<SearchFormCubit, SearchFormState>(
        'emits [loading, completed] when successful',
        build: () {
          when(
            () => mockListSuggestions.call(),
          ).thenAnswer((_) async => tSuggestions);
          return cubit;
        },
        act: (cubit) => cubit.init(null),
        expect: () => [
          cubit.state.copyWith(suggestions: const Result.loading()),
          cubit.state.copyWith(suggestions: Result.completed(tSuggestions)),
        ],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'emits [loading, completed] with initialFilter when provided',
        build: () {
          when(
            () => mockListSuggestions.call(),
          ).thenAnswer((_) async => tSuggestions);
          return cubit;
        },
        act: (cubit) => cubit.init(tFilter),
        expect: () => [
          cubit.state.copyWith(
            suggestions: const Result.loading(),
            filter: tFilter,
            submittedFilter: tFilter,
          ),
          cubit.state.copyWith(
            suggestions: Result.completed(tSuggestions),
            filter: tFilter,
            submittedFilter: tFilter,
          ),
        ],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'emits [loading, error] when fails',
        build: () {
          when(() => mockListSuggestions.call()).thenThrow(Exception('fail'));
          return cubit;
        },
        act: (cubit) => cubit.init(null),
        expect: () => [
          cubit.state.copyWith(suggestions: const Result.loading()),
          predicate<SearchFormState>(
            (state) => state.suggestions is ResultError,
          ),
        ],
      );
    });

    group('keyword management', () {
      blocTest<SearchFormCubit, SearchFormState>(
        'setKeywords updates filter keywords',
        build: () => cubit,
        act: (cubit) => cubit.setKeywords('new keywords'),
        expect: () => [cubit.state.copyWith.filter(keywords: 'new keywords')],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'clearKeywords resets filter keywords to empty',
        seed: () => cubit.state.copyWith.filter(keywords: 'something'),
        build: () => cubit,
        act: (cubit) => cubit.clearKeywords(),
        expect: () => [cubit.state.copyWith.filter(keywords: '')],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'addKeywords appends keywords with space when not empty',
        seed: () => cubit.state.copyWith.filter(keywords: 'old'),
        build: () => cubit,
        act: (cubit) => cubit.addKeywords('new'),
        expect: () => [cubit.state.copyWith.filter(keywords: 'old new')],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'addKeywords sets keywords directly when empty',
        build: () => cubit,
        act: (cubit) => cubit.addKeywords('new'),
        expect: () => [cubit.state.copyWith.filter(keywords: 'new')],
      );
    });

    group('suggestion interactions', () {
      blocTest<SearchFormCubit, SearchFormState>(
        'clickSuggestion adds keywords and updates used at',
        build: () {
          when(
            () => mockUpdateSuggestionLatestUsedAt.call(any()),
          ).thenAnswer((_) async => null);
          return cubit;
        },
        act: (cubit) => cubit.clickSuggestion(tSuggestion),
        verify: (_) {
          verify(
            () => mockUpdateSuggestionLatestUsedAt.call(tSuggestion.id),
          ).called(1);
        },
        expect: () => [
          cubit.state.copyWith.filter(keywords: tSuggestion.keywords),
        ],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'createSuggestion calls insertSuggestion with filter keywords',
        seed: () => cubit.state.copyWith.filter(keywords: 'test'),
        build: () {
          when(
            () => mockInsertSuggestion.call(keywords: any(named: 'keywords')),
          ).thenAnswer((_) async => null);
          return cubit;
        },
        act: (cubit) => cubit.createSuggestion(),
        verify: (_) {
          verify(() => mockInsertSuggestion.call(keywords: 'test')).called(1);
        },
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'removeSuggestion calls delete and reloads',
        build: () {
          when(
            () => mockDeleteSuggestion.call(any()),
          ).thenAnswer((_) async => null);
          when(() => mockListSuggestions.call()).thenAnswer((_) async => []);
          return cubit;
        },
        act: (cubit) => cubit.removeSuggestion('s_1'),
        verify: (_) {
          verify(() => mockDeleteSuggestion.call('s_1')).called(1);
          verify(() => mockListSuggestions.call()).called(1);
        },
        expect: () => [
          cubit.state.copyWith(suggestions: const Result.completed([])),
        ],
      );
    });

    group('form actions', () {
      final tSubmittedFilter = const ThreadsFilter(
        boardSorts: {},
        keywords: 'submitted',
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'reset restores filter from submittedFilter',
        seed: () => cubit.state.copyWith(
          filter: const ThreadsFilter(boardSorts: {}, keywords: 'changing'),
          submittedFilter: tSubmittedFilter,
        ),
        build: () => cubit,
        act: (cubit) => cubit.reset(),
        expect: () => [
          cubit.state.copyWith(
            filter: tSubmittedFilter,
            submittedFilter: tSubmittedFilter,
          ),
        ],
      );

      blocTest<SearchFormCubit, SearchFormState>(
        'submit updates submittedFilter and creates suggestion',
        seed: () => cubit.state.copyWith(
          filter: const ThreadsFilter(boardSorts: {}, keywords: 'search query'),
        ),
        build: () {
          when(
            () => mockInsertSuggestion.call(keywords: any(named: 'keywords')),
          ).thenAnswer((_) async => null);
          return cubit;
        },
        act: (cubit) => cubit.submit(),
        verify: (_) {
          verify(
            () => mockInsertSuggestion.call(keywords: 'search query'),
          ).called(1);
        },
        expect: () => [
          cubit.state.copyWith(
            filter: const ThreadsFilter(
              boardSorts: {},
              keywords: 'search query',
            ),
            submittedFilter: const ThreadsFilter(
              boardSorts: {},
              keywords: 'search query',
            ),
          ),
        ],
      );
    });
  });
}
