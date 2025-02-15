// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SearchState {
  int get currentStep => throw _privateConstructorUsedError;
  Result<List<ExtensionWithBoards>> get installedExtensions =>
      throw _privateConstructorUsedError;
  ThreadsFilter get filter => throw _privateConstructorUsedError;
  ThreadsSorting get sorting => throw _privateConstructorUsedError;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SearchStateCopyWith<SearchState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SearchStateCopyWith<$Res> {
  factory $SearchStateCopyWith(
          SearchState value, $Res Function(SearchState) then) =
      _$SearchStateCopyWithImpl<$Res, SearchState>;
  @useResult
  $Res call(
      {int currentStep,
      Result<List<ExtensionWithBoards>> installedExtensions,
      ThreadsFilter filter,
      ThreadsSorting sorting});

  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get installedExtensions;
  $ThreadsFilterCopyWith<$Res> get filter;
  $ThreadsSortingCopyWith<$Res> get sorting;
}

/// @nodoc
class _$SearchStateCopyWithImpl<$Res, $Val extends SearchState>
    implements $SearchStateCopyWith<$Res> {
  _$SearchStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? installedExtensions = null,
    Object? filter = null,
    Object? sorting = null,
  }) {
    return _then(_value.copyWith(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      installedExtensions: null == installedExtensions
          ? _value.installedExtensions
          : installedExtensions // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ThreadsFilter,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as ThreadsSorting,
    ) as $Val);
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get installedExtensions {
    return $ResultCopyWith<List<ExtensionWithBoards>, $Res>(
        _value.installedExtensions, (value) {
      return _then(_value.copyWith(installedExtensions: value) as $Val);
    });
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsFilterCopyWith<$Res> get filter {
    return $ThreadsFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ThreadsSortingCopyWith<$Res> get sorting {
    return $ThreadsSortingCopyWith<$Res>(_value.sorting, (value) {
      return _then(_value.copyWith(sorting: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SearchStateImplCopyWith<$Res>
    implements $SearchStateCopyWith<$Res> {
  factory _$$SearchStateImplCopyWith(
          _$SearchStateImpl value, $Res Function(_$SearchStateImpl) then) =
      __$$SearchStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int currentStep,
      Result<List<ExtensionWithBoards>> installedExtensions,
      ThreadsFilter filter,
      ThreadsSorting sorting});

  @override
  $ResultCopyWith<List<ExtensionWithBoards>, $Res> get installedExtensions;
  @override
  $ThreadsFilterCopyWith<$Res> get filter;
  @override
  $ThreadsSortingCopyWith<$Res> get sorting;
}

/// @nodoc
class __$$SearchStateImplCopyWithImpl<$Res>
    extends _$SearchStateCopyWithImpl<$Res, _$SearchStateImpl>
    implements _$$SearchStateImplCopyWith<$Res> {
  __$$SearchStateImplCopyWithImpl(
      _$SearchStateImpl _value, $Res Function(_$SearchStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentStep = null,
    Object? installedExtensions = null,
    Object? filter = null,
    Object? sorting = null,
  }) {
    return _then(_$SearchStateImpl(
      currentStep: null == currentStep
          ? _value.currentStep
          : currentStep // ignore: cast_nullable_to_non_nullable
              as int,
      installedExtensions: null == installedExtensions
          ? _value.installedExtensions
          : installedExtensions // ignore: cast_nullable_to_non_nullable
              as Result<List<ExtensionWithBoards>>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ThreadsFilter,
      sorting: null == sorting
          ? _value.sorting
          : sorting // ignore: cast_nullable_to_non_nullable
              as ThreadsSorting,
    ));
  }
}

/// @nodoc

class _$SearchStateImpl implements _SearchState {
  const _$SearchStateImpl(
      {required this.currentStep,
      required this.installedExtensions,
      required this.filter,
      required this.sorting});

  @override
  final int currentStep;
  @override
  final Result<List<ExtensionWithBoards>> installedExtensions;
  @override
  final ThreadsFilter filter;
  @override
  final ThreadsSorting sorting;

  @override
  String toString() {
    return 'SearchState(currentStep: $currentStep, installedExtensions: $installedExtensions, filter: $filter, sorting: $sorting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchStateImpl &&
            (identical(other.currentStep, currentStep) ||
                other.currentStep == currentStep) &&
            (identical(other.installedExtensions, installedExtensions) ||
                other.installedExtensions == installedExtensions) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.sorting, sorting) || other.sorting == sorting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, currentStep, installedExtensions, filter, sorting);

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      __$$SearchStateImplCopyWithImpl<_$SearchStateImpl>(this, _$identity);
}

abstract class _SearchState implements SearchState {
  const factory _SearchState(
      {required final int currentStep,
      required final Result<List<ExtensionWithBoards>> installedExtensions,
      required final ThreadsFilter filter,
      required final ThreadsSorting sorting}) = _$SearchStateImpl;

  @override
  int get currentStep;
  @override
  Result<List<ExtensionWithBoards>> get installedExtensions;
  @override
  ThreadsFilter get filter;
  @override
  ThreadsSorting get sorting;

  /// Create a copy of SearchState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SearchStateImplCopyWith<_$SearchStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
