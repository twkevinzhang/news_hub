import 'package:dartx/dartx.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart'
    show InsertSuggestion;
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart';
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart';
import 'package:news_hub/domain/thread/interactor/search_threads.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:news_hub/shared/models.dart';

part 'search_cubit.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    required Result<List<Suggestion>> suggestions,
    required List<Suggestion> resultFilteredSuggestions,
    required ThreadsFilter filter,
    required ThreadsFilter submittedFilter,
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
    required SearchThreads listThreadList,
  }) : _listSuggestions = listSuggestions,
       _updateSuggestionLatestUsedAt = updateSuggestionLatestUsedAt,
       _insertSuggestion = insertSuggestion,
       super(
         const SearchState(
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
      safeEmit(state.copyWith(suggestions: Result.completed(suggestions)));
      _filterSuggestions(state.filter.keywords);
    } on Exception catch (e) {
      safeEmit(state.copyWith(suggestions: Result.error(e)));
    }
  }

  void setKeywords(String keywords) {
    safeEmit(state.copyWith.filter(keywords: keywords));
    _filterSuggestions(keywords);
  }

  void _filterSuggestions(String query) {
    state.suggestions.when(
      completed: (allSuggestions) {
        if (query.isEmpty) {
          // Show recent/all suggestions if query is empty
          // Or maybe top 10 recent
          safeEmit(
            state.copyWith(
              resultFilteredSuggestions: allSuggestions.take(10).toList(),
            ),
          );
        } else {
          final filtered = allSuggestions
              .where(
                (s) => s.keywords.toLowerCase().contains(query.toLowerCase()),
              )
              .toList();
          safeEmit(state.copyWith(resultFilteredSuggestions: filtered));
        }
      },
      initial: () {},
      loading: () {},
      error: (_) {},
    );
  }

  void clearKeywords() {
    setKeywords('');
  }

  void clickSuggestion(Suggestion suggestion) {
    // Determine new keywords logic: Replace or Append?
    // Usually, clicking a suggestion replaces the query.
    setKeywords(suggestion.keywords);
    _updateSuggestionLatestUsedAt.call(suggestion.id);
    // Optionally trigger search immediately or let user press search
  }

  void createSuggestion({String? keywords}) {
    final k = keywords ?? state.filter.keywords;
    if (k.isBlank) return;
    _insertSuggestion.call(keywords: k);
  }

  void reset() {
    safeEmit(state.copyWith(filter: state.submittedFilter));
    _filterSuggestions(state.submittedFilter.keywords);
  }

  void submit() {
    createSuggestion();
    safeEmit(state.copyWith(submittedFilter: state.filter));
  }
}
