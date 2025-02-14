import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/delete_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/list_extension_repos.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

part 'extension_repos_cubit.g.dart';

@immutable
@CopyWith()
class ExtensionReposState extends Equatable {
  final StateStatus<List<ExtensionRepo>> repos;

  const ExtensionReposState({
    required this.repos,
  });

  @override
  List<Object?> get props => [repos];
}

@lazySingleton
class ExtensionReposCubit extends Cubit<ExtensionReposState> {
  final ListExtensionRepo _listExtensionRepo;
  final DeleteExtensionRepo _deleteExtensionRepo;
  StreamSubscription? _subListExtensionRepos;

  ExtensionReposCubit({
    required ListExtensionRepo listExtensionRepo,
    required DeleteExtensionRepo deleteExtensionRepo,
  })  : _listExtensionRepo = listExtensionRepo,
        _deleteExtensionRepo = deleteExtensionRepo,
        super(ExtensionReposState(repos: StateInitial()));

  @override
  Future<void> close() async {
    await _subListExtensionRepos?.cancel();
    return super.close();
  }

  Future<void> loadExtensionRepos() async {
    await _subListExtensionRepos?.cancel();
    _subListExtensionRepos =
        _listExtensionRepo.asStream().listen((result) {
          emit(state.copyWith(repos: StateCompleted(data: result)));
        }, onError: (error) {
          emit(state.copyWith(repos: StateError(message: error.toString())));
          print(error);
        });
  }

  Future<void> deleteExtensionRepo(String baseUrl) async {
    await _deleteExtensionRepo.call(baseUrl);
    loadExtensionRepos();
  }
}