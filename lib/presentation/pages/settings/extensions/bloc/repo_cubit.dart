import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/repo/interactor/list_repos.dart';
import 'package:news_hub/domain/repo/interactor/add_repo.dart';
import 'package:news_hub/domain/repo/interactor/remove_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

part 'repo_cubit.freezed.dart';

@freezed
class RepoState with _$RepoState {
  const factory RepoState({
    required Result<List<Repo>> repos,
  }) = _RepoState;
}

@injectable
class RepoCubit extends Cubit<RepoState> {
  final ListRepos _listRepos;
  final AddRepo _addRepo;
  final RemoveRepo _removeRepo;

  RepoCubit({
    required ListRepos listRepos,
    required AddRepo addRepo,
    required RemoveRepo removeRepo,
  })  : _listRepos = listRepos,
        _addRepo = addRepo,
        _removeRepo = removeRepo,
        super(RepoState(repos: Result.initial()));

  Future<void> init() async {
    try {
      safeEmit(state.copyWith(repos: const Result.loading()));
      final repos = await _listRepos();
      safeEmit(state.copyWith(repos: Result.completed(repos)));
    } catch (e) {
      safeEmit(state.copyWith(repos: Result.error(e as Exception)));
    }
  }

  Future<void> addRepo({
    required String url,
  }) async {
    try {
      await _addRepo(url: url);
      // Refresh repos list after adding
      await init();
    } catch (e) {
      safeEmit(state.copyWith(repos: Result.error(e as Exception)));
    }
  }

  Future<void> removeRepo(String baseUrl) async {
    try {
      await _removeRepo(baseUrl);
      // Refresh repos list after removing
      await init();
    } catch (e) {
      safeEmit(state.copyWith(repos: Result.error(e as Exception)));
    }
  }

  void safeEmit(RepoState state) {
    if (!isClosed) emit(state);
  }
}
