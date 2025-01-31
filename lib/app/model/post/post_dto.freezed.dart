// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PostDto _$PostDtoFromJson(Map<String, dynamic> json) {
  return _PostDto.fromJson(json);
}

/// @nodoc
mixin _$PostDto {
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_id', required: true)
  String get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_id', required: true)
  String get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'thread_id', required: true)
  String get threadId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', required: true)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'master_id', required: true)
  String? get masterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String? get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at', required: true)
  int get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_name', required: true)
  String get posterName => throw _privateConstructorUsedError;
  @JsonKey(name: 'poster_id', required: true)
  String get posterId => throw _privateConstructorUsedError;
  @JsonKey(name: 'like', required: true)
  int get like => throw _privateConstructorUsedError;
  @JsonKey(name: 'dislike', required: true)
  int get dislike => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments', required: true)
  int get comments => throw _privateConstructorUsedError;
  @JsonKey(name: 'contents', required: true)
  List<ParagraphDto> get contents => throw _privateConstructorUsedError;

  /// Serializes this PostDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostDtoCopyWith<PostDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDtoCopyWith<$Res> {
  factory $PostDtoCopyWith(PostDto value, $Res Function(PostDto) then) =
      _$PostDtoCopyWithImpl<$Res, PostDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) String siteId,
      @JsonKey(name: 'board_id', required: true) String boardId,
      @JsonKey(name: 'thread_id', required: true) String threadId,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'master_id', required: true) String? masterId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'created_at', required: true) int createdAt,
      @JsonKey(name: 'poster_name', required: true) String posterName,
      @JsonKey(name: 'poster_id', required: true) String posterId,
      @JsonKey(name: 'like', required: true) int like,
      @JsonKey(name: 'dislike', required: true) int dislike,
      @JsonKey(name: 'comments', required: true) int comments,
      @JsonKey(name: 'contents', required: true) List<ParagraphDto> contents});
}

/// @nodoc
class _$PostDtoCopyWithImpl<$Res, $Val extends PostDto>
    implements $PostDtoCopyWith<$Res> {
  _$PostDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? id = null,
    Object? masterId = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? createdAt = null,
    Object? posterName = null,
    Object? posterId = null,
    Object? like = null,
    Object? dislike = null,
    Object? comments = null,
    Object? contents = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      posterName: null == posterName
          ? _value.posterName
          : posterName // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      dislike: null == dislike
          ? _value.dislike
          : dislike // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ParagraphDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostDtoImplCopyWith<$Res> implements $PostDtoCopyWith<$Res> {
  factory _$$PostDtoImplCopyWith(
          _$PostDtoImpl value, $Res Function(_$PostDtoImpl) then) =
      __$$PostDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) String siteId,
      @JsonKey(name: 'board_id', required: true) String boardId,
      @JsonKey(name: 'thread_id', required: true) String threadId,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'master_id', required: true) String? masterId,
      @JsonKey(name: 'title') String? title,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'created_at', required: true) int createdAt,
      @JsonKey(name: 'poster_name', required: true) String posterName,
      @JsonKey(name: 'poster_id', required: true) String posterId,
      @JsonKey(name: 'like', required: true) int like,
      @JsonKey(name: 'dislike', required: true) int dislike,
      @JsonKey(name: 'comments', required: true) int comments,
      @JsonKey(name: 'contents', required: true) List<ParagraphDto> contents});
}

