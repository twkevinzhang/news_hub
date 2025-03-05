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
mixin _$Pagination {
  int? get page => throw _privateConstructorUsedError;
  int? get pageSize => throw _privateConstructorUsedError;
  int? get limit => throw _privateConstructorUsedError;
  String? get prevCursor => throw _privateConstructorUsedError;
  String? get nextCursor => throw _privateConstructorUsedError;

  /// Serializes this Pagination to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginationCopyWith<Pagination> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationCopyWith<$Res> {
  factory $PaginationCopyWith(
          Pagination value, $Res Function(Pagination) then) =
      _$PaginationCopyWithImpl<$Res, Pagination>;
  @useResult
  $Res call(
      {int? page,
      int? pageSize,
      int? limit,
      String? prevCursor,
      String? nextCursor});
}

/// @nodoc
class _$PaginationCopyWithImpl<$Res, $Val extends Pagination>
    implements $PaginationCopyWith<$Res> {
  _$PaginationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? limit = freezed,
    Object? prevCursor = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_value.copyWith(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      prevCursor: freezed == prevCursor
          ? _value.prevCursor
          : prevCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginationImplCopyWith<$Res>
    implements $PaginationCopyWith<$Res> {
  factory _$$PaginationImplCopyWith(
          _$PaginationImpl value, $Res Function(_$PaginationImpl) then) =
      __$$PaginationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? page,
      int? pageSize,
      int? limit,
      String? prevCursor,
      String? nextCursor});
}

/// @nodoc
class __$$PaginationImplCopyWithImpl<$Res>
    extends _$PaginationCopyWithImpl<$Res, _$PaginationImpl>
    implements _$$PaginationImplCopyWith<$Res> {
  __$$PaginationImplCopyWithImpl(
      _$PaginationImpl _value, $Res Function(_$PaginationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = freezed,
    Object? pageSize = freezed,
    Object? limit = freezed,
    Object? prevCursor = freezed,
    Object? nextCursor = freezed,
  }) {
    return _then(_$PaginationImpl(
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      pageSize: freezed == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int?,
      limit: freezed == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int?,
      prevCursor: freezed == prevCursor
          ? _value.prevCursor
          : prevCursor // ignore: cast_nullable_to_non_nullable
              as String?,
      nextCursor: freezed == nextCursor
          ? _value.nextCursor
          : nextCursor // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$PaginationImpl implements _Pagination {
  const _$PaginationImpl(
      {this.page, this.pageSize, this.limit, this.prevCursor, this.nextCursor});

  @override
  final int? page;
  @override
  final int? pageSize;
  @override
  final int? limit;
  @override
  final String? prevCursor;
  @override
  final String? nextCursor;

  @override
  String toString() {
    return 'Pagination(page: $page, pageSize: $pageSize, limit: $limit, prevCursor: $prevCursor, nextCursor: $nextCursor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginationImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.limit, limit) || other.limit == limit) &&
            (identical(other.prevCursor, prevCursor) ||
                other.prevCursor == prevCursor) &&
            (identical(other.nextCursor, nextCursor) ||
                other.nextCursor == nextCursor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pageSize, limit, prevCursor, nextCursor);

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      __$$PaginationImplCopyWithImpl<_$PaginationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaginationImplToJson(
      this,
    );
  }
}

abstract class _Pagination implements Pagination {
  const factory _Pagination(
      {final int? page,
      final int? pageSize,
      final int? limit,
      final String? prevCursor,
      final String? nextCursor}) = _$PaginationImpl;

  @override
  int? get page;
  @override
  int? get pageSize;
  @override
  int? get limit;
  @override
  String? get prevCursor;
  @override
  String? get nextCursor;

  /// Create a copy of Pagination
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginationImplCopyWith<_$PaginationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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
