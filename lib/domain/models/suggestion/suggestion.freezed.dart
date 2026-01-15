// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'suggestion.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Suggestion {
  String get id => throw _privateConstructorUsedError;
  String get keywords => throw _privateConstructorUsedError;
  DateTime get latestUsedAt => throw _privateConstructorUsedError;

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestionCopyWith<Suggestion> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestionCopyWith<$Res> {
  factory $SuggestionCopyWith(
    Suggestion value,
    $Res Function(Suggestion) then,
  ) = _$SuggestionCopyWithImpl<$Res, Suggestion>;
  @useResult
  $Res call({String id, String keywords, DateTime latestUsedAt});
}

/// @nodoc
class _$SuggestionCopyWithImpl<$Res, $Val extends Suggestion>
    implements $SuggestionCopyWith<$Res> {
  _$SuggestionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? keywords = null,
    Object? latestUsedAt = null,
  }) {
    return _then(
      _value.copyWith(
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
            keywords: null == keywords
                ? _value.keywords
                : keywords // ignore: cast_nullable_to_non_nullable
                      as String,
            latestUsedAt: null == latestUsedAt
                ? _value.latestUsedAt
                : latestUsedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$SuggestionImplCopyWith<$Res>
    implements $SuggestionCopyWith<$Res> {
  factory _$$SuggestionImplCopyWith(
    _$SuggestionImpl value,
    $Res Function(_$SuggestionImpl) then,
  ) = __$$SuggestionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String keywords, DateTime latestUsedAt});
}

/// @nodoc
class __$$SuggestionImplCopyWithImpl<$Res>
    extends _$SuggestionCopyWithImpl<$Res, _$SuggestionImpl>
    implements _$$SuggestionImplCopyWith<$Res> {
  __$$SuggestionImplCopyWithImpl(
    _$SuggestionImpl _value,
    $Res Function(_$SuggestionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? keywords = null,
    Object? latestUsedAt = null,
  }) {
    return _then(
      _$SuggestionImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        keywords: null == keywords
            ? _value.keywords
            : keywords // ignore: cast_nullable_to_non_nullable
                  as String,
        latestUsedAt: null == latestUsedAt
            ? _value.latestUsedAt
            : latestUsedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime,
      ),
    );
  }
}

/// @nodoc

class _$SuggestionImpl implements _Suggestion {
  const _$SuggestionImpl({
    required this.id,
    required this.keywords,
    required this.latestUsedAt,
  });

  @override
  final String id;
  @override
  final String keywords;
  @override
  final DateTime latestUsedAt;

  @override
  String toString() {
    return 'Suggestion(id: $id, keywords: $keywords, latestUsedAt: $latestUsedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.latestUsedAt, latestUsedAt) ||
                other.latestUsedAt == latestUsedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, keywords, latestUsedAt);

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      __$$SuggestionImplCopyWithImpl<_$SuggestionImpl>(this, _$identity);
}

abstract class _Suggestion implements Suggestion {
  const factory _Suggestion({
    required final String id,
    required final String keywords,
    required final DateTime latestUsedAt,
  }) = _$SuggestionImpl;

  @override
  String get id;
  @override
  String get keywords;
  @override
  DateTime get latestUsedAt;

  /// Create a copy of Suggestion
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestionImplCopyWith<_$SuggestionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