/// @nodoc
class __$$PostDtoImplCopyWithImpl<$Res>
    extends _$PostDtoCopyWithImpl<$Res, _$PostDtoImpl>
    implements _$$PostDtoImplCopyWith<$Res> {
  __$$PostDtoImplCopyWithImpl(
      _$PostDtoImpl _value, $Res Function(_$PostDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? id = null,
    Object? masterId = freezed,
    Object? title = freezed,
    Object? url = freezed,
    Object? createdAt = null,
    Object? posterName = null,
    Object? posterId = null,
    Object? like = null,
    Object? dislike = null,
    Object? comments = null,
    Object? contents = null,
  }) {
    return _then(_$PostDtoImpl(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      masterId: freezed == masterId
          ? _value.masterId
          : masterId // ignore: cast_nullable_to_non_nullable
              as String?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int,
      posterName: null == posterName
          ? _value.posterName
          : posterName // ignore: cast_nullable_to_non_nullable
              as String,
      posterId: null == posterId
          ? _value.posterId
          : posterId // ignore: cast_nullable_to_non_nullable
              as String,
      like: null == like
          ? _value.like
          : like // ignore: cast_nullable_to_non_nullable
              as int,
      dislike: null == dislike
          ? _value.dislike
          : dislike // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as int,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ParagraphDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostDtoImpl implements _PostDto {
  const _$PostDtoImpl(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required this.extensionPkgName,
      @JsonKey(name: 'site_id', required: true) required this.siteId,
      @JsonKey(name: 'board_id', required: true) required this.boardId,
      @JsonKey(name: 'thread_id', required: true) required this.threadId,
      @JsonKey(name: 'id', required: true) required this.id,
      @JsonKey(name: 'master_id', required: true) required this.masterId,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'created_at', required: true) required this.createdAt,
      @JsonKey(name: 'poster_name', required: true) required this.posterName,
      @JsonKey(name: 'poster_id', required: true) required this.posterId,
      @JsonKey(name: 'like', required: true) required this.like,
      @JsonKey(name: 'dislike', required: true) required this.dislike,
      @JsonKey(name: 'comments', required: true) required this.comments,
      @JsonKey(name: 'contents', required: true)
      required final List<ParagraphDto> contents})
      : _contents = contents;

  factory _$PostDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostDtoImplFromJson(json);

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  final String extensionPkgName;
  @override
  @JsonKey(name: 'site_id', required: true)
  final String siteId;
  @override
  @JsonKey(name: 'board_id', required: true)
  final String boardId;
  @override
  @JsonKey(name: 'thread_id', required: true)
  final String threadId;
  @override
  @JsonKey(name: 'id', required: true)
  final String id;
  @override
  @JsonKey(name: 'master_id', required: true)
  final String? masterId;
  @override
  @JsonKey(name: 'title')
  final String? title;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'created_at', required: true)
  final int createdAt;
  @override
  @JsonKey(name: 'poster_name', required: true)
  final String posterName;
  @override
  @JsonKey(name: 'poster_id', required: true)
  final String posterId;
  @override
  @JsonKey(name: 'like', required: true)
  final int like;
  @override
  @JsonKey(name: 'dislike', required: true)
  final int dislike;
  @override
  @JsonKey(name: 'comments', required: true)
  final int comments;
  final List<ParagraphDto> _contents;
  @override
  @JsonKey(name: 'contents', required: true)
  List<ParagraphDto> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  String toString() {
    return 'PostDto(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, threadId: $threadId, id: $id, masterId: $masterId, title: $title, url: $url, createdAt: $createdAt, posterName: $posterName, posterId: $posterId, like: $like, dislike: $dislike, comments: $comments, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostDtoImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.masterId, masterId) ||
                other.masterId == masterId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.posterName, posterName) ||
                other.posterName == posterName) &&
            (identical(other.posterId, posterId) ||
                other.posterId == posterId) &&
            (identical(other.like, like) || other.like == like) &&
            (identical(other.dislike, dislike) || other.dislike == dislike) &&
            (identical(other.comments, comments) ||
                other.comments == comments) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      extensionPkgName,
      siteId,
      boardId,
      threadId,
      id,
      masterId,
      title,
      url,
      createdAt,
      posterName,
      posterId,
      like,
      dislike,
      comments,
      const DeepCollectionEquality().hash(_contents));

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostDtoImplCopyWith<_$PostDtoImpl> get copyWith =>
      __$$PostDtoImplCopyWithImpl<_$PostDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostDtoImplToJson(
      this,
    );
  }
}

abstract class _PostDto implements PostDto {
  const factory _PostDto(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required final String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) required final String siteId,
      @JsonKey(name: 'board_id', required: true) required final String boardId,
      @JsonKey(name: 'thread_id', required: true)
      required final String threadId,
      @JsonKey(name: 'id', required: true) required final String id,
      @JsonKey(name: 'master_id', required: true)
      required final String? masterId,
      @JsonKey(name: 'title') required final String? title,
      @JsonKey(name: 'url') required final String? url,
      @JsonKey(name: 'created_at', required: true) required final int createdAt,
      @JsonKey(name: 'poster_name', required: true)
      required final String posterName,
      @JsonKey(name: 'poster_id', required: true)
      required final String posterId,
      @JsonKey(name: 'like', required: true) required final int like,
      @JsonKey(name: 'dislike', required: true) required final int dislike,
      @JsonKey(name: 'comments', required: true) required final int comments,
      @JsonKey(name: 'contents', required: true)
      required final List<ParagraphDto> contents}) = _$PostDtoImpl;

  factory _PostDto.fromJson(Map<String, dynamic> json) = _$PostDtoImpl.fromJson;

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName;
  @override
  @JsonKey(name: 'site_id', required: true)
  String get siteId;
  @override
  @JsonKey(name: 'board_id', required: true)
  String get boardId;
  @override
  @JsonKey(name: 'thread_id', required: true)
  String get threadId;
  @override
  @JsonKey(name: 'id', required: true)
  String get id;
  @override
  @JsonKey(name: 'master_id', required: true)
  String? get masterId;
  @override
  @JsonKey(name: 'title')
  String? get title;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'created_at', required: true)
  int get createdAt;
  @override
  @JsonKey(name: 'poster_name', required: true)
  String get posterName;
  @override
  @JsonKey(name: 'poster_id', required: true)
  String get posterId;
  @override
  @JsonKey(name: 'like', required: true)
  int get like;
  @override
  @JsonKey(name: 'dislike', required: true)
  int get dislike;
  @override
  @JsonKey(name: 'comments', required: true)
  int get comments;
  @override
  @JsonKey(name: 'contents', required: true)
  List<ParagraphDto> get contents;

  /// Create a copy of PostDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostDtoImplCopyWith<_$PostDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
