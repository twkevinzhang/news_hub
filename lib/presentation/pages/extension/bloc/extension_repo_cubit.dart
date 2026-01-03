import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/interactor/list_extension_repos.dart';
import 'package:news_hub/domain/extension/interactor/add_extension_repo.dart';
import 'package:news_hub/domain/extension/interactor/remove_extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/models.dart';

part 'extension_repo_cubit.freezed.dart';

@freezed
class ExtensionRepoState with _$ExtensionRepoState {
  const factory ExtensionRepoState({
    required Result<List<ExtensionRepo>> repos,
  }) = _ExtensionRepoState;
}

@injectable
class ExtensionRepoCubit extends Cubit<ExtensionRepoState> {
  final ListExtensionRepos _listExtensionRepos;
  final AddExtensionRepo _addExtensionRepo;
  final RemoveExtensionRepo _removeExtensionRepo;

  ExtensionRepoCubit({
    required ListExtensionRepos listExtensionRepos,
    required AddExtensionRepo addExtensionRepo,
    required RemoveExtensionRepo removeExtensionRepo,
  })  : _listExtensionRepos = listExtensionRepos,
        _addExtensionRepo = addExtensionRepo,
        _removeExtensionRepo = removeExtensionRepo,
        super(ExtensionRepoState(repos: Result.initial()));

  Future<void> init() async {
    try {
      safeEmit(state.copyWith(repos: const Result.loading()));
      final repos = await _listExtensionRepos();
      safeEmit(state.copyWith(repos: Result.completed(repos)));
    } catch (e) {
      safeEmit(state.copyWith(repos: Result.error(e as Exception)));
    }
  }

  Future<void> addRepo({
    required String url,
  }) async {
    try {
      await _addExtensionRepo(url: url);
      // Refresh repos list after adding
      await init();
    } catch (e) {
      safeEmit(state.copyWith(repos: Result.error(e as Exception)));
    }
  }

  Future<void> removeRepo(String baseUrl) async {
    try {
      await _removeExtensionRepo(baseUrl);
      // Refresh repos list after removing
      await init();
    } catch (e) {
      safeEmit(state.copyWith(repos: Result.error(e as Exception)));
    }
  }

  void safeEmit(ExtensionRepoState state) {
    if (!isClosed) emit(state);
  }
}
