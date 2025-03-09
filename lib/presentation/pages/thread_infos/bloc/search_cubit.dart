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
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/domain/thread/interactor/list_thread_infos.dart';
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
  final ListThreadInfos _listThreadInfos;
  final PagingController<int, PostWithExtension> pagingController;

  static const _pageSize = 10;

  SearchCubit({
    required ListSuggestions listSuggestions,
    required UpdateSuggestionLatestUsedAt updateSuggestionLatestUsedAt,
    required InsertSuggestion insertSuggestion,
    required ListThreadInfos listThreadInfos,
  })  : _listSuggestions = listSuggestions,
        _updateSuggestionLatestUsedAt = updateSuggestionLatestUsedAt,
        _insertSuggestion = insertSuggestion,
        _listThreadInfos = listThreadInfos,
        pagingController = PagingController(firstPageKey: 1),
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
        )) {
    pagingController.addPageRequestListener(_loadThreadInfos);
  }

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

  void _loadThreadInfos(int pageKey) async {
    try {
      final result = await _listThreadInfos.call(
        filter: state.filter,
        sorting: state.sorting,
        pagination: Pagination(
          page: pageKey,
          pageSize: _pageSize,
        ),
      );

      final isLastPage = result.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(result);
      } else {
        pagingController.appendPage(result, pageKey + 1);
      }
    } catch (e, s) {
      debugPrint('Exception: $e');
      debugPrint('StackTrace: $s');
      pagingController.error = e;
    }
  }

  void refresh() {
    _listThreadInfos.refresh();
    pagingController.refresh();
  }

  @override
  Future<void> close() {
    pagingController.dispose();
    return super.close();
  }
}
