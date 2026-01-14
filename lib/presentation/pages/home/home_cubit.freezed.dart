// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$HomeState {
  String get title => throw _privateConstructorUsedError;
  List<Collection> get collections => throw _privateConstructorUsedError;
  String? get expandedCollectionId => throw _privateConstructorUsedError;
  SidecarConnectionState get sidecarStatus =>
      throw _privateConstructorUsedError;
  String? get sidecarMessage => throw _privateConstructorUsedError;
  RouteData? get pendingRoute => throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({
    String title,
    List<Collection> collections,
    String? expandedCollectionId,
    SidecarConnectionState sidecarStatus,
    String? sidecarMessage,
    RouteData? pendingRoute,
  });
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? collections = null,
    Object? expandedCollectionId = freezed,
    Object? sidecarStatus = null,
    Object? sidecarMessage = freezed,
    Object? pendingRoute = freezed,
  }) {
    return _then(
      _value.copyWith(
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            collections: null == collections
                ? _value.collections
                : collections // ignore: cast_nullable_to_non_nullable
                      as List<Collection>,
            expandedCollectionId: freezed == expandedCollectionId
                ? _value.expandedCollectionId
                : expandedCollectionId // ignore: cast_nullable_to_non_nullable
                      as String?,
            sidecarStatus: null == sidecarStatus
                ? _value.sidecarStatus
                : sidecarStatus // ignore: cast_nullable_to_non_nullable
                      as SidecarConnectionState,
            sidecarMessage: freezed == sidecarMessage
                ? _value.sidecarMessage
                : sidecarMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            pendingRoute: freezed == pendingRoute
                ? _value.pendingRoute
                : pendingRoute // ignore: cast_nullable_to_non_nullable
                      as RouteData?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
    _$HomeStateImpl value,
    $Res Function(_$HomeStateImpl) then,
  ) = __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String title,
    List<Collection> collections,
    String? expandedCollectionId,
    SidecarConnectionState sidecarStatus,
    String? sidecarMessage,
    RouteData? pendingRoute,
  });
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
    _$HomeStateImpl _value,
    $Res Function(_$HomeStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? collections = null,
    Object? expandedCollectionId = freezed,
    Object? sidecarStatus = null,
    Object? sidecarMessage = freezed,
    Object? pendingRoute = freezed,
  }) {
    return _then(
      _$HomeStateImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        collections: null == collections
            ? _value._collections
            : collections // ignore: cast_nullable_to_non_nullable
                  as List<Collection>,
        expandedCollectionId: freezed == expandedCollectionId
            ? _value.expandedCollectionId
            : expandedCollectionId // ignore: cast_nullable_to_non_nullable
                  as String?,
        sidecarStatus: null == sidecarStatus
            ? _value.sidecarStatus
            : sidecarStatus // ignore: cast_nullable_to_non_nullable
                  as SidecarConnectionState,
        sidecarMessage: freezed == sidecarMessage
            ? _value.sidecarMessage
            : sidecarMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        pendingRoute: freezed == pendingRoute
            ? _value.pendingRoute
            : pendingRoute // ignore: cast_nullable_to_non_nullable
                  as RouteData?,
      ),
    );
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl({
    this.title = 'NewsHub',
    final List<Collection> collections = const [],
    this.expandedCollectionId,
    this.sidecarStatus = SidecarConnectionState.uninitialized,
    this.sidecarMessage,
    this.pendingRoute,
  }) : _collections = collections,
       super._();

  @override
  @JsonKey()
  final String title;
  final List<Collection> _collections;
  @override
  @JsonKey()
  List<Collection> get collections {
    if (_collections is EqualUnmodifiableListView) return _collections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_collections);
  }

  @override
  final String? expandedCollectionId;
  @override
  @JsonKey()
  final SidecarConnectionState sidecarStatus;
  @override
  final String? sidecarMessage;
  @override
  final RouteData? pendingRoute;

  @override
  String toString() {
    return 'HomeState(title: $title, collections: $collections, expandedCollectionId: $expandedCollectionId, sidecarStatus: $sidecarStatus, sidecarMessage: $sidecarMessage, pendingRoute: $pendingRoute)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(
              other._collections,
              _collections,
            ) &&
            (identical(other.expandedCollectionId, expandedCollectionId) ||
                other.expandedCollectionId == expandedCollectionId) &&
            (identical(other.sidecarStatus, sidecarStatus) ||
                other.sidecarStatus == sidecarStatus) &&
            (identical(other.sidecarMessage, sidecarMessage) ||
                other.sidecarMessage == sidecarMessage) &&
            (identical(other.pendingRoute, pendingRoute) ||
                other.pendingRoute == pendingRoute));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    title,
    const DeepCollectionEquality().hash(_collections),
    expandedCollectionId,
    sidecarStatus,
    sidecarMessage,
    pendingRoute,
  );

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState({
    final String title,
    final List<Collection> collections,
    final String? expandedCollectionId,
    final SidecarConnectionState sidecarStatus,
    final String? sidecarMessage,
    final RouteData? pendingRoute,
  }) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  String get title;
  @override
  List<Collection> get collections;
  @override
  String? get expandedCollectionId;
  @override
  SidecarConnectionState get sidecarStatus;
  @override
  String? get sidecarMessage;
  @override
  RouteData? get pendingRoute;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
