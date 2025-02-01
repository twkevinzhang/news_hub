import 'dart:async';

import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/extension_repo/interactor/create_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/get_extension_repo.dart';
import 'package:news_hub/domain/extension_repo/interactor/get_remote_extension_repo.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/presentation/widgets/index.dart';
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

@lazySingleton
class AddExtensionRepoCubit extends Cubit<AddExtensionRepoState> {
  final GetExtensionRepo _getExtensionRepo;
  final GetRemoteExtensionRepo _getRemoteExtensionRepo;
  final CreateExtensionRepo _createExtensionRepo;
  final TextEditingController _textFieldController;
  final FocusNode _focusNode;
  get textFieldController => _textFieldController;
  get focusNode => _focusNode;

  AddExtensionRepoCubit({
    required GetExtensionRepo getExtensionRepo,
    required GetRemoteExtensionRepo getRemoteExtensionRepo,
    required CreateExtensionRepo createExtensionRepo,
  })  : _getExtensionRepo = getExtensionRepo,
        _getRemoteExtensionRepo = getRemoteExtensionRepo,
        _createExtensionRepo = createExtensionRepo,
        _textFieldController = TextEditingController(),
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
      emit(state.copyWith(
        remoteRepo: StateError(message: 'Index URL is required'),
      ));
      return;
    }

    emit(state.copyWith(
      remoteRepo: StateLoading(),
    ));

    var repoExists = false;
    try {
      final localRepo = await _getExtensionRepo.call(indexUrl);
      repoExists = true;
    } on NotFoundException catch (e) {
      // pass
    } catch (e) {
      emit(state.copyWith(
        remoteRepo: StateError(message: 'Failed to check local repo'),
      ));
      return;
    }
    if (repoExists) {
      emit(state.copyWith(
        remoteRepo: StateError(message: 'Repo already exists'),
      ));
    } else {
      try {
        final remoteRepo = await _getRemoteExtensionRepo.call(indexUrl);
        emit(state.copyWith(
          remoteRepo: StateCompleted(data: remoteRepo),
        ));
      } catch (e) {
        emit(state.copyWith(
          remoteRepo: StateError(message: 'Failed to fetch repo'),
        ));
      }
    }
  }

  Future<void> addExtensionRepo() async {
    emit(state.copyWith(
      addResult: StateLoading(),
    ));
    try {
      await _createExtensionRepo.call(state.form.indexUrl!);
      emit(state.copyWith(
        addResult: StateCompleted(data: null),
      ));
    } catch (e) {
      emit(state.copyWith(
        addResult: StateError(message: 'Failed to add repo'),
      ));
    }
  }

  void clearForm() {
    emit(state.copyWith(
      form: AddExtensionRepoForm(
        indexUrl: null,
      ),
      remoteRepo: StateInitial(),
      addResult: StateInitial(),
    ));
    textFieldController.clear();
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
