// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_bar_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchBarState {
  Result<List<Suggestion>> get suggestions =>
      throw _privateConstructorUsedError;
  String get keywords => throw _privateConstructorUsedError;
  String get submittedKeywords => throw _privateConstructorUsedError;

  /// Create a copy of SearchBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchBarStateCopyWith<SearchBarState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchBarStateCopyWith<$Res> {
  factory $SearchBarStateCopyWith(
          SearchBarState value, $Res Function(SearchBarState) then) =
      _$SearchBarStateCopyWithImpl<$Res, SearchBarState>;
  @useResult
  $Res call(
      {Result<List<Suggestion>> suggestions,
      String keywords,
      String submittedKeywords});

  $ResultCopyWith<List<Suggestion>, $Res> get suggestions;
}

/// @nodoc
class _$SearchBarStateCopyWithImpl<$Res, $Val extends SearchBarState>
    implements $SearchBarStateCopyWith<$Res> {
  _$SearchBarStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
    Object? keywords = null,
    Object? submittedKeywords = null,
  }) {
    return _then(_value.copyWith(
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as Result<List<Suggestion>>,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      submittedKeywords: null == submittedKeywords
          ? _value.submittedKeywords
          : submittedKeywords // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  /// Create a copy of SearchBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<Suggestion>, $Res> get suggestions {
    return $ResultCopyWith<List<Suggestion>, $Res>(_value.suggestions, (value) {
      return _then(_value.copyWith(suggestions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchBarStateImplCopyWith<$Res>
    implements $SearchBarStateCopyWith<$Res> {
  factory _$$SearchBarStateImplCopyWith(_$SearchBarStateImpl value,
          $Res Function(_$SearchBarStateImpl) then) =
      __$$SearchBarStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Result<List<Suggestion>> suggestions,
      String keywords,
      String submittedKeywords});

  @override
  $ResultCopyWith<List<Suggestion>, $Res> get suggestions;
}

/// @nodoc
class __$$SearchBarStateImplCopyWithImpl<$Res>
    extends _$SearchBarStateCopyWithImpl<$Res, _$SearchBarStateImpl>
    implements _$$SearchBarStateImplCopyWith<$Res> {
  __$$SearchBarStateImplCopyWithImpl(
      _$SearchBarStateImpl _value, $Res Function(_$SearchBarStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchBarState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
    Object? keywords = null,
    Object? submittedKeywords = null,
  }) {
    return _then(_$SearchBarStateImpl(
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as Result<List<Suggestion>>,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
      submittedKeywords: null == submittedKeywords
          ? _value.submittedKeywords
          : submittedKeywords // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchBarStateImpl implements _SearchBarState {
  const _$SearchBarStateImpl(
      {required this.suggestions,
      required this.keywords,
      required this.submittedKeywords});

  @override
  final Result<List<Suggestion>> suggestions;
  @override
  final String keywords;
  @override
  final String submittedKeywords;

  @override
  String toString() {
    return 'SearchBarState(suggestions: $suggestions, keywords: $keywords, submittedKeywords: $submittedKeywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchBarStateImpl &&
            (identical(other.suggestions, suggestions) ||
                other.suggestions == suggestions) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords) &&
            (identical(other.submittedKeywords, submittedKeywords) ||
                other.submittedKeywords == submittedKeywords));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, suggestions, keywords, submittedKeywords);

  /// Create a copy of SearchBarState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchBarStateImplCopyWith<_$SearchBarStateImpl> get copyWith =>
      __$$SearchBarStateImplCopyWithImpl<_$SearchBarStateImpl>(
          this, _$identity);
}

abstract class _SearchBarState implements SearchBarState {
  const factory _SearchBarState(
      {required final Result<List<Suggestion>> suggestions,
      required final String keywords,
      required final String submittedKeywords}) = _$SearchBarStateImpl;

  @override
  Result<List<Suggestion>> get suggestions;
  @override
  String get keywords;
  @override
  String get submittedKeywords;

  /// Create a copy of SearchBarState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchBarStateImplCopyWith<_$SearchBarStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
