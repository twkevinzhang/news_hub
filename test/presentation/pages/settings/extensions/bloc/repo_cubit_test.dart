import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/repo/interactor/add_repo.dart';
import 'package:news_hub/domain/repo/interactor/list_repos.dart';
import 'package:news_hub/domain/repo/interactor/remove_repo.dart';
import 'package:news_hub/presentation/pages/settings/extensions/bloc/repo_cubit.dart';
import 'package:news_hub/shared/models.dart';

class MockListRepos extends Mock implements ListRepos {}

class MockAddRepo extends Mock implements AddRepo {}

class MockRemoveRepo extends Mock implements RemoveRepo {}

void main() {
  group('RepoCubit', () {
    late MockListRepos mockListRepos;
    late MockAddRepo mockAddRepo;
    late MockRemoveRepo mockRemoveRepo;

    final tRepo = Repo(
      baseUrl: 'http://test.com',
      displayName: 'Test Repo',
      website: 'http://test.com',
      signingKeyFingerprint: '123',
      icon: null,
    );
    final tException = Exception('fail');

    setUp(() {
      mockListRepos = MockListRepos();
      mockAddRepo = MockAddRepo();
      mockRemoveRepo = MockRemoveRepo();
    });

    test('initial state is correct', () {
      final cubit = RepoCubit(
        listRepos: mockListRepos,
        addRepo: mockAddRepo,
        removeRepo: mockRemoveRepo,
      );
      expect(cubit.state, const RepoState(repos: Result.initial()));
      cubit.close();
    });

    group('init', () {
      blocTest<RepoCubit, RepoState>(
        'emits [loading, completed] when successful',
        build: () {
          when(
            () => mockListRepos(),
          ).thenAnswer((_) async => Result.completed([tRepo]));
          return RepoCubit(
            listRepos: mockListRepos,
            addRepo: mockAddRepo,
            removeRepo: mockRemoveRepo,
          );
        },
        act: (cubit) => cubit.init(),
        expect: () => [
          const RepoState(repos: Result.loading()),
          RepoState(repos: Result.completed([tRepo])),
        ],
      );

      blocTest<RepoCubit, RepoState>(
        'emits [loading, error] when fails',
        build: () {
          when(
            () => mockListRepos(),
          ).thenAnswer((_) async => Result.error(tException));
          return RepoCubit(
            listRepos: mockListRepos,
            addRepo: mockAddRepo,
            removeRepo: mockRemoveRepo,
          );
        },
        act: (cubit) => cubit.init(),
        expect: () => [
          const RepoState(repos: Result.loading()),
          RepoState(repos: Result.error(tException)),
        ],
      );
    });

    group('addRepo', () {
      blocTest<RepoCubit, RepoState>(
        'calls addRepo then init',
        build: () {
          when(
            () => mockAddRepo(url: any(named: 'url')),
          ).thenAnswer((_) async {});
          when(
            () => mockListRepos(),
          ).thenAnswer((_) async => Result.completed([tRepo]));
          return RepoCubit(
            listRepos: mockListRepos,
            addRepo: mockAddRepo,
            removeRepo: mockRemoveRepo,
          );
        },
        act: (cubit) => cubit.addRepo(url: 'url'),
        expect: () => [
          const RepoState(repos: Result.loading()),
          RepoState(repos: Result.completed([tRepo])),
        ],
        verify: (_) {
          verify(() => mockAddRepo(url: 'url')).called(1);
        },
      );

      blocTest<RepoCubit, RepoState>(
        'emits error if addRepo fails',
        build: () {
          when(() => mockAddRepo(url: any(named: 'url'))).thenThrow(tException);
          return RepoCubit(
            listRepos: mockListRepos,
            addRepo: mockAddRepo,
            removeRepo: mockRemoveRepo,
          );
        },
        act: (cubit) => cubit.addRepo(url: 'url'),
        expect: () => [RepoState(repos: Result.error(tException))],
      );
    });

    group('removeRepo', () {
      blocTest<RepoCubit, RepoState>(
        'calls removeRepo then init',
        build: () {
          when(() => mockRemoveRepo(any())).thenAnswer((_) async {});
          when(
            () => mockListRepos(),
          ).thenAnswer((_) async => Result.completed([tRepo]));
          return RepoCubit(
            listRepos: mockListRepos,
            addRepo: mockAddRepo,
            removeRepo: mockRemoveRepo,
          );
        },
        act: (cubit) => cubit.removeRepo('url'),
        expect: () => [
          const RepoState(repos: Result.loading()),
          RepoState(repos: Result.completed([tRepo])),
        ],
        verify: (_) {
          verify(() => mockRemoveRepo('url')).called(1);
        },
      );

      blocTest<RepoCubit, RepoState>(
        'emits error if removeRepo fails',
        build: () {
          when(() => mockRemoveRepo(any())).thenThrow(tException);
          return RepoCubit(
            listRepos: mockListRepos,
            addRepo: mockAddRepo,
            removeRepo: mockRemoveRepo,
          );
        },
        act: (cubit) => cubit.removeRepo('url'),
        expect: () => [RepoState(repos: Result.error(tException))],
      );
    });
  });
}
