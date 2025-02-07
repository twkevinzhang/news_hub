// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$SearchConfigFormCWProxy {
  SearchConfigForm enabledExtensionPkgNames(
      Set<String> enabledExtensionPkgNames);

  SearchConfigForm enabledBoardIds(Set<String> enabledBoardIds);

  SearchConfigForm boardsOrder(List<String> boardsOrder);

  SearchConfigForm threadsSorting(Map<String, String> threadsSorting);

  SearchConfigForm keywords(String? keywords);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchConfigForm(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchConfigForm(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchConfigForm call({
    Set<String> enabledExtensionPkgNames,
    Set<String> enabledBoardIds,
    List<String> boardsOrder,
    Map<String, String> threadsSorting,
    String? keywords,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchConfigForm.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchConfigForm.copyWith.fieldName(...)`
class _$SearchConfigFormCWProxyImpl implements _$SearchConfigFormCWProxy {
  const _$SearchConfigFormCWProxyImpl(this._value);

  final SearchConfigForm _value;

  @override
  SearchConfigForm enabledExtensionPkgNames(
          Set<String> enabledExtensionPkgNames) =>
      this(enabledExtensionPkgNames: enabledExtensionPkgNames);

  @override
  SearchConfigForm enabledBoardIds(Set<String> enabledBoardIds) =>
      this(enabledBoardIds: enabledBoardIds);

  @override
  SearchConfigForm boardsOrder(List<String> boardsOrder) =>
      this(boardsOrder: boardsOrder);

  @override
  SearchConfigForm threadsSorting(Map<String, String> threadsSorting) =>
      this(threadsSorting: threadsSorting);

  @override
  SearchConfigForm keywords(String? keywords) => this(keywords: keywords);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchConfigForm(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchConfigForm(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchConfigForm call({
    Object? enabledExtensionPkgNames = const $CopyWithPlaceholder(),
    Object? enabledBoardIds = const $CopyWithPlaceholder(),
    Object? boardsOrder = const $CopyWithPlaceholder(),
    Object? threadsSorting = const $CopyWithPlaceholder(),
    Object? keywords = const $CopyWithPlaceholder(),
  }) {
    return SearchConfigForm(
      enabledExtensionPkgNames:
          enabledExtensionPkgNames == const $CopyWithPlaceholder()
              ? _value.enabledExtensionPkgNames
              // ignore: cast_nullable_to_non_nullable
              : enabledExtensionPkgNames as Set<String>,
      enabledBoardIds: enabledBoardIds == const $CopyWithPlaceholder()
          ? _value.enabledBoardIds
          // ignore: cast_nullable_to_non_nullable
          : enabledBoardIds as Set<String>,
      boardsOrder: boardsOrder == const $CopyWithPlaceholder()
          ? _value.boardsOrder
          // ignore: cast_nullable_to_non_nullable
          : boardsOrder as List<String>,
      threadsSorting: threadsSorting == const $CopyWithPlaceholder()
          ? _value.threadsSorting
          // ignore: cast_nullable_to_non_nullable
          : threadsSorting as Map<String, String>,
      keywords: keywords == const $CopyWithPlaceholder()
          ? _value.keywords
          // ignore: cast_nullable_to_non_nullable
          : keywords as String?,
    );
  }
}

extension $SearchConfigFormCopyWith on SearchConfigForm {
  /// Returns a callable class that can be used as follows: `instanceOfSearchConfigForm.copyWith(...)` or like so:`instanceOfSearchConfigForm.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchConfigFormCWProxy get copyWith => _$SearchConfigFormCWProxyImpl(this);
}

abstract class _$SearchStateCWProxy {
  SearchState currentStep(int currentStep);

  SearchState allSearchConfigs(List<SearchConfig> allSearchConfigs);

  SearchState allExtensions(List<Extension> allExtensions);

  SearchState searchConfig(SearchConfigForm searchConfig);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchState call({
    int currentStep,
    List<SearchConfig> allSearchConfigs,
    List<Extension> allExtensions,
    SearchConfigForm searchConfig,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfSearchState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfSearchState.copyWith.fieldName(...)`
class _$SearchStateCWProxyImpl implements _$SearchStateCWProxy {
  const _$SearchStateCWProxyImpl(this._value);

  final SearchState _value;

  @override
  SearchState currentStep(int currentStep) => this(currentStep: currentStep);

  @override
  SearchState allSearchConfigs(List<SearchConfig> allSearchConfigs) =>
      this(allSearchConfigs: allSearchConfigs);

  @override
  SearchState allExtensions(List<Extension> allExtensions) =>
      this(allExtensions: allExtensions);

  @override
  SearchState searchConfig(SearchConfigForm searchConfig) =>
      this(searchConfig: searchConfig);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `SearchState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// SearchState(...).copyWith(id: 12, name: "My name")
  /// ````
  SearchState call({
    Object? currentStep = const $CopyWithPlaceholder(),
    Object? allSearchConfigs = const $CopyWithPlaceholder(),
    Object? allExtensions = const $CopyWithPlaceholder(),
    Object? searchConfig = const $CopyWithPlaceholder(),
  }) {
    return SearchState(
      currentStep: currentStep == const $CopyWithPlaceholder()
          ? _value.currentStep
          // ignore: cast_nullable_to_non_nullable
          : currentStep as int,
      allSearchConfigs: allSearchConfigs == const $CopyWithPlaceholder()
          ? _value.allSearchConfigs
          // ignore: cast_nullable_to_non_nullable
          : allSearchConfigs as List<SearchConfig>,
      allExtensions: allExtensions == const $CopyWithPlaceholder()
          ? _value.allExtensions
          // ignore: cast_nullable_to_non_nullable
          : allExtensions as List<Extension>,
      searchConfig: searchConfig == const $CopyWithPlaceholder()
          ? _value.searchConfig
          // ignore: cast_nullable_to_non_nullable
          : searchConfig as SearchConfigForm,
    );
  }
}

extension $SearchStateCopyWith on SearchState {
  /// Returns a callable class that can be used as follows: `instanceOfSearchState.copyWith(...)` or like so:`instanceOfSearchState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$SearchStateCWProxy get copyWith => _$SearchStateCWProxyImpl(this);
}
