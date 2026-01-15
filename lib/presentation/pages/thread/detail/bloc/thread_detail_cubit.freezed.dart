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
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$ThreadDetailState {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  Map<String, Result<ArticlePostWithExtension>> get threadMap =>
      throw _privateConstructorUsedError;
  Map<String, Result<List<ArticlePostWithExtension>>> get repliesMap =>
      throw _privateConstructorUsedError;
  Map<String, Result<List<Comment>>> get commentsMap =>
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
    ThreadDetailState value,
    $Res Function(ThreadDetailState) then,
  ) = _$ThreadDetailStateCopyWithImpl<$Res, ThreadDetailState>;
  @useResult
  $Res call({
    String extensionPkgName,
    String boardId,
    String threadId,
    Map<String, Result<ArticlePostWithExtension>> threadMap,
    Map<String, Result<List<ArticlePostWithExtension>>> repliesMap,
    Map<String, Result<List<Comment>>> commentsMap,
  });
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
    Object? boardId = null,
    Object? threadId = null,
    Object? threadMap = null,
    Object? repliesMap = null,
    Object? commentsMap = null,
  }) {
    return _then(
      _value.copyWith(
            extensionPkgName: null == extensionPkgName
                ? _value.extensionPkgName
                : extensionPkgName // ignore: cast_nullable_to_non_nullable
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
                      as Map<String, Result<ArticlePostWithExtension>>,
            repliesMap: null == repliesMap
                ? _value.repliesMap
                : repliesMap // ignore: cast_nullable_to_non_nullable
                      as Map<String, Result<List<ArticlePostWithExtension>>>,
            commentsMap: null == commentsMap
                ? _value.commentsMap
                : commentsMap // ignore: cast_nullable_to_non_nullable
                      as Map<String, Result<List<Comment>>>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ThreadDetailStateImplCopyWith<$Res>
    implements $ThreadDetailStateCopyWith<$Res> {
  factory _$$ThreadDetailStateImplCopyWith(
    _$ThreadDetailStateImpl value,
    $Res Function(_$ThreadDetailStateImpl) then,
  ) = __$$ThreadDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String extensionPkgName,
    String boardId,
    String threadId,
    Map<String, Result<ArticlePostWithExtension>> threadMap,
    Map<String, Result<List<ArticlePostWithExtension>>> repliesMap,
    Map<String, Result<List<Comment>>> commentsMap,
  });
}

/// @nodoc
class __$$ThreadDetailStateImplCopyWithImpl<$Res>
    extends _$ThreadDetailStateCopyWithImpl<$Res, _$ThreadDetailStateImpl>
    implements _$$ThreadDetailStateImplCopyWith<$Res> {
  __$$ThreadDetailStateImplCopyWithImpl(
    _$ThreadDetailStateImpl _value,
    $Res Function(_$ThreadDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? threadMap = null,
    Object? repliesMap = null,
    Object? commentsMap = null,
  }) {
    return _then(
      _$ThreadDetailStateImpl(
        extensionPkgName: null == extensionPkgName
            ? _value.extensionPkgName
            : extensionPkgName // ignore: cast_nullable_to_non_nullable
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
                  as Map<String, Result<ArticlePostWithExtension>>,
        repliesMap: null == repliesMap
            ? _value._repliesMap
            : repliesMap // ignore: cast_nullable_to_non_nullable
                  as Map<String, Result<List<ArticlePostWithExtension>>>,
        commentsMap: null == commentsMap
            ? _value._commentsMap
            : commentsMap // ignore: cast_nullable_to_non_nullable
                  as Map<String, Result<List<Comment>>>,
      ),
    );
  }
}

/// @nodoc

class _$ThreadDetailStateImpl
    with DiagnosticableTreeMixin
    implements _ThreadDetailState {
  const _$ThreadDetailStateImpl({
    required this.extensionPkgName,
    required this.boardId,
    required this.threadId,
    required final Map<String, Result<ArticlePostWithExtension>> threadMap,
    required final Map<String, Result<List<ArticlePostWithExtension>>>
    repliesMap,
    final Map<String, Result<List<Comment>>> commentsMap = const {},
  }) : _threadMap = threadMap,
       _repliesMap = repliesMap,
       _commentsMap = commentsMap;

  @override
  final String extensionPkgName;
  @override
  final String boardId;
  @override
  final String threadId;
  final Map<String, Result<ArticlePostWithExtension>> _threadMap;
  @override
  Map<String, Result<ArticlePostWithExtension>> get threadMap {
    if (_threadMap is EqualUnmodifiableMapView) return _threadMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_threadMap);
  }

  final Map<String, Result<List<ArticlePostWithExtension>>> _repliesMap;
  @override
  Map<String, Result<List<ArticlePostWithExtension>>> get repliesMap {
    if (_repliesMap is EqualUnmodifiableMapView) return _repliesMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_repliesMap);
  }

  final Map<String, Result<List<Comment>>> _commentsMap;
  @override
  @JsonKey()
  Map<String, Result<List<Comment>>> get commentsMap {
    if (_commentsMap is EqualUnmodifiableMapView) return _commentsMap;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_commentsMap);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadDetailState(extensionPkgName: $extensionPkgName, boardId: $boardId, threadId: $threadId, threadMap: $threadMap, repliesMap: $repliesMap, commentsMap: $commentsMap)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadDetailState'))
      ..add(DiagnosticsProperty('extensionPkgName', extensionPkgName))
      ..add(DiagnosticsProperty('boardId', boardId))
      ..add(DiagnosticsProperty('threadId', threadId))
      ..add(DiagnosticsProperty('threadMap', threadMap))
      ..add(DiagnosticsProperty('repliesMap', repliesMap))
      ..add(DiagnosticsProperty('commentsMap', commentsMap));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadDetailStateImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            const DeepCollectionEquality().equals(
              other._threadMap,
              _threadMap,
            ) &&
            const DeepCollectionEquality().equals(
              other._repliesMap,
              _repliesMap,
            ) &&
            const DeepCollectionEquality().equals(
              other._commentsMap,
              _commentsMap,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    extensionPkgName,
    boardId,
    threadId,
    const DeepCollectionEquality().hash(_threadMap),
    const DeepCollectionEquality().hash(_repliesMap),
    const DeepCollectionEquality().hash(_commentsMap),
  );

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadDetailStateImplCopyWith<_$ThreadDetailStateImpl> get copyWith =>
      __$$ThreadDetailStateImplCopyWithImpl<_$ThreadDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _ThreadDetailState implements ThreadDetailState {
  const factory _ThreadDetailState({
    required final String extensionPkgName,
    required final String boardId,
    required final String threadId,
    required final Map<String, Result<ArticlePostWithExtension>> threadMap,
    required final Map<String, Result<List<ArticlePostWithExtension>>>
    repliesMap,
    final Map<String, Result<List<Comment>>> commentsMap,
  }) = _$ThreadDetailStateImpl;

  @override
  String get extensionPkgName;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  Map<String, Result<ArticlePostWithExtension>> get threadMap;
  @override
  Map<String, Result<List<ArticlePostWithExtension>>> get repliesMap;
  @override
  Map<String, Result<List<Comment>>> get commentsMap;

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadDetailStateImplCopyWith<_$ThreadDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
