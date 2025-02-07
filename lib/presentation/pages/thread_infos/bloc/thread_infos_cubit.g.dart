// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_infos_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThreadInfosStateCWProxy {
  ThreadInfosState searchConfigForm(SearchConfigForm? searchConfigForm);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadInfosState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadInfosState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadInfosState call({
    SearchConfigForm? searchConfigForm,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThreadInfosState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThreadInfosState.copyWith.fieldName(...)`
class _$ThreadInfosStateCWProxyImpl implements _$ThreadInfosStateCWProxy {
  const _$ThreadInfosStateCWProxyImpl(this._value);

  final ThreadInfosState _value;

  @override
  ThreadInfosState searchConfigForm(SearchConfigForm? searchConfigForm) =>
      this(searchConfigForm: searchConfigForm);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadInfosState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadInfosState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadInfosState call({
    Object? searchConfigForm = const $CopyWithPlaceholder(),
  }) {
    return ThreadInfosState(
      searchConfigForm: searchConfigForm == const $CopyWithPlaceholder()
          ? _value.searchConfigForm
          // ignore: cast_nullable_to_non_nullable
          : searchConfigForm as SearchConfigForm?,
    );
  }
}

extension $ThreadInfosStateCopyWith on ThreadInfosState {
  /// Returns a callable class that can be used as follows: `instanceOfThreadInfosState.copyWith(...)` or like so:`instanceOfThreadInfosState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThreadInfosStateCWProxy get copyWith => _$ThreadInfosStateCWProxyImpl(this);
}
