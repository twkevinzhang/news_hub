import 'dart:async';

import 'package:dartx/dartx.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/extension/interactor/install_extension.dart';
import 'package:news_hub/domain/extension_repo/extension_repo.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/presentation/widgets/widgets.dart';

part 'extensions_cubit.g.dart';

@immutable
@CopyWith()
class ExtensionsState extends Equatable {
  final String? keyword;
  final StateStatus<Extensions> extensions;
  final Map<String, Pair<InstallStatus, double>> installingExtensions;

  const ExtensionsState({
    required this.keyword,
    required this.extensions,
    required this.installingExtensions,
  });

  @override
  List<Object?> get props => [extensions, keyword, installingExtensions];
}

@injectable
class ExtensionsCubit extends Cubit<ExtensionsState> {
  final ListExtensions _listExtensions;
  final InstallExtension _installExtension;
  final UninstallExtension _uninstallExtension;
  final ExtensionRepoApiService _extensionRepoApiService;
  final SearchController _searchController;
  get searchController => _searchController;
  StreamSubscription? _subListExtensions;
  final List<StreamSubscription> _subInstallExtensions;

  ExtensionsCubit({
    required ListExtensions listExtensions,
    required InstallExtension installExtension,
    required UninstallExtension uninstallExtension,
    required ExtensionRepoApiService extensionRepoApiService,
  })  : _listExtensions = listExtensions,
        _installExtension = installExtension,
        _uninstallExtension = uninstallExtension,
        _extensionRepoApiService = extensionRepoApiService,
        _subInstallExtensions = [],
        _searchController = SearchController(),
        super(ExtensionsState(
          keyword: null,
          extensions: StateInitial(),
          installingExtensions: {},
      ));

  @override
  Future<void> close() async {
    await _subListExtensions?.cancel();
    for (final sub in _subInstallExtensions) {
      await sub.cancel();
    }
    return super.close();
  }

  Future<void> loadExtensions() async {
    await _subListExtensions?.cancel();
    _subListExtensions =
        _listExtensions.asStream(state.keyword).listen((result) {
      emit(state.copyWith(extensions: StateCompleted(data: result)));
    }, onError: (error) {
      emit(state.copyWith(extensions: StateError(message: error.toString())));
      print(error);
    });
  }

  void changeKeywords(String keyword) {
    emit(state.copyWith(keyword: keyword));
  }

  Future<void> updateExtension(Extension extension) async {
    final zipUrl = await _extensionRepoApiService.zipUrl(extension);
    await _uninstallExtension.call(extension);
    _subInstallExtensions.add(_installExtension
        .downloadAndInstall(zipUrl, extension)
        .listen((pair) {
      emit(state.copyWith(installingExtensions: {
        ...state.installingExtensions,
        extension.pkgName: pair,
      }));
    }, onError: (error) {
      print(error);
    }));
  }

  Future<void> installExtension(Extension extension) async {
    final zipUrl = await _extensionRepoApiService.zipUrl(extension);
    _subInstallExtensions.add(_installExtension
        .downloadAndInstall(zipUrl, extension)
        .listen((pair) {
      emit(state.copyWith(installingExtensions: {
        ...state.installingExtensions,
        extension.pkgName: pair,
      }));
    }, onError: (error) {
      print(error);
    }));
  }
}
