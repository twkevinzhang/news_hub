import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/get_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/get_remote_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/valid_extension_repo_url.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:news_hub/shared/exceptions.dart';

part 'add_extension_repo_cubit.g.dart';

@immutable
@CopyWith()
class AddExtensionRepoForm {
  final String? indexUrl;

  const AddExtensionRepoForm({required this.indexUrl});
}

@immutable
@CopyWith()
class AddExtensionRepoState extends Equatable {
  final AddExtensionRepoForm form;
  final StateStatus<ExtensionRepo> remoteRepo;
  final StateStatus<void> addResult;

  const AddExtensionRepoState({
    required this.form,
    required this.remoteRepo,
    required this.addResult,
  });

  @override
  List<Object?> get props => [form, remoteRepo, addResult];
}

@injectable
class AddExtensionRepoCubit extends Cubit<AddExtensionRepoState> {
  final GetExtensionRepo _getExtensionRepo;
  final GetRemoteExtensionRepo _getRemoteExtensionRepo;
  final ValidExtensionRepoUrl _validExtensionRepoUrl;
  final CreateExtensionRepo _createExtensionRepo;
  final TextEditingController _textEditingController;
  final FocusNode _focusNode;
  get textEditingController => _textEditingController;
  get focusNode => _focusNode;

  AddExtensionRepoCubit({
    required ValidExtensionRepoUrl validExtensionRepoUrl,
    required GetExtensionRepo getExtensionRepo,
    required GetRemoteExtensionRepo getRemoteExtensionRepo,
    required CreateExtensionRepo createExtensionRepo,
  })  : _getExtensionRepo = getExtensionRepo,
        _getRemoteExtensionRepo = getRemoteExtensionRepo,
        _createExtensionRepo = createExtensionRepo,
        _validExtensionRepoUrl = validExtensionRepoUrl,
        _textEditingController = TextEditingController(),
        _focusNode = FocusNode(),
        super(AddExtensionRepoState(
          form: AddExtensionRepoForm(
            indexUrl: null,
          ),
          remoteRepo: StateInitial(),
          addResult: StateInitial(),
        ));

  Future<void> fetchExtensionRepo() async {
    final indexUrl = state.form.indexUrl;
    if (indexUrl == null) {
      return _errorState('Index URL is required');
    }

    emit(state.copyWith(
      remoteRepo: StateLoading(),
    ));

    final String baseUrl;
    try {
      baseUrl = await _validExtensionRepoUrl.call(indexUrl);
    } catch (e) {
      return _errorState(e.toString());
    }
    var repoExists = false;
    try {
      final localRepo = await _getExtensionRepo.call(baseUrl);
      repoExists = true;
    } on NotFoundException catch (e) {
      // pass
    } catch (e) {
      return _errorState( 'Failed to check local repo');
    }
    if (repoExists) {
      return _errorState('Repo already exists');
    } else {
      try {
        final remoteRepo = await _getRemoteExtensionRepo.call(baseUrl);
        emit(state.copyWith(
          remoteRepo: StateCompleted(data: remoteRepo),
        ));
      } on DioException catch (e) {
        if (e.response?.statusCode == 404) {
          return _errorState('Repo not found');
        } else {
          rethrow;
        }
      } catch (e) {
        return _errorState(e.toString());
      }
    }
  }

  Future<void> addExtensionRepo() async {
    emit(state.copyWith(
      addResult: StateLoading(),
    ));
    try {
      final baseUrl = await _validExtensionRepoUrl.call(state.form.indexUrl!);
      await _createExtensionRepo.call(baseUrl);
      emit(state.copyWith(
        addResult: StateCompleted(data: null),
      ));
      return;
    } catch (e) {
      return _errorState(e.toString());
    }
  }

  void _errorState(String message) {
    emit(state.copyWith(
      remoteRepo: StateError(message: message),
    ));
  }

  void clearForm() {
    emit(state.copyWith(
      form: AddExtensionRepoForm(
        indexUrl: null,
      ),
      remoteRepo: StateInitial(),
      addResult: StateInitial(),
    ));
    textEditingController.clear();
  }

  void updateForm({String? indexUrl}) {
    emit(state.copyWith(
      form: AddExtensionRepoForm(
        indexUrl: indexUrl,
      ),
      remoteRepo: StateInitial(),
      addResult: StateInitial(),
    ));
  }
}
