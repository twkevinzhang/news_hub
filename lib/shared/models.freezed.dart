// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Result<R> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(R data) completed,
    required TResult Function(Exception exception) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(R data)? completed,
    TResult? Function(Exception exception)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(R data)? completed,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<R> value) initial,
    required TResult Function(ResultLoading<R> value) loading,
    required TResult Function(ResultCompleted<R> value) completed,
    required TResult Function(ResultError<R> value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<R> value)? initial,
    TResult? Function(ResultLoading<R> value)? loading,
    TResult? Function(ResultCompleted<R> value)? completed,
    TResult? Function(ResultError<R> value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<R> value)? initial,
    TResult Function(ResultLoading<R> value)? loading,
    TResult Function(ResultCompleted<R> value)? completed,
    TResult Function(ResultError<R> value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<R, $Res> {
  factory $ResultCopyWith(Result<R> value, $Res Function(Result<R>) then) =
      _$ResultCopyWithImpl<R, $Res, Result<R>>;
}

/// @nodoc
class _$ResultCopyWithImpl<R, $Res, $Val extends Result<R>>
    implements $ResultCopyWith<R, $Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ResultInitialImplCopyWith<R, $Res> {
  factory _$$ResultInitialImplCopyWith(_$ResultInitialImpl<R> value,
          $Res Function(_$ResultInitialImpl<R>) then) =
      __$$ResultInitialImplCopyWithImpl<R, $Res>;
}

/// @nodoc
class __$$ResultInitialImplCopyWithImpl<R, $Res>
    extends _$ResultCopyWithImpl<R, $Res, _$ResultInitialImpl<R>>
    implements _$$ResultInitialImplCopyWith<R, $Res> {
  __$$ResultInitialImplCopyWithImpl(_$ResultInitialImpl<R> _value,
      $Res Function(_$ResultInitialImpl<R>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResultInitialImpl<R> implements ResultInitial<R> {
  const _$ResultInitialImpl();

  @override
  String toString() {
    return 'Result<$R>.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultInitialImpl<R>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(R data) completed,
    required TResult Function(Exception exception) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(R data)? completed,
    TResult? Function(Exception exception)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(R data)? completed,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<R> value) initial,
    required TResult Function(ResultLoading<R> value) loading,
    required TResult Function(ResultCompleted<R> value) completed,
    required TResult Function(ResultError<R> value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<R> value)? initial,
    TResult? Function(ResultLoading<R> value)? loading,
    TResult? Function(ResultCompleted<R> value)? completed,
    TResult? Function(ResultError<R> value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<R> value)? initial,
    TResult Function(ResultLoading<R> value)? loading,
    TResult Function(ResultCompleted<R> value)? completed,
    TResult Function(ResultError<R> value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ResultInitial<R> implements Result<R> {
  const factory ResultInitial() = _$ResultInitialImpl<R>;
}

/// @nodoc
abstract class _$$ResultLoadingImplCopyWith<R, $Res> {
  factory _$$ResultLoadingImplCopyWith(_$ResultLoadingImpl<R> value,
          $Res Function(_$ResultLoadingImpl<R>) then) =
      __$$ResultLoadingImplCopyWithImpl<R, $Res>;
}

/// @nodoc
class __$$ResultLoadingImplCopyWithImpl<R, $Res>
    extends _$ResultCopyWithImpl<R, $Res, _$ResultLoadingImpl<R>>
    implements _$$ResultLoadingImplCopyWith<R, $Res> {
  __$$ResultLoadingImplCopyWithImpl(_$ResultLoadingImpl<R> _value,
      $Res Function(_$ResultLoadingImpl<R>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResultLoadingImpl<R> implements ResultLoading<R> {
  const _$ResultLoadingImpl();

  @override
  String toString() {
    return 'Result<$R>.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ResultLoadingImpl<R>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(R data) completed,
    required TResult Function(Exception exception) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(R data)? completed,
    TResult? Function(Exception exception)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(R data)? completed,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<R> value) initial,
    required TResult Function(ResultLoading<R> value) loading,
    required TResult Function(ResultCompleted<R> value) completed,
    required TResult Function(ResultError<R> value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<R> value)? initial,
    TResult? Function(ResultLoading<R> value)? loading,
    TResult? Function(ResultCompleted<R> value)? completed,
    TResult? Function(ResultError<R> value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<R> value)? initial,
    TResult Function(ResultLoading<R> value)? loading,
    TResult Function(ResultCompleted<R> value)? completed,
    TResult Function(ResultError<R> value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ResultLoading<R> implements Result<R> {
  const factory ResultLoading() = _$ResultLoadingImpl<R>;
}

/// @nodoc
abstract class _$$ResultCompletedImplCopyWith<R, $Res> {
  factory _$$ResultCompletedImplCopyWith(_$ResultCompletedImpl<R> value,
          $Res Function(_$ResultCompletedImpl<R>) then) =
      __$$ResultCompletedImplCopyWithImpl<R, $Res>;
  @useResult
  $Res call({R data});
}

/// @nodoc
class __$$ResultCompletedImplCopyWithImpl<R, $Res>
    extends _$ResultCopyWithImpl<R, $Res, _$ResultCompletedImpl<R>>
    implements _$$ResultCompletedImplCopyWith<R, $Res> {
  __$$ResultCompletedImplCopyWithImpl(_$ResultCompletedImpl<R> _value,
      $Res Function(_$ResultCompletedImpl<R>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$ResultCompletedImpl<R>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as R,
    ));
  }
}

/// @nodoc

class _$ResultCompletedImpl<R> implements ResultCompleted<R> {
  const _$ResultCompletedImpl(this.data);

  @override
  final R data;

  @override
  String toString() {
    return 'Result<$R>.completed(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultCompletedImpl<R> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultCompletedImplCopyWith<R, _$ResultCompletedImpl<R>> get copyWith =>
      __$$ResultCompletedImplCopyWithImpl<R, _$ResultCompletedImpl<R>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(R data) completed,
    required TResult Function(Exception exception) error,
  }) {
    return completed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(R data)? completed,
    TResult? Function(Exception exception)? error,
  }) {
    return completed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(R data)? completed,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<R> value) initial,
    required TResult Function(ResultLoading<R> value) loading,
    required TResult Function(ResultCompleted<R> value) completed,
    required TResult Function(ResultError<R> value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<R> value)? initial,
    TResult? Function(ResultLoading<R> value)? loading,
    TResult? Function(ResultCompleted<R> value)? completed,
    TResult? Function(ResultError<R> value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<R> value)? initial,
    TResult Function(ResultLoading<R> value)? loading,
    TResult Function(ResultCompleted<R> value)? completed,
    TResult Function(ResultError<R> value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class ResultCompleted<R> implements Result<R> {
  const factory ResultCompleted(final R data) = _$ResultCompletedImpl<R>;

  R get data;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultCompletedImplCopyWith<R, _$ResultCompletedImpl<R>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResultErrorImplCopyWith<R, $Res> {
  factory _$$ResultErrorImplCopyWith(_$ResultErrorImpl<R> value,
          $Res Function(_$ResultErrorImpl<R>) then) =
      __$$ResultErrorImplCopyWithImpl<R, $Res>;
  @useResult
  $Res call({Exception exception});
}

/// @nodoc
class __$$ResultErrorImplCopyWithImpl<R, $Res>
    extends _$ResultCopyWithImpl<R, $Res, _$ResultErrorImpl<R>>
    implements _$$ResultErrorImplCopyWith<R, $Res> {
  __$$ResultErrorImplCopyWithImpl(
      _$ResultErrorImpl<R> _value, $Res Function(_$ResultErrorImpl<R>) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = null,
  }) {
    return _then(_$ResultErrorImpl<R>(
      null == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc

class _$ResultErrorImpl<R> implements ResultError<R> {
  const _$ResultErrorImpl(this.exception);

  @override
  final Exception exception;

  @override
  String toString() {
    return 'Result<$R>.error(exception: $exception)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultErrorImpl<R> &&
            (identical(other.exception, exception) ||
                other.exception == exception));
  }

  @override
  int get hashCode => Object.hash(runtimeType, exception);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultErrorImplCopyWith<R, _$ResultErrorImpl<R>> get copyWith =>
      __$$ResultErrorImplCopyWithImpl<R, _$ResultErrorImpl<R>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(R data) completed,
    required TResult Function(Exception exception) error,
  }) {
    return error(exception);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(R data)? completed,
    TResult? Function(Exception exception)? error,
  }) {
    return error?.call(exception);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(R data)? completed,
    TResult Function(Exception exception)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(exception);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ResultInitial<R> value) initial,
    required TResult Function(ResultLoading<R> value) loading,
    required TResult Function(ResultCompleted<R> value) completed,
    required TResult Function(ResultError<R> value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ResultInitial<R> value)? initial,
    TResult? Function(ResultLoading<R> value)? loading,
    TResult? Function(ResultCompleted<R> value)? completed,
    TResult? Function(ResultError<R> value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ResultInitial<R> value)? initial,
    TResult Function(ResultLoading<R> value)? loading,
    TResult Function(ResultCompleted<R> value)? completed,
    TResult Function(ResultError<R> value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ResultError<R> implements Result<R> {
  const factory ResultError(final Exception exception) = _$ResultErrorImpl<R>;

  Exception get exception;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultErrorImplCopyWith<R, _$ResultErrorImpl<R>> get copyWith =>
      throw _privateConstructorUsedError;
}
