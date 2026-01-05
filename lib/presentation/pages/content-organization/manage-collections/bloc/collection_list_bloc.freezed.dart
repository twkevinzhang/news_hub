// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollectionListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCollectionList value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCollectionList value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCollectionList value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionListEventCopyWith<$Res> {
  factory $CollectionListEventCopyWith(
          CollectionListEvent value, $Res Function(CollectionListEvent) then) =
      _$CollectionListEventCopyWithImpl<$Res, CollectionListEvent>;
}

/// @nodoc
class _$CollectionListEventCopyWithImpl<$Res, $Val extends CollectionListEvent>
    implements $CollectionListEventCopyWith<$Res> {
  _$CollectionListEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadCollectionListImplCopyWith<$Res> {
  factory _$$LoadCollectionListImplCopyWith(_$LoadCollectionListImpl value,
          $Res Function(_$LoadCollectionListImpl) then) =
      __$$LoadCollectionListImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCollectionListImplCopyWithImpl<$Res>
    extends _$CollectionListEventCopyWithImpl<$Res, _$LoadCollectionListImpl>
    implements _$$LoadCollectionListImplCopyWith<$Res> {
  __$$LoadCollectionListImplCopyWithImpl(_$LoadCollectionListImpl _value,
      $Res Function(_$LoadCollectionListImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionListEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadCollectionListImpl implements LoadCollectionList {
  const _$LoadCollectionListImpl();

  @override
  String toString() {
    return 'CollectionListEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCollectionListImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
  }) {
    return load();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
  }) {
    return load?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadCollectionList value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCollectionList value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCollectionList value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadCollectionList implements CollectionListEvent {
  const factory LoadCollectionList() = _$LoadCollectionListImpl;
}

/// @nodoc
mixin _$CollectionListState {
  List<Collection> get collections => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CollectionListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionListStateCopyWith<CollectionListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionListStateCopyWith<$Res> {
  factory $CollectionListStateCopyWith(
          CollectionListState value, $Res Function(CollectionListState) then) =
      _$CollectionListStateCopyWithImpl<$Res, CollectionListState>;
  @useResult
  $Res call(
      {List<Collection> collections, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$CollectionListStateCopyWithImpl<$Res, $Val extends CollectionListState>
    implements $CollectionListStateCopyWith<$Res> {
  _$CollectionListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      collections: null == collections
          ? _value.collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionListStateImplCopyWith<$Res>
    implements $CollectionListStateCopyWith<$Res> {
  factory _$$CollectionListStateImplCopyWith(_$CollectionListStateImpl value,
          $Res Function(_$CollectionListStateImpl) then) =
      __$$CollectionListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Collection> collections, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$CollectionListStateImplCopyWithImpl<$Res>
    extends _$CollectionListStateCopyWithImpl<$Res, _$CollectionListStateImpl>
    implements _$$CollectionListStateImplCopyWith<$Res> {
  __$$CollectionListStateImplCopyWithImpl(_$CollectionListStateImpl _value,
      $Res Function(_$CollectionListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CollectionListStateImpl(
      collections: null == collections
          ? _value._collections
          : collections // ignore: cast_nullable_to_non_nullable
              as List<Collection>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CollectionListStateImpl implements _CollectionListState {
  const _$CollectionListStateImpl(
      {final List<Collection> collections = const [],
      this.isLoading = false,
      this.errorMessage})
      : _collections = collections;

  final List<Collection> _collections;
  @override
  @JsonKey()
  List<Collection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'CollectionListState(collections: $collections, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._collections, _collections) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_collections),
      isLoading,
      errorMessage);

  /// Create a copy of CollectionListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionListStateImplCopyWith<_$CollectionListStateImpl> get copyWith =>
      __$$CollectionListStateImplCopyWithImpl<_$CollectionListStateImpl>(
          this, _$identity);
}

abstract class _CollectionListState implements CollectionListState {
  const factory _CollectionListState(
      {final List<Collection> collections,
      final bool isLoading,
      final String? errorMessage}) = _$CollectionListStateImpl;

  @override
  List<Collection> get collections;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of CollectionListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionListStateImplCopyWith<_$CollectionListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
