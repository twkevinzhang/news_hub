// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SearchFormState {
  Result<List<Suggestion>> get suggestions =>
      throw _privateConstructorUsedError;
  List<Suggestion> get resultFilteredSuggestions =>
      throw _privateConstructorUsedError;
  ThreadsFilter get filter => throw _privateConstructorUsedError;
  ThreadsFilter get submittedFilter => throw _privateConstructorUsedError;

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchFormStateCopyWith<SearchFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchFormStateCopyWith<$Res> {
  factory $SearchFormStateCopyWith(
    SearchFormState value,
    $Res Function(SearchFormState) then,
  ) = _$SearchFormStateCopyWithImpl<$Res, SearchFormState>;
  @useResult
  $Res call({
    Result<List<Suggestion>> suggestions,
    List<Suggestion> resultFilteredSuggestions,
    ThreadsFilter filter,
    ThreadsFilter submittedFilter,
  });

  $ResultCopyWith<List<Suggestion>, $Res> get suggestions;
  $ThreadsFilterCopyWith<$Res> get filter;
  $ThreadsFilterCopyWith<$Res> get submittedFilter;
}

/// @nodoc
class _$SearchFormStateCopyWithImpl<$Res, $Val extends SearchFormState>
    implements $SearchFormStateCopyWith<$Res> {
  _$SearchFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
    Object? resultFilteredSuggestions = null,
    Object? filter = null,
    Object? submittedFilter = null,
  }) {
    return _then(
      _value.copyWith(
            suggestions: null == suggestions
                ? _value.suggestions
                : suggestions // ignore: cast_nullable_to_non_nullable
                      as Result<List<Suggestion>>,
            resultFilteredSuggestions: null == resultFilteredSuggestions
                ? _value.resultFilteredSuggestions
                : resultFilteredSuggestions // ignore: cast_nullable_to_non_nullable
                      as List<Suggestion>,
            filter: null == filter
                ? _value.filter
                : filter // ignore: cast_nullable_to_non_nullable
                      as ThreadsFilter,
            submittedFilter: null == submittedFilter
                ? _value.submittedFilter
                : submittedFilter // ignore: cast_nullable_to_non_nullable
                      as ThreadsFilter,
          )
          as $Val,
    );
  }

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<Suggestion>, $Res> get suggestions {
    return $ResultCopyWith<List<Suggestion>, $Res>(_value.suggestions, (value) {
      return _then(_value.copyWith(suggestions: value) as $Val);
    });
  }

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsFilterCopyWith<$Res> get filter {
    return $ThreadsFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsFilterCopyWith<$Res> get submittedFilter {
    return $ThreadsFilterCopyWith<$Res>(_value.submittedFilter, (value) {
      return _then(_value.copyWith(submittedFilter: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchFormStateImplCopyWith<$Res>
    implements $SearchFormStateCopyWith<$Res> {
  factory _$$SearchFormStateImplCopyWith(
    _$SearchFormStateImpl value,
    $Res Function(_$SearchFormStateImpl) then,
  ) = __$$SearchFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    Result<List<Suggestion>> suggestions,
    List<Suggestion> resultFilteredSuggestions,
    ThreadsFilter filter,
    ThreadsFilter submittedFilter,
  });

  @override
  $ResultCopyWith<List<Suggestion>, $Res> get suggestions;
  @override
  $ThreadsFilterCopyWith<$Res> get filter;
  @override
  $ThreadsFilterCopyWith<$Res> get submittedFilter;
}

/// @nodoc
class __$$SearchFormStateImplCopyWithImpl<$Res>
    extends _$SearchFormStateCopyWithImpl<$Res, _$SearchFormStateImpl>
    implements _$$SearchFormStateImplCopyWith<$Res> {
  __$$SearchFormStateImplCopyWithImpl(
    _$SearchFormStateImpl _value,
    $Res Function(_$SearchFormStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
    Object? resultFilteredSuggestions = null,
    Object? filter = null,
    Object? submittedFilter = null,
  }) {
    return _then(
      _$SearchFormStateImpl(
        suggestions: null == suggestions
            ? _value.suggestions
            : suggestions // ignore: cast_nullable_to_non_nullable
                  as Result<List<Suggestion>>,
        resultFilteredSuggestions: null == resultFilteredSuggestions
            ? _value._resultFilteredSuggestions
            : resultFilteredSuggestions // ignore: cast_nullable_to_non_nullable
                  as List<Suggestion>,
        filter: null == filter
            ? _value.filter
            : filter // ignore: cast_nullable_to_non_nullable
                  as ThreadsFilter,
        submittedFilter: null == submittedFilter
            ? _value.submittedFilter
            : submittedFilter // ignore: cast_nullable_to_non_nullable
                  as ThreadsFilter,
      ),
    );
  }
}

/// @nodoc

class _$SearchFormStateImpl implements _SearchFormState {
  const _$SearchFormStateImpl({
    required this.suggestions,
    required final List<Suggestion> resultFilteredSuggestions,
    required this.filter,
    required this.submittedFilter,
  }) : _resultFilteredSuggestions = resultFilteredSuggestions;

  @override
  final Result<List<Suggestion>> suggestions;
  final List<Suggestion> _resultFilteredSuggestions;
  @override
  List<Suggestion> get resultFilteredSuggestions {
    if (_resultFilteredSuggestions is EqualUnmodifiableListView)
      return _resultFilteredSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_resultFilteredSuggestions);
  }

  @override
  final ThreadsFilter filter;
  @override
  final ThreadsFilter submittedFilter;

  @override
  String toString() {
    return 'SearchFormState(suggestions: $suggestions, resultFilteredSuggestions: $resultFilteredSuggestions, filter: $filter, submittedFilter: $submittedFilter)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchFormStateImpl &&
            (identical(other.suggestions, suggestions) ||
                other.suggestions == suggestions) &&
            const DeepCollectionEquality().equals(
              other._resultFilteredSuggestions,
              _resultFilteredSuggestions,
            ) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.submittedFilter, submittedFilter) ||
                other.submittedFilter == submittedFilter));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    suggestions,
    const DeepCollectionEquality().hash(_resultFilteredSuggestions),
    filter,
    submittedFilter,
  );

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchFormStateImplCopyWith<_$SearchFormStateImpl> get copyWith =>
      __$$SearchFormStateImplCopyWithImpl<_$SearchFormStateImpl>(
        this,
        _$identity,
      );
}

abstract class _SearchFormState implements SearchFormState {
  const factory _SearchFormState({
    required final Result<List<Suggestion>> suggestions,
    required final List<Suggestion> resultFilteredSuggestions,
    required final ThreadsFilter filter,
    required final ThreadsFilter submittedFilter,
  }) = _$SearchFormStateImpl;

  @override
  Result<List<Suggestion>> get suggestions;
  @override
  List<Suggestion> get resultFilteredSuggestions;
  @override
  ThreadsFilter get filter;
  @override
  ThreadsFilter get submittedFilter;

  /// Create a copy of SearchFormState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchFormStateImplCopyWith<_$SearchFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
