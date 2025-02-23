import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/bookmark/interactor/list_bookmarks.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';

part 'search_cubit.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required ThreadsFilter filter,
    required ThreadsFilter submittedFilter,
  }) = _SearchState;
}

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit({
    required ListBookmarks listBookmarks,
    required ListInstalledExtensions listExtensions,
  }) : super(SearchState(
          filter: ThreadsFilter(
            boardsSorting: {},
            keywords: null,
          ),
          submittedFilter: ThreadsFilter(
            boardsSorting: {},
            keywords: null,
          ),
        ));

  void init() {
    emit(state.copyWith(
      filter: ThreadsFilter(
        boardsSorting: {},
        keywords: null,
      ),
      submittedFilter: ThreadsFilter(
        boardsSorting: {},
        keywords: null,
      ),
    ));
  }

  void setBoardsSorting(Map<String, String> boardsSorting) {
    emit(state.copyWith(
      filter: state.filter.copyWith(boardsSorting: boardsSorting),
    ));
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

  void reset() {
    emit(state.copyWith(filter: state.submittedFilter));
  }

  void submit() {
    emit(state.copyWith(submittedFilter: state.filter));
  }
}
