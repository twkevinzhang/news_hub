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
  Result<Post> get thread => throw _privateConstructorUsedError;

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
      Result<Post> thread});

  $ResultCopyWith<Post, $Res> get thread;
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
    Object? thread = null,
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
      thread: null == thread
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as Result<Post>,
    ) as $Val);
  }

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<Post, $Res> get thread {
    return $ResultCopyWith<Post, $Res>(_value.thread, (value) {
      return _then(_value.copyWith(thread: value) as $Val);
    });
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
      Result<Post> thread});

  @override
  $ResultCopyWith<Post, $Res> get thread;
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
    Object? thread = null,
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
      thread: null == thread
          ? _value.thread
          : thread // ignore: cast_nullable_to_non_nullable
              as Result<Post>,
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
      required this.thread});

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final String boardId;
  @override
  final String threadId;
  @override
  final Result<Post> thread;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadDetailState(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, threadId: $threadId, thread: $thread)';
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
      ..add(DiagnosticsProperty('thread', thread));
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
            (identical(other.thread, thread) || other.thread == thread));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, extensionPkgName, siteId, boardId, threadId, thread);

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
      required final Result<Post> thread}) = _$ThreadDetailStateImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  Result<Post> get thread;

  /// Create a copy of ThreadDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadDetailStateImplCopyWith<_$ThreadDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
