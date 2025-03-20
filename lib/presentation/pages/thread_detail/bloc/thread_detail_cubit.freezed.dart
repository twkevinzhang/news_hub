// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ThreadDetailState {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  Map<String, Result<ArticlePost>> get threadMap =>
      throw _privateConstructorUsedError;
  Map<String, Result<List<ArticlePost>>> get regardingPostsMap =>
      throw _privateConstructorUsedError;

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadDetailStateCopyWith<ThreadDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadDetailStateCopyWith<$Res> {
  factory $ThreadDetailStateCopyWith(
          ThreadDetailState value, $Res Function(ThreadDetailState) then) =
      _$ThreadDetailStateCopyWithImpl<$Res, ThreadDetailState>;
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      Map<String, Result<ArticlePost>> threadMap,
      Map<String, Result<List<ArticlePost>>> regardingPostsMap});
}

/// @nodoc
class _$ThreadDetailStateCopyWithImpl<$Res, $Val extends ThreadDetailState>
    implements $ThreadDetailStateCopyWith<$Res> {
  _$ThreadDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? threadMap = null,
    Object? regardingPostsMap = null,
  }) {
    return _then(_value.copyWith(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as String,
      boardId: null == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      threadId: null == threadId
          ? _value.threadId
          : threadId // ignore: cast_nullable_to_non_nullable
              as String,
      threadMap: null == threadMap
          ? _value.threadMap
          : threadMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Result<ArticlePost>>,
      regardingPostsMap: null == regardingPostsMap
          ? _value.regardingPostsMap
          : regardingPostsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Result<List<ArticlePost>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadDetailStateImplCopyWith<$Res>
    implements $ThreadDetailStateCopyWith<$Res> {
  factory _$$ThreadDetailStateImplCopyWith(_$ThreadDetailStateImpl value,
          $Res Function(_$ThreadDetailStateImpl) then) =
      __$$ThreadDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      Map<String, Result<ArticlePost>> threadMap,
      Map<String, Result<List<ArticlePost>>> regardingPostsMap});
}

/// @nodoc
class __$$ThreadDetailStateImplCopyWithImpl<$Res>
    extends _$ThreadDetailStateCopyWithImpl<$Res, _$ThreadDetailStateImpl>
    implements _$$ThreadDetailStateImplCopyWith<$Res> {
  __$$ThreadDetailStateImplCopyWithImpl(_$ThreadDetailStateImpl _value,
      $Res Function(_$ThreadDetailStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? threadMap = null,
    Object? regardingPostsMap = null,
  }) {
    return _then(_$ThreadDetailStateImpl(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as String,
      boardId: null == boardId
          ? _value.boardId
          : boardId // ignore: cast_nullable_to_non_nullable
              as String,
      threadId: null == threadId
          ? _value.threadId
          : threadId // ignore: cast_nullable_to_non_nullable
              as String,
      threadMap: null == threadMap
          ? _value._threadMap
          : threadMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Result<ArticlePost>>,
      regardingPostsMap: null == regardingPostsMap
          ? _value._regardingPostsMap
          : regardingPostsMap // ignore: cast_nullable_to_non_nullable
              as Map<String, Result<List<ArticlePost>>>,
    ));
  }
}

/// @nodoc

class _$ThreadDetailStateImpl
    with DiagnosticableTreeMixin
    implements _ThreadDetailState {
  const _$ThreadDetailStateImpl(
      {required this.extensionPkgName,
      required this.siteId,
      required this.boardId,
      required this.threadId,
      required final Map<String, Result<ArticlePost>> threadMap,
      required final Map<String, Result<List<ArticlePost>>> regardingPostsMap})
      : _threadMap = threadMap,
        _regardingPostsMap = regardingPostsMap;

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final String boardId;
  @override
  final String threadId;
  final Map<String, Result<ArticlePost>> _threadMap;
  @override
  Map<String, Result<ArticlePost>> get threadMap {
    if (_threadMap is EqualUnmodifiableMapView) return _threadMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_threadMap);
  }

  final Map<String, Result<List<ArticlePost>>> _regardingPostsMap;
  @override
  Map<String, Result<List<ArticlePost>>> get regardingPostsMap {
    if (_regardingPostsMap is EqualUnmodifiableMapView)
      return _regardingPostsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_regardingPostsMap);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadDetailState(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, threadId: $threadId, threadMap: $threadMap, regardingPostsMap: $regardingPostsMap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadDetailState'))
      ..add(DiagnosticsProperty('extensionPkgName', extensionPkgName))
      ..add(DiagnosticsProperty('siteId', siteId))
      ..add(DiagnosticsProperty('boardId', boardId))
      ..add(DiagnosticsProperty('threadId', threadId))
      ..add(DiagnosticsProperty('threadMap', threadMap))
      ..add(DiagnosticsProperty('regardingPostsMap', regardingPostsMap));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadDetailStateImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            const DeepCollectionEquality()
                .equals(other._threadMap, _threadMap) &&
            const DeepCollectionEquality()
                .equals(other._regardingPostsMap, _regardingPostsMap));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      extensionPkgName,
      siteId,
      boardId,
      threadId,
      const DeepCollectionEquality().hash(_threadMap),
      const DeepCollectionEquality().hash(_regardingPostsMap));

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadDetailStateImplCopyWith<_$ThreadDetailStateImpl> get copyWith =>
      __$$ThreadDetailStateImplCopyWithImpl<_$ThreadDetailStateImpl>(
          this, _$identity);
}

abstract class _ThreadDetailState implements ThreadDetailState {
  const factory _ThreadDetailState(
      {required final String extensionPkgName,
      required final String siteId,
      required final String boardId,
      required final String threadId,
      required final Map<String, Result<ArticlePost>> threadMap,
      required final Map<String, Result<List<ArticlePost>>>
          regardingPostsMap}) = _$ThreadDetailStateImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  Map<String, Result<ArticlePost>> get threadMap;
  @override
  Map<String, Result<List<ArticlePost>>> get regardingPostsMap;

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadDetailStateImplCopyWith<_$ThreadDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
