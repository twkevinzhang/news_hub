import 'package:cached_query/cached_query.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart' show InsertSuggestion;
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart';
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart';
import 'package:news_hub/domain/thread/interactor/get_thread_list.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'search_cubit.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required Result<List<Suggestion>> suggestions,
    required ThreadsFilter filter,
    required ThreadsFilter submittedFilter,
    required ThreadsSorting sorting,
  }) = _SearchState;
}

@injectable
class SearchCubit extends Cubit<SearchState> {
  final ListSuggestions _listSuggestions;
  final UpdateSuggestionLatestUsedAt _updateSuggestionLatestUsedAt;
  final InsertSuggestion _insertSuggestion;

  SearchCubit({
    required ListSuggestions listSuggestions,
    required UpdateSuggestionLatestUsedAt updateSuggestionLatestUsedAt,
    required InsertSuggestion insertSuggestion,
    required GetThreadList listThreadList,
  })  : _listSuggestions = listSuggestions,
        _updateSuggestionLatestUsedAt = updateSuggestionLatestUsedAt,
        _insertSuggestion = insertSuggestion,
        super(SearchState(
          suggestions: Result.initial(),
          filter: ThreadsFilter(
            boardsSorting: {},
            keywords: '',
          ),
          submittedFilter: ThreadsFilter(
            boardsSorting: {},
            keywords: '',
          ),
          sorting: ThreadsSorting(
            boardsOrder: [],
          ),
        ));

  void init() async {
    safeEmit(state.copyWith(
      suggestions: Result.loading(),
    ));
    try {
      final suggestions = await _listSuggestions.call();
      safeEmit(state.copyWith(
        suggestions: Result.completed(suggestions),
      ));
    } on Exception catch (e) {
      safeEmit(state.copyWith(
        suggestions: Result.error(e),
      ));
    }
  }

  void setBoardsSorting(Map<String, String> boardsSorting) {
    safeEmit(state.copyWith.filter(boardsSorting: boardsSorting));
  }

  void setKeywords(String keywords) {
    keywords = keywords.trim();
    safeEmit(state.copyWith.filter(keywords: keywords));
  }

  void clearKeywords() {
    setKeywords('');
  }

  void clickSuggestion(Suggestion suggestion) {
    var newKeywords = '';
    if (state.filter.keywords.isNotBlank) {
      newKeywords = '${state.filter.keywords} ${suggestion.keywords}';
    } else {
      newKeywords = suggestion.keywords;
    }
    setKeywords(newKeywords);
    _updateSuggestionLatestUsedAt.call(suggestion.id);
  }

  void createSuggestion({String? keywords}) {
    if (keywords == null) return;
    _insertSuggestion.call(keywords: keywords);
  }

  void reset() {
    safeEmit(state.copyWith(filter: state.submittedFilter));
  }

  void submit() {
    safeEmit(state.copyWith(submittedFilter: state.filter));
  }
}
