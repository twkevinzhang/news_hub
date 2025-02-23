import 'dart:async';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/get_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/get_remote_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/valid_extension_repo_url.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/exceptions.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'add_extension_repo_cubit.freezed.dart';

@freezed
class AddExtensionRepoState with _$AddExtensionRepoState {
  const factory AddExtensionRepoState({
    String? indexUrl,
    required Result<ExtensionRepo> remoteRepo,
    required Result<void> addResult,
  }) = _AddExtensionRepoState;
}

@injectable
class AddExtensionRepoCubit extends Cubit<AddExtensionRepoState> {
  final GetExtensionRepo _getExtensionRepo;
  final GetRemoteExtensionRepo _getRemoteExtensionRepo;
  final ValidExtensionRepoUrl _validExtensionRepoUrl;
  final CreateExtensionRepo _createExtensionRepo;
  final TextEditingController textEditingController;
  final FocusNode focusNode;

  AddExtensionRepoCubit({
    required ValidExtensionRepoUrl validExtensionRepoUrl,
    required GetExtensionRepo getExtensionRepo,
    required GetRemoteExtensionRepo getRemoteExtensionRepo,
    required CreateExtensionRepo createExtensionRepo,
  })  : _getExtensionRepo = getExtensionRepo,
        _getRemoteExtensionRepo = getRemoteExtensionRepo,
        _createExtensionRepo = createExtensionRepo,
        _validExtensionRepoUrl = validExtensionRepoUrl,
        textEditingController = TextEditingController(),
        focusNode = FocusNode(),
        super(AddExtensionRepoState(
          indexUrl: null,
          remoteRepo: Result.initial(),
          addResult: Result.initial(),
        ));

  void init() {
  }

  Future<void> fetchExtensionRepo() async {
    final indexUrl = state.indexUrl;
    if (indexUrl == null) {
      return _errorState(Exception('Index URL is required'));
    }

    safeEmit(state.copyWith(
      remoteRepo: Result.loading(),
    ));

    final String baseUrl;
    try {
      baseUrl = await _validExtensionRepoUrl.call(indexUrl);
    } on Exception catch (e) {
      return _errorState(e);
    }
    var repoExists = false;
    try {
      final localRepo = await _getExtensionRepo.call(baseUrl);
      repoExists = true;
    } on NotFoundException catch (e) {
      // pass
    } on Exception catch (e) {
      return _errorState(Exception('Failed to fetch local repo'));
    }
    if (repoExists) {
      return _errorState(Exception('Repo already exists'));
    } else {
      try {
        final remoteRepo = await _getRemoteExtensionRepo.call(baseUrl);
        safeEmit(state.copyWith(
          remoteRepo: Result.completed(remoteRepo),
        ));
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          return _errorState(Exception('Remote repo not found'));
        } else {
          rethrow;
        }
      } on Exception catch (e) {
        return _errorState(e);
      }
    }
  }

  Future<void> addExtensionRepo() async {
    safeEmit(state.copyWith(
      addResult: Result.loading(),
    ));
    try {
      final baseUrl = await _validExtensionRepoUrl.call(state.indexUrl!);
      await _createExtensionRepo.call(baseUrl);
      safeEmit(state.copyWith(
        addResult: Result.completed(null),
      ));
      return;
    } on Exception catch (e) {
      return _errorState(e);
    }
  }

  void _errorState(Exception e) {
    safeEmit(state.copyWith(
      remoteRepo: Result.error(e),
    ));
  }

  void clearForm() {
    onChanged(null);
    textEditingController.clear();
  }

  void onChanged(String? value) {
    safeEmit(state.copyWith(
      indexUrl: value,
      remoteRepo: Result.initial(),
      addResult: Result.initial(),
    ));
  }

  void onTapOutside(PointerDownEvent event) {
    focusNode.unfocus();
  }
}
