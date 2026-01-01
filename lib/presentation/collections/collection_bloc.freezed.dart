// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollectionEvent {
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
    required TResult Function(LoadCollections value) load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCollections value)? load,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCollections value)? load,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionEventCopyWith<$Res> {
  factory $CollectionEventCopyWith(
          CollectionEvent value, $Res Function(CollectionEvent) then) =
      _$CollectionEventCopyWithImpl<$Res, CollectionEvent>;
}

/// @nodoc
class _$CollectionEventCopyWithImpl<$Res, $Val extends CollectionEvent>
    implements $CollectionEventCopyWith<$Res> {
  _$CollectionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadCollectionsImplCopyWith<$Res> {
  factory _$$LoadCollectionsImplCopyWith(_$LoadCollectionsImpl value,
          $Res Function(_$LoadCollectionsImpl) then) =
      __$$LoadCollectionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadCollectionsImplCopyWithImpl<$Res>
    extends _$CollectionEventCopyWithImpl<$Res, _$LoadCollectionsImpl>
    implements _$$LoadCollectionsImplCopyWith<$Res> {
  __$$LoadCollectionsImplCopyWithImpl(
      _$LoadCollectionsImpl _value, $Res Function(_$LoadCollectionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadCollectionsImpl implements LoadCollections {
  const _$LoadCollectionsImpl();

  @override
  String toString() {
    return 'CollectionEvent.load()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadCollectionsImpl);
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
    required TResult Function(LoadCollections value) load,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadCollections value)? load,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadCollections value)? load,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadCollections implements CollectionEvent {
  const factory LoadCollections() = _$LoadCollectionsImpl;
}

/// @nodoc
mixin _$CollectionState {
  List<Collection> get collections => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CollectionStateCopyWith<CollectionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionStateCopyWith<$Res> {
  factory $CollectionStateCopyWith(
          CollectionState value, $Res Function(CollectionState) then) =
      _$CollectionStateCopyWithImpl<$Res, CollectionState>;
  @useResult
  $Res call(
      {List<Collection> collections, bool isLoading, String? errorMessage});
}

/// @nodoc
class _$CollectionStateCopyWithImpl<$Res, $Val extends CollectionState>
    implements $CollectionStateCopyWith<$Res> {
  _$CollectionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CollectionState
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
abstract class _$$CollectionStateImplCopyWith<$Res>
    implements $CollectionStateCopyWith<$Res> {
  factory _$$CollectionStateImplCopyWith(_$CollectionStateImpl value,
          $Res Function(_$CollectionStateImpl) then) =
      __$$CollectionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Collection> collections, bool isLoading, String? errorMessage});
}

/// @nodoc
class __$$CollectionStateImplCopyWithImpl<$Res>
    extends _$CollectionStateCopyWithImpl<$Res, _$CollectionStateImpl>
    implements _$$CollectionStateImplCopyWith<$Res> {
  __$$CollectionStateImplCopyWithImpl(
      _$CollectionStateImpl _value, $Res Function(_$CollectionStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? collections = null,
    Object? isLoading = null,
    Object? errorMessage = freezed,
  }) {
    return _then(_$CollectionStateImpl(
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

class _$CollectionStateImpl implements _CollectionState {
  const _$CollectionStateImpl(
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
    return 'CollectionState(collections: $collections, isLoading: $isLoading, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionStateImpl &&
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

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionStateImplCopyWith<_$CollectionStateImpl> get copyWith =>
      __$$CollectionStateImplCopyWithImpl<_$CollectionStateImpl>(
          this, _$identity);
}

abstract class _CollectionState implements CollectionState {
  const factory _CollectionState(
      {final List<Collection> collections,
      final bool isLoading,
      final String? errorMessage}) = _$CollectionStateImpl;

  @override
  List<Collection> get collections;
  @override
  bool get isLoading;
  @override
  String? get errorMessage;

  /// Create a copy of CollectionState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CollectionStateImplCopyWith<_$CollectionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
