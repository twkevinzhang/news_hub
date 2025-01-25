// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'index.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ThreadsStateCWProxy {
  ThreadsState searchConfigForm(SearchConfigForm? searchConfigForm);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadsState call({
    SearchConfigForm? searchConfigForm,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfThreadsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfThreadsState.copyWith.fieldName(...)`
class _$ThreadsStateCWProxyImpl implements _$ThreadsStateCWProxy {
  const _$ThreadsStateCWProxyImpl(this._value);

  final ThreadsState _value;

  @override
  ThreadsState searchConfigForm(SearchConfigForm? searchConfigForm) =>
      this(searchConfigForm: searchConfigForm);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ThreadsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ThreadsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ThreadsState call({
    Object? searchConfigForm = const $CopyWithPlaceholder(),
  }) {
    return ThreadsState(
      searchConfigForm: searchConfigForm == const $CopyWithPlaceholder()
          ? _value.searchConfigForm
          // ignore: cast_nullable_to_non_nullable
          : searchConfigForm as SearchConfigForm?,
    );
  }
}

extension $ThreadsStateCopyWith on ThreadsState {
  /// Returns a callable class that can be used as follows: `instanceOfThreadsState.copyWith(...)` or like so:`instanceOfThreadsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ThreadsStateCWProxy get copyWith => _$ThreadsStateCWProxyImpl(this);
}
