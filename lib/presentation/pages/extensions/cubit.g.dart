// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$ExtensionsStateCWProxy {
  ExtensionsState keyword(String? keyword);

  ExtensionsState extensions(Extensions? extensions);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExtensionsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExtensionsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExtensionsState call({
    String? keyword,
    Extensions? extensions,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfExtensionsState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfExtensionsState.copyWith.fieldName(...)`
class _$ExtensionsStateCWProxyImpl implements _$ExtensionsStateCWProxy {
  const _$ExtensionsStateCWProxyImpl(this._value);

  final ExtensionsState _value;

  @override
  ExtensionsState keyword(String? keyword) => this(keyword: keyword);

  @override
  ExtensionsState extensions(Extensions? extensions) =>
      this(extensions: extensions);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `ExtensionsState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// ExtensionsState(...).copyWith(id: 12, name: "My name")
  /// ````
  ExtensionsState call({
    Object? keyword = const $CopyWithPlaceholder(),
    Object? extensions = const $CopyWithPlaceholder(),
  }) {
    return ExtensionsState(
      keyword: keyword == const $CopyWithPlaceholder()
          ? _value.keyword
          // ignore: cast_nullable_to_non_nullable
          : keyword as String?,
      extensions: extensions == const $CopyWithPlaceholder()
          ? _value.extensions
          // ignore: cast_nullable_to_non_nullable
          : extensions as Extensions?,
    );
  }
}

extension $ExtensionsStateCopyWith on ExtensionsState {
  /// Returns a callable class that can be used as follows: `instanceOfExtensionsState.copyWith(...)` or like so:`instanceOfExtensionsState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$ExtensionsStateCWProxy get copyWith => _$ExtensionsStateCWProxyImpl(this);
}
