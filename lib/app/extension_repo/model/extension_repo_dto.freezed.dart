// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_repo_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExtensionRepoResDto _$ExtensionRepoResDtoFromJson(Map<String, dynamic> json) {
  return _ExtensionRepoResDto.fromJson(json);
}

/// @nodoc
mixin _$ExtensionRepoResDto {
  ExtensionRepoDto get meta => throw _privateConstructorUsedError;

  /// Serializes this ExtensionRepoResDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionRepoResDtoCopyWith<ExtensionRepoResDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionRepoResDtoCopyWith<$Res> {
  factory $ExtensionRepoResDtoCopyWith(
          ExtensionRepoResDto value, $Res Function(ExtensionRepoResDto) then) =
      _$ExtensionRepoResDtoCopyWithImpl<$Res, ExtensionRepoResDto>;
  @useResult
  $Res call({ExtensionRepoDto meta});
}

/// @nodoc
class _$ExtensionRepoResDtoCopyWithImpl<$Res, $Val extends ExtensionRepoResDto>
    implements $ExtensionRepoResDtoCopyWith<$Res> {
  _$ExtensionRepoResDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ExtensionRepoDto,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtensionRepoResDtoImplCopyWith<$Res>
    implements $ExtensionRepoResDtoCopyWith<$Res> {
  factory _$$ExtensionRepoResDtoImplCopyWith(_$ExtensionRepoResDtoImpl value,
          $Res Function(_$ExtensionRepoResDtoImpl) then) =
      __$$ExtensionRepoResDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExtensionRepoDto meta});
}

/// @nodoc
class __$$ExtensionRepoResDtoImplCopyWithImpl<$Res>
    extends _$ExtensionRepoResDtoCopyWithImpl<$Res, _$ExtensionRepoResDtoImpl>
    implements _$$ExtensionRepoResDtoImplCopyWith<$Res> {
  __$$ExtensionRepoResDtoImplCopyWithImpl(_$ExtensionRepoResDtoImpl _value,
      $Res Function(_$ExtensionRepoResDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
  }) {
    return _then(_$ExtensionRepoResDtoImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ExtensionRepoDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionRepoResDtoImpl
    with DiagnosticableTreeMixin
    implements _ExtensionRepoResDto {
  const _$ExtensionRepoResDtoImpl({required this.meta});

  factory _$ExtensionRepoResDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionRepoResDtoImplFromJson(json);

  @override
  final ExtensionRepoDto meta;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExtensionRepoResDto(meta: $meta)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExtensionRepoResDto'))
      ..add(DiagnosticsProperty('meta', meta));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionRepoResDtoImpl &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta);

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionRepoResDtoImplCopyWith<_$ExtensionRepoResDtoImpl> get copyWith =>
      __$$ExtensionRepoResDtoImplCopyWithImpl<_$ExtensionRepoResDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionRepoResDtoImplToJson(
      this,
    );
  }
}

abstract class _ExtensionRepoResDto implements ExtensionRepoResDto {
  const factory _ExtensionRepoResDto({required final ExtensionRepoDto meta}) =
      _$ExtensionRepoResDtoImpl;

  factory _ExtensionRepoResDto.fromJson(Map<String, dynamic> json) =
      _$ExtensionRepoResDtoImpl.fromJson;

  @override
  ExtensionRepoDto get meta;

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionRepoResDtoImplCopyWith<_$ExtensionRepoResDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
