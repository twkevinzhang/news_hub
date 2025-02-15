import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/delete_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/list_extension_repos.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:news_hub/shared/models.dart';

part 'extension_repos_cubit.freezed.dart';

@freezed
abstract class ExtensionReposState with _$ExtensionReposState {
  const factory ExtensionReposState({
    required Result<List<ExtensionRepo>> repos,
  }) = _ExtensionReposState;
}

@injectable
class ExtensionReposCubit extends Cubit<ExtensionReposState> {
  final ListExtensionRepo _listExtensionRepo;
  final DeleteExtensionRepo _deleteExtensionRepo;

  ExtensionReposCubit({
    required ListExtensionRepo listExtensionRepo,
    required DeleteExtensionRepo deleteExtensionRepo,
  })  : _listExtensionRepo = listExtensionRepo,
        _deleteExtensionRepo = deleteExtensionRepo,
        super(ExtensionReposState(repos: Result.initial()));

  void init() {
    loadExtensionRepos();
  }

  Future<void> loadExtensionRepos() async {
    final result = await _listExtensionRepo.asFuture();
    emit(state.copyWith(repos: Result.completed(result)));
  }

  Future<void> deleteExtensionRepo(String baseUrl) async {
    await _deleteExtensionRepo.call(baseUrl);
    loadExtensionRepos();
  }
}
