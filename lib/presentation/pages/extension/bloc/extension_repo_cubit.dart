import 'dart:async';
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
  StreamSubscription? _subscription;

  ExtensionRepoCubit({
    required ListExtensionRepos listExtensionRepos,
    required AddExtensionRepo addExtensionRepo,
    required RemoveExtensionRepo removeExtensionRepo,
  })  : _listExtensionRepos = listExtensionRepos,
        _addExtensionRepo = addExtensionRepo,
        _removeExtensionRepo = removeExtensionRepo,
        super(const ExtensionRepoState(repos: Result.initial()));

  void init() {
    _subscription?.cancel();
    safeEmit(state.copyWith(repos: const Result.loading()));
    _subscription = _listExtensionRepos().listen((repos) {
      safeEmit(state.copyWith(repos: Result.completed(repos)));
    }, onError: (e) {
      safeEmit(state.copyWith(repos: Result.error(e as Exception)));
    });
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Future<void> addRepo({
    required String baseUrl,
    required String displayName,
    required String website,
    required String signingKeyFingerprint,
  }) async {
    try {
      await _addExtensionRepo(
        baseUrl: baseUrl,
        displayName: displayName,
        website: website,
        signingKeyFingerprint: signingKeyFingerprint,
      );
    } catch (e) {
      // Handle error
    }
  }

  Future<void> removeRepo(String baseUrl) async {
    try {
      await _removeExtensionRepo(baseUrl);
    } catch (e) {
      // Handle error
    }
  }

  void safeEmit(ExtensionRepoState state) {
    if (!isClosed) emit(state);
  }
}
