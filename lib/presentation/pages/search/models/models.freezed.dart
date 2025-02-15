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
mixin _$ThreadsFilter {
  Set<String> get extensionPkgNames => throw _privateConstructorUsedError;
  Set<String> get boardIds => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadsFilterCopyWith<ThreadsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadsFilterCopyWith<$Res> {
  factory $ThreadsFilterCopyWith(
          ThreadsFilter value, $Res Function(ThreadsFilter) then) =
      _$ThreadsFilterCopyWithImpl<$Res, ThreadsFilter>;
  @useResult
  $Res call(
      {Set<String> extensionPkgNames, Set<String> boardIds, String? keywords});
}

/// @nodoc
class _$ThreadsFilterCopyWithImpl<$Res, $Val extends ThreadsFilter>
    implements $ThreadsFilterCopyWith<$Res> {
  _$ThreadsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgNames = null,
    Object? boardIds = null,
    Object? keywords = freezed,
  }) {
    return _then(_value.copyWith(
      extensionPkgNames: null == extensionPkgNames
          ? _value.extensionPkgNames
          : extensionPkgNames // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      boardIds: null == boardIds
          ? _value.boardIds
          : boardIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadsFilterImplCopyWith<$Res>
    implements $ThreadsFilterCopyWith<$Res> {
  factory _$$ThreadsFilterImplCopyWith(
          _$ThreadsFilterImpl value, $Res Function(_$ThreadsFilterImpl) then) =
      __$$ThreadsFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Set<String> extensionPkgNames, Set<String> boardIds, String? keywords});
}

/// @nodoc
class __$$ThreadsFilterImplCopyWithImpl<$Res>
    extends _$ThreadsFilterCopyWithImpl<$Res, _$ThreadsFilterImpl>
    implements _$$ThreadsFilterImplCopyWith<$Res> {
  __$$ThreadsFilterImplCopyWithImpl(
      _$ThreadsFilterImpl _value, $Res Function(_$ThreadsFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgNames = null,
    Object? boardIds = null,
    Object? keywords = freezed,
  }) {
    return _then(_$ThreadsFilterImpl(
      extensionPkgNames: null == extensionPkgNames
          ? _value._extensionPkgNames
          : extensionPkgNames // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      boardIds: null == boardIds
          ? _value._boardIds
          : boardIds // ignore: cast_nullable_to_non_nullable
              as Set<String>,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ThreadsFilterImpl
    with DiagnosticableTreeMixin
    implements _ThreadsFilter {
  const _$ThreadsFilterImpl(
      {required final Set<String> extensionPkgNames,
      required final Set<String> boardIds,
      required this.keywords})
      : _extensionPkgNames = extensionPkgNames,
        _boardIds = boardIds;

  final Set<String> _extensionPkgNames;
  @override
  Set<String> get extensionPkgNames {
    if (_extensionPkgNames is EqualUnmodifiableSetView)
      return _extensionPkgNames;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_extensionPkgNames);
  }

  final Set<String> _boardIds;
  @override
  Set<String> get boardIds {
    if (_boardIds is EqualUnmodifiableSetView) return _boardIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_boardIds);
  }

  @override
  final String? keywords;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadsFilter(extensionPkgNames: $extensionPkgNames, boardIds: $boardIds, keywords: $keywords)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadsFilter'))
      ..add(DiagnosticsProperty('extensionPkgNames', extensionPkgNames))
      ..add(DiagnosticsProperty('boardIds', boardIds))
      ..add(DiagnosticsProperty('keywords', keywords));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsFilterImpl &&
            const DeepCollectionEquality()
                .equals(other._extensionPkgNames, _extensionPkgNames) &&
            const DeepCollectionEquality().equals(other._boardIds, _boardIds) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_extensionPkgNames),
      const DeepCollectionEquality().hash(_boardIds),
      keywords);

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadsFilterImplCopyWith<_$ThreadsFilterImpl> get copyWith =>
      __$$ThreadsFilterImplCopyWithImpl<_$ThreadsFilterImpl>(this, _$identity);
}

abstract class _ThreadsFilter implements ThreadsFilter {
  const factory _ThreadsFilter(
      {required final Set<String> extensionPkgNames,
      required final Set<String> boardIds,
      required final String? keywords}) = _$ThreadsFilterImpl;

  @override
  Set<String> get extensionPkgNames;
  @override
  Set<String> get boardIds;
  @override
  String? get keywords;

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadsFilterImplCopyWith<_$ThreadsFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThreadsSorting {
  List<String> get boardsOrder => throw _privateConstructorUsedError;
  Map<String, String> get threadsSorting => throw _privateConstructorUsedError;

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadsSortingCopyWith<ThreadsSorting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadsSortingCopyWith<$Res> {
  factory $ThreadsSortingCopyWith(
          ThreadsSorting value, $Res Function(ThreadsSorting) then) =
      _$ThreadsSortingCopyWithImpl<$Res, ThreadsSorting>;
  @useResult
  $Res call({List<String> boardsOrder, Map<String, String> threadsSorting});
}

/// @nodoc
class _$ThreadsSortingCopyWithImpl<$Res, $Val extends ThreadsSorting>
    implements $ThreadsSortingCopyWith<$Res> {
  _$ThreadsSortingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardsOrder = null,
    Object? threadsSorting = null,
  }) {
    return _then(_value.copyWith(
      boardsOrder: null == boardsOrder
          ? _value.boardsOrder
          : boardsOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
      threadsSorting: null == threadsSorting
          ? _value.threadsSorting
          : threadsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadsSortingImplCopyWith<$Res>
    implements $ThreadsSortingCopyWith<$Res> {
  factory _$$ThreadsSortingImplCopyWith(_$ThreadsSortingImpl value,
          $Res Function(_$ThreadsSortingImpl) then) =
      __$$ThreadsSortingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> boardsOrder, Map<String, String> threadsSorting});
}

/// @nodoc
class __$$ThreadsSortingImplCopyWithImpl<$Res>
    extends _$ThreadsSortingCopyWithImpl<$Res, _$ThreadsSortingImpl>
    implements _$$ThreadsSortingImplCopyWith<$Res> {
  __$$ThreadsSortingImplCopyWithImpl(
      _$ThreadsSortingImpl _value, $Res Function(_$ThreadsSortingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardsOrder = null,
    Object? threadsSorting = null,
  }) {
    return _then(_$ThreadsSortingImpl(
      boardsOrder: null == boardsOrder
          ? _value._boardsOrder
          : boardsOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
      threadsSorting: null == threadsSorting
          ? _value._threadsSorting
          : threadsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc

class _$ThreadsSortingImpl
    with DiagnosticableTreeMixin
    implements _ThreadsSorting {
  const _$ThreadsSortingImpl(
      {required final List<String> boardsOrder,
      required final Map<String, String> threadsSorting})
      : _boardsOrder = boardsOrder,
        _threadsSorting = threadsSorting;

  final List<String> _boardsOrder;
  @override
  List<String> get boardsOrder {
    if (_boardsOrder is EqualUnmodifiableListView) return _boardsOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boardsOrder);
  }

  final Map<String, String> _threadsSorting;
  @override
  Map<String, String> get threadsSorting {
    if (_threadsSorting is EqualUnmodifiableMapView) return _threadsSorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_threadsSorting);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadsSorting(boardsOrder: $boardsOrder, threadsSorting: $threadsSorting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadsSorting'))
      ..add(DiagnosticsProperty('boardsOrder', boardsOrder))
      ..add(DiagnosticsProperty('threadsSorting', threadsSorting));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsSortingImpl &&
            const DeepCollectionEquality()
                .equals(other._boardsOrder, _boardsOrder) &&
            const DeepCollectionEquality()
                .equals(other._threadsSorting, _threadsSorting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_boardsOrder),
      const DeepCollectionEquality().hash(_threadsSorting));

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadsSortingImplCopyWith<_$ThreadsSortingImpl> get copyWith =>
      __$$ThreadsSortingImplCopyWithImpl<_$ThreadsSortingImpl>(
          this, _$identity);
}

abstract class _ThreadsSorting implements ThreadsSorting {
  const factory _ThreadsSorting(
          {required final List<String> boardsOrder,
          required final Map<String, String> threadsSorting}) =
      _$ThreadsSortingImpl;

  @override
  List<String> get boardsOrder;
  @override
  Map<String, String> get threadsSorting;

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadsSortingImplCopyWith<_$ThreadsSortingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
