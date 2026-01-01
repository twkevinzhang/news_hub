// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExtensionState {
  String? get keyword => throw _privateConstructorUsedError;
  Result<Extensions> get extensions => throw _privateConstructorUsedError;
  Map<String, Pair<InstallStatus, double>> get installingExtensions =>
      throw _privateConstructorUsedError;

  /// Create a copy of ExtensionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionStateCopyWith<ExtensionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionStateCopyWith<$Res> {
  factory $ExtensionStateCopyWith(
          ExtensionState value, $Res Function(ExtensionState) then) =
      _$ExtensionStateCopyWithImpl<$Res, ExtensionState>;
  @useResult
  $Res call(
      {String? keyword,
      Result<Extensions> extensions,
      Map<String, Pair<InstallStatus, double>> installingExtensions});

  $ResultCopyWith<Extensions, $Res> get extensions;
}

/// @nodoc
class _$ExtensionStateCopyWithImpl<$Res, $Val extends ExtensionState>
    implements $ExtensionStateCopyWith<$Res> {
  _$ExtensionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? extensions = null,
    Object? installingExtensions = null,
  }) {
    return _then(_value.copyWith(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as Result<Extensions>,
      installingExtensions: null == installingExtensions
          ? _value.installingExtensions
          : installingExtensions // ignore: cast_nullable_to_non_nullable
              as Map<String, Pair<InstallStatus, double>>,
    ) as $Val);
  }

  /// Create a copy of ExtensionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<Extensions, $Res> get extensions {
    return $ResultCopyWith<Extensions, $Res>(_value.extensions, (value) {
      return _then(_value.copyWith(extensions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtensionsStateImplCopyWith<$Res>
    implements $ExtensionStateCopyWith<$Res> {
  factory _$$ExtensionsStateImplCopyWith(_$ExtensionsStateImpl value,
          $Res Function(_$ExtensionsStateImpl) then) =
      __$$ExtensionsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? keyword,
      Result<Extensions> extensions,
      Map<String, Pair<InstallStatus, double>> installingExtensions});

  @override
  $ResultCopyWith<Extensions, $Res> get extensions;
}

/// @nodoc
class __$$ExtensionsStateImplCopyWithImpl<$Res>
    extends _$ExtensionStateCopyWithImpl<$Res, _$ExtensionsStateImpl>
    implements _$$ExtensionsStateImplCopyWith<$Res> {
  __$$ExtensionsStateImplCopyWithImpl(
      _$ExtensionsStateImpl _value, $Res Function(_$ExtensionsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? keyword = freezed,
    Object? extensions = null,
    Object? installingExtensions = null,
  }) {
    return _then(_$ExtensionsStateImpl(
      keyword: freezed == keyword
          ? _value.keyword
          : keyword // ignore: cast_nullable_to_non_nullable
              as String?,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as Result<Extensions>,
      installingExtensions: null == installingExtensions
          ? _value._installingExtensions
          : installingExtensions // ignore: cast_nullable_to_non_nullable
              as Map<String, Pair<InstallStatus, double>>,
    ));
  }
}

/// @nodoc

class _$ExtensionsStateImpl implements _ExtensionsState {
  const _$ExtensionsStateImpl(
      {required this.keyword,
      required this.extensions,
      required final Map<String, Pair<InstallStatus, double>>
          installingExtensions})
      : _installingExtensions = installingExtensions;

  @override
  final String? keyword;
  @override
  final Result<Extensions> extensions;
  final Map<String, Pair<InstallStatus, double>> _installingExtensions;
  @override
  Map<String, Pair<InstallStatus, double>> get installingExtensions {
    if (_installingExtensions is EqualUnmodifiableMapView)
      return _installingExtensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_installingExtensions);
  }

  @override
  String toString() {
    return 'ExtensionState(keyword: $keyword, extensions: $extensions, installingExtensions: $installingExtensions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionsStateImpl &&
            (identical(other.keyword, keyword) || other.keyword == keyword) &&
            (identical(other.extensions, extensions) ||
                other.extensions == extensions) &&
            const DeepCollectionEquality()
                .equals(other._installingExtensions, _installingExtensions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, keyword, extensions,
      const DeepCollectionEquality().hash(_installingExtensions));

  /// Create a copy of ExtensionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionsStateImplCopyWith<_$ExtensionsStateImpl> get copyWith =>
      __$$ExtensionsStateImplCopyWithImpl<_$ExtensionsStateImpl>(
          this, _$identity);
}

abstract class _ExtensionsState implements ExtensionState {
  const factory _ExtensionsState(
      {required final String? keyword,
      required final Result<Extensions> extensions,
      required final Map<String, Pair<InstallStatus, double>>
          installingExtensions}) = _$ExtensionsStateImpl;

  @override
  String? get keyword;
  @override
  Result<Extensions> get extensions;
  @override
  Map<String, Pair<InstallStatus, double>> get installingExtensions;

  /// Create a copy of ExtensionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionsStateImplCopyWith<_$ExtensionsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
