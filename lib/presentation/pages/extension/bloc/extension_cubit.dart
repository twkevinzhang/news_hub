import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/extension/interactor/install_extension.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/shared/shared.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'extension_cubit.freezed.dart';

@freezed
class ExtensionState with _$ExtensionState {
  const factory ExtensionState({
    required String? keyword,
    required Result<Extensions> extensions,
    required Map<String, Pair<InstallStatus, double>> installingExtensions,
  }) = _ExtensionsState;
}

@injectable
class ExtensionCubit extends Cubit<ExtensionState> {
  final ListExtensions _listExtensions;
  final InstallExtension _installExtension;
  final UninstallExtension _uninstallExtension;
  final ExtensionRepoApiService _extensionRepoApiService;
  final Map<String, StreamSubscription> _installingStream; // pkgName -> StreamSubscription

  ExtensionCubit({
    required ListExtensions listExtensions,
    required InstallExtension installExtension,
    required UninstallExtension uninstallExtension,
    required ExtensionRepoApiService extensionRepoApiService,
  })  : _listExtensions = listExtensions,
        _installExtension = installExtension,
        _uninstallExtension = uninstallExtension,
        _extensionRepoApiService = extensionRepoApiService,
        _installingStream = {},
        super(ExtensionState(
          keyword: null,
          extensions: Result.initial(),
          installingExtensions: {},
        ));

  void init() {
    loadExtensions();
  }

  bool isInstalling(Extension extension) {
    return state.installingExtensions.containsKey(extension.pkgName);
  }

  @override
  Future<void> close() {
    for (var element in _installingStream.values) {
      element.cancel();
    }
    return super.close();
  }

  Future<void> loadExtensions() async {
    try {
      final result = await _listExtensions.asFuture(state.keyword);
      safeEmit(state.copyWith(extensions: Result.completed(result)));
    } on Exception catch (e) {
      safeEmit(state.copyWith(extensions: Result.error(e)));
    }
  }

  Future<void> updateExtension(Extension extension) async {
    final zipUrl = await _extensionRepoApiService.zipUrl(extension);
    await _uninstallExtension.call(extension);
    final sub = _installExtension.downloadAndInstall(zipUrl, extension).listen((pair) {
      final newInstallingExtensions = state.installingExtensions..addAll({extension.pkgName: pair});
      safeEmit(state.copyWith(installingExtensions: newInstallingExtensions));
    }, onError: (error) {
      debugPrint(error);
    });
    _installingStream[extension.pkgName] = sub;
  }

  Future<void> installExtension(Extension extension) async {
    final zipUrl = await _extensionRepoApiService.zipUrl(extension);
    final sub = _installExtension.downloadAndInstall(zipUrl, extension).listen((pair) {
      final newInstallingExtensions = state.installingExtensions..addAll({extension.pkgName: pair});
      safeEmit(state.copyWith(installingExtensions: newInstallingExtensions));
    }, onError: (error) {
      debugPrint(error);
    });
    _installingStream[extension.pkgName] = sub;
  }
}
