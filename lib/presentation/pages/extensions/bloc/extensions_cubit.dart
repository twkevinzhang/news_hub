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
import 'package:news_hub/presentation/widgets/widgets.dart';
import 'package:news_hub/shared/models.dart';

part 'extensions_cubit.freezed.dart';

@freezed
class ExtensionsState with _$ExtensionsState {
  const factory ExtensionsState({
    required String? keyword,
    required Result<Extensions> extensions,
    required Map<String, Pair<InstallStatus, double>> installingExtensions,
  }) = _ExtensionsState;
}

@injectable
class ExtensionsCubit extends Cubit<ExtensionsState> {
  final ListExtensions _listExtensions;
  final InstallExtension _installExtension;
  final UninstallExtension _uninstallExtension;
  final ExtensionRepoApiService _extensionRepoApiService;
  final Map<String, StreamSubscription>
      _installingStream; // pkgName -> StreamSubscription
  final SearchController searchController;

  ExtensionsCubit({
    required ListExtensions listExtensions,
    required InstallExtension installExtension,
    required UninstallExtension uninstallExtension,
    required ExtensionRepoApiService extensionRepoApiService,
  })  : _listExtensions = listExtensions,
        _installExtension = installExtension,
        _uninstallExtension = uninstallExtension,
        _extensionRepoApiService = extensionRepoApiService,
        _installingStream = {},
        searchController = SearchController(),
        super(ExtensionsState(
          keyword: null,
          extensions: Result.initial(),
          installingExtensions: {},
        ));

  void init() {
    loadExtensions();
  }

  @override
  Future<void> close() {
    for (var element in _installingStream.values) {
      element.cancel();
    }
    return super.close();
  }

  Future<void> loadExtensions() async {
    emit(state.copyWith(extensions: Result.loading()));
    final result = await _listExtensions.asFuture(state.keyword);
    emit(state.copyWith(extensions: Result.completed(result)));
  }

  void closeView(String? selectedText) {
    searchController.closeView(selectedText);
  }

  void changeKeywords(String keyword) {
    emit(state.copyWith(keyword: keyword));
  }

  Future<void> updateExtension(Extension extension) async {
    final zipUrl = await _extensionRepoApiService.zipUrl(extension);
    await _uninstallExtension.call(extension);
    final sub =
        _installExtension.downloadAndInstall(zipUrl, extension).listen((pair) {
      final newInstallingExtensions = state.installingExtensions
        ..addAll({extension.pkgName: pair});
      emit(state.copyWith(installingExtensions: newInstallingExtensions));
    }, onError: (error) {
      print(error);
    });
    _installingStream[extension.pkgName] = sub;
  }

  Future<void> installExtension(Extension extension) async {
    final zipUrl = await _extensionRepoApiService.zipUrl(extension);
    final sub =
        _installExtension.downloadAndInstall(zipUrl, extension).listen((pair) {
      final newInstallingExtensions = state.installingExtensions
        ..addAll({extension.pkgName: pair});
      emit(state.copyWith(installingExtensions: newInstallingExtensions));
    }, onError: (error) {
      print(error);
    });
    _installingStream[extension.pkgName] = sub;
  }
}
