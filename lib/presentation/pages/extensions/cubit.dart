import 'package:auto_route/auto_route.dart';
import 'package:dartx/dartx.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:news_hub/domain/search_config/index.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';
import 'package:news_hub/locator.dart';
import 'package:news_hub/presentation/router.dart';
import 'package:news_hub/presentation/widgets/text_divider.dart';

part 'cubit.g.dart';

@immutable
@CopyWith()
class ExtensionsState extends Equatable {
  final String? keyword;
  final Extensions extensions;

  ExtensionsState({
    this.keyword,
    Extensions? extensions,
  })  : extensions = extensions ??
            Extensions(
              updates: {},
              deprecated: {},
              installed: {},
              notInstalled: {},
            );

  @override
  List<Object?> get props => [extensions, keyword];
}

@lazySingleton
class ExtensionsCubit extends Cubit<ExtensionsState> {
  final ListExtensions _listExtensions;
  final SearchController _searchController;
  get searchController => _searchController;

  ExtensionsCubit({
    required ListExtensions listExtensions,
  })  : _listExtensions = listExtensions,
        _searchController = SearchController(),
        super(ExtensionsState());

  void loadExtensions() async {
    _listExtensions.call(state.keyword).listen((result) {
      emit(state.copyWith(extensions: result));
    });
  }

  void changeKeywords(String keyword) {
    emit(state.copyWith(keyword: keyword));
  }

  void updateExtension(Extension extension) {
    // ...
  }

  void installExtension(Extension extension) {
    // ...
  }

  void validateRepoUrl(String url) {
    // ...
  }

  void createRepo(ExtensionRepo repo) {
    // ...
  }
}
