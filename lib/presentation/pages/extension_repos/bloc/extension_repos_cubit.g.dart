// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_repos_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExtensionReposStateCWProxy {
  ExtensionReposState repos(StateStatus<List<ExtensionRepo>> repos);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExtensionReposState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExtensionReposState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExtensionReposState call({
    StateStatus<List<ExtensionRepo>> repos,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExtensionReposState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExtensionReposState.copyWith.fieldName(...)`
class _$ExtensionReposStateCWProxyImpl implements _$ExtensionReposStateCWProxy {
  const _$ExtensionReposStateCWProxyImpl(this._value);

  final ExtensionReposState _value;

  @override
  ExtensionReposState repos(StateStatus<List<ExtensionRepo>> repos) =>
      this(repos: repos);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExtensionReposState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExtensionReposState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExtensionReposState call({
    Object? repos = const $CopyWithPlaceholder(),
  }) {
    return ExtensionReposState(
      repos: repos == const $CopyWithPlaceholder()
          ? _value.repos
          // ignore: cast_nullable_to_non_nullable
          : repos as StateStatus<List<ExtensionRepo>>,
    );
  }
}

extension $ExtensionReposStateCopyWith on ExtensionReposState {
  /// Returns a callable class that can be used as follows: `instanceOfExtensionReposState.copyWith(...)` or like so:`instanceOfExtensionReposState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExtensionReposStateCWProxy get copyWith =>
      _$ExtensionReposStateCWProxyImpl(this);
}
