import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';

part 'search_cubit.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required ThreadsFilter filter,
  }) = _SearchState;
}

@injectable
class SearchCubit extends Cubit<SearchState> {
  final PageController pageController;

  SearchCubit({
    required ListBookmarks listBookmarks,
    required ListInstalledExtensions listExtensions,
  })  : pageController = PageController(),
        super(SearchState(
          filter: ThreadsFilter(
            boardsSorting: {},
            keywords: null,
          ),
        ));

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  void setKeywords(String? keywords) {
    keywords = keywords?.trim();
    if (keywords == '') {
      keywords = null;
    }
    emit(state.copyWith(
      filter: state.filter.copyWith(keywords: keywords),
    ));
  }
}
