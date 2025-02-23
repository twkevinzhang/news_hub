import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/suggestion/interactor/insert_suggestion.dart';
import 'package:news_hub/domain/suggestion/interactor/list_suggestions.dart';
import 'package:news_hub/domain/suggestion/interactor/update_suggestion_latest_used_at.dart';
import 'package:news_hub/shared/models.dart';

part 'search_bar_cubit.freezed.dart';

@freezed
abstract class SearchBarState with _$SearchBarState {
  const factory SearchBarState({
    required Result<List<Suggestion>> suggestions,
    required String keywords,
    required String submittedKeywords,
  }) = _SearchBarState;
}

@injectable
class SearchBarCubit extends Cubit<SearchBarState> {
  final ListSuggestions _listSuggestions;
  final UpdateSuggestionLatestUsedAt _updateSuggestionLatestUsedAt;
  final InsertSuggestion _insertSuggestion;
  final TextEditingController textEditingController;
  SearchBarCubit({
    required ListSuggestions listSuggestions,
    required UpdateSuggestionLatestUsedAt updateSuggestionLatestUsedAt,
    required InsertSuggestion insertSuggestion,
  })  : _listSuggestions = listSuggestions,
        _updateSuggestionLatestUsedAt = updateSuggestionLatestUsedAt,
        _insertSuggestion = insertSuggestion,
        textEditingController = TextEditingController(),
        super(SearchBarState(
          suggestions: Result.initial(),
          keywords: '',
          submittedKeywords: '',
        )) {
    textEditingController.addListener(_setKeywords);
  }

  @override
  Future<void> close() {
    reset();
    textEditingController.removeListener(_setKeywords);
    textEditingController.dispose();
    return super.close();
  }

  Future<void> init({
    String? initialKeywords,
  }) async {
    emit(state.copyWith(
      suggestions: Result.loading(),
    ));
    try {
      final suggestions = await _listSuggestions.call();
      emit(state.copyWith(
        suggestions: Result.completed(suggestions),
      ));
    } on Exception catch (e) {
      emit(state.copyWith(
        suggestions: Result.error(e),
      ));
    }

    if (initialKeywords != null) {
      emit(state.copyWith(
        keywords: initialKeywords ?? '',
        submittedKeywords: initialKeywords ?? '',
      ));
    }
  }

  void clickSuggestion({required Suggestion suggestion}) {
    var newKeywords = '';
    if (state.keywords.isNotBlank) {
      newKeywords = '${state.keywords} ${suggestion.keywords}';
    } else {
      newKeywords = suggestion.keywords;
    }
    textEditingController.text = newKeywords;
    _updateSuggestionLatestUsedAt.call(suggestion.id);
  }

  void createSuggestion({String? keywords}) {
    if (keywords == null) return;
    _insertSuggestion.call(keywords: keywords);
  }

  void clear() {
    textEditingController.clear();
    emit(state.copyWith(
      keywords: '',
    ));
  }

  void _setKeywords() {
    emit(state.copyWith(
      keywords: textEditingController.text,
    ));
  }

  void reset() {
    textEditingController.text = state.submittedKeywords;
  }
}
