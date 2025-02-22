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
  Map<String, String> get boardsSorting => throw _privateConstructorUsedError;
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
  $Res call({Map<String, String> boardsSorting, String? keywords});
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
    Object? boardsSorting = null,
    Object? keywords = freezed,
  }) {
    return _then(_value.copyWith(
      boardsSorting: null == boardsSorting
          ? _value.boardsSorting
          : boardsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
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
  $Res call({Map<String, String> boardsSorting, String? keywords});
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
    Object? boardsSorting = null,
    Object? keywords = freezed,
  }) {
    return _then(_$ThreadsFilterImpl(
      boardsSorting: null == boardsSorting
          ? _value._boardsSorting
          : boardsSorting // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
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
      {required final Map<String, String> boardsSorting,
      required this.keywords})
      : _boardsSorting = boardsSorting;

  final Map<String, String> _boardsSorting;
  @override
  Map<String, String> get boardsSorting {
    if (_boardsSorting is EqualUnmodifiableMapView) return _boardsSorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boardsSorting);
  }

  @override
  final String? keywords;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadsFilter(boardsSorting: $boardsSorting, keywords: $keywords)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadsFilter'))
      ..add(DiagnosticsProperty('boardsSorting', boardsSorting))
      ..add(DiagnosticsProperty('keywords', keywords));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsFilterImpl &&
            const DeepCollectionEquality()
                .equals(other._boardsSorting, _boardsSorting) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_boardsSorting), keywords);

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
      {required final Map<String, String> boardsSorting,
      required final String? keywords}) = _$ThreadsFilterImpl;

  @override
  Map<String, String> get boardsSorting;
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
  $Res call({List<String> boardsOrder});
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
  }) {
    return _then(_value.copyWith(
      boardsOrder: null == boardsOrder
          ? _value.boardsOrder
          : boardsOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
  $Res call({List<String> boardsOrder});
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
  }) {
    return _then(_$ThreadsSortingImpl(
      boardsOrder: null == boardsOrder
          ? _value._boardsOrder
          : boardsOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$ThreadsSortingImpl
    with DiagnosticableTreeMixin
    implements _ThreadsSorting {
  const _$ThreadsSortingImpl({required final List<String> boardsOrder})
      : _boardsOrder = boardsOrder;

  final List<String> _boardsOrder;
  @override
  List<String> get boardsOrder {
    if (_boardsOrder is EqualUnmodifiableListView) return _boardsOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boardsOrder);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadsSorting(boardsOrder: $boardsOrder)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadsSorting'))
      ..add(DiagnosticsProperty('boardsOrder', boardsOrder));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsSortingImpl &&
            const DeepCollectionEquality()
                .equals(other._boardsOrder, _boardsOrder));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_boardsOrder));

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
  const factory _ThreadsSorting({required final List<String> boardsOrder}) =
      _$ThreadsSortingImpl;

  @override
  List<String> get boardsOrder;

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadsSortingImplCopyWith<_$ThreadsSortingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
