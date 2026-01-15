import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/suggestion/interactor/delete_all_suggestions.dart';
import 'package:news_hub/domain/suggestion/interactor/delete_suggestion.dart';
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart'
    show InsertSuggestion;
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart';
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart';
import 'package:news_hub/domain/thread/interactor/search_threads.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'search_form_cubit.freezed.dart';

@freezed
class SearchFormState with _$SearchFormState {
  const factory SearchFormState({
    required Result<List<Suggestion>> suggestions,
    required List<Suggestion> resultFilteredSuggestions,
    required ThreadsFilter filter,
    required ThreadsFilter submittedFilter,
  }) = _SearchFormState;
}

@injectable
class SearchFormCubit extends Cubit<SearchFormState> {
  final ListSuggestions _listSuggestions;
  final UpdateSuggestionLatestUsedAt _updateSuggestionLatestUsedAt;
  final InsertSuggestion _insertSuggestion;
  final DeleteSuggestion _deleteSuggestion;
  final DeleteAllSuggestions _deleteAllSuggestions;

  SearchFormCubit({
    required ListSuggestions listSuggestions,
    required UpdateSuggestionLatestUsedAt updateSuggestionLatestUsedAt,
    required InsertSuggestion insertSuggestion,
    required DeleteSuggestion deleteSuggestion,
    required DeleteAllSuggestions deleteAllSuggestions,
    required SearchThreads listThreadList,
  }) : _listSuggestions = listSuggestions,
       _updateSuggestionLatestUsedAt = updateSuggestionLatestUsedAt,
       _insertSuggestion = insertSuggestion,
       _deleteSuggestion = deleteSuggestion,
       _deleteAllSuggestions = deleteAllSuggestions,
       super(
         const SearchFormState(
           suggestions: Result.initial(),
           resultFilteredSuggestions: [],
           filter: ThreadsFilter(boardSorts: {}, keywords: ''),
           submittedFilter: ThreadsFilter(boardSorts: {}, keywords: ''),
         ),
       );

  void init(ThreadsFilter? initialFilter) async {
    safeEmit(
      state.copyWith(
        suggestions: const Result.loading(),
        filter: initialFilter ?? state.filter,
        submittedFilter: initialFilter ?? state.submittedFilter,
      ),
    );
    try {
      final suggestions = await _listSuggestions.call();
      safeEmit(
        state.copyWith(
          suggestions: Result.completed(suggestions.take(10).toList()),
        ),
      );
    } on Exception catch (e) {
      safeEmit(state.copyWith(suggestions: Result.error(e)));
    }
  }

  void setKeywords(String keywords) {
    safeEmit(state.copyWith.filter(keywords: keywords));
  }

  void clearKeywords() {
    setKeywords('');
  }

  void addKeywords(String keywords) {
    if (state.filter.keywords.isEmpty) {
      setKeywords(keywords);
    } else {
      setKeywords('${state.filter.keywords} $keywords');
    }
  }

  void clickSuggestion(Suggestion suggestion) {
    addKeywords(suggestion.keywords);
    _updateSuggestionLatestUsedAt.call(suggestion.id);
  }

  void createSuggestion({String? keywords}) {
    final k = keywords ?? state.filter.keywords;
    if (k.isBlank) return;
    _insertSuggestion.call(keywords: k);
  }

  void reset() {
    safeEmit(state.copyWith(filter: state.submittedFilter));
  }

  void submit() {
    createSuggestion();
    safeEmit(state.copyWith(submittedFilter: state.filter));
  }

  void removeSuggestion(String id) async {
    await _deleteSuggestion.call(id);
    _reloadSuggestions();
  }

  void clearAllSuggestions() async {
    await _deleteAllSuggestions.call();
    _reloadSuggestions();
  }

  void _reloadSuggestions() async {
    try {
      final suggestions = await _listSuggestions.call();
      safeEmit(
        state.copyWith(
          suggestions: Result.completed(suggestions.take(10).toList()),
        ),
      );
    } on Exception catch (e) {
      safeEmit(state.copyWith(suggestions: Result.error(e)));
    }
  }
}
