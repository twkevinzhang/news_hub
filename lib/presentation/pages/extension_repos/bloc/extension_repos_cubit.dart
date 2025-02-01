import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/list_extension_repos.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/presentation/widgets/index.dart';

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
  final CreateExtensionRepo _createExtensionRepo;
  final ListExtensionRepo _listExtensionRepo;
  StreamSubscription? _subListExtensionRepos;

  ExtensionReposCubit({
    required CreateExtensionRepo createExtensionRepo,
    required ListExtensionRepo listExtensionRepo,
  })  : _listExtensionRepo = listExtensionRepo,
        _createExtensionRepo = createExtensionRepo,
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

  Future<void> addExtensionRepos(String indexUrl) async {
    await _createExtensionRepo.call(indexUrl);
  }
}