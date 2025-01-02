// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'index.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CommentsDto _$CommentsDtoFromJson(Map<String, dynamic> json) {
  return _CommentsDto.fromJson(json);
}

/// @nodoc
mixin _$CommentsDto {
  @JsonKey(name: 'total_page', required: true)
  int get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', required: true)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'comments', required: true)
  List<CommentDto> get comments => throw _privateConstructorUsedError;

  /// Serializes this CommentsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentsDtoCopyWith<CommentsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentsDtoCopyWith<$Res> {
  factory $CommentsDtoCopyWith(
          CommentsDto value, $Res Function(CommentsDto) then) =
      _$CommentsDtoCopyWithImpl<$Res, CommentsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) int currentPage,
      @JsonKey(name: 'comments', required: true) List<CommentDto> comments});
}

/// @nodoc
class _$CommentsDtoCopyWithImpl<$Res, $Val extends CommentsDto>
    implements $CommentsDtoCopyWith<$Res> {
  _$CommentsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? comments = null,
  }) {
    return _then(_value.copyWith(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentsDtoImplCopyWith<$Res>
    implements $CommentsDtoCopyWith<$Res> {
  factory _$$CommentsDtoImplCopyWith(
          _$CommentsDtoImpl value, $Res Function(_$CommentsDtoImpl) then) =
      __$$CommentsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) int currentPage,
      @JsonKey(name: 'comments', required: true) List<CommentDto> comments});
}

/// @nodoc
class __$$CommentsDtoImplCopyWithImpl<$Res>
    extends _$CommentsDtoCopyWithImpl<$Res, _$CommentsDtoImpl>
    implements _$$CommentsDtoImplCopyWith<$Res> {
  __$$CommentsDtoImplCopyWithImpl(
      _$CommentsDtoImpl _value, $Res Function(_$CommentsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? comments = null,
  }) {
    return _then(_$CommentsDtoImpl(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      comments: null == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<CommentDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentsDtoImpl implements _CommentsDto {
  const _$CommentsDtoImpl(
      {@JsonKey(name: 'total_page', required: true) required this.totalPage,
      @JsonKey(name: 'current_page', required: true) required this.currentPage,
      @JsonKey(name: 'comments', required: true)
      required final List<CommentDto> comments})
      : _comments = comments;

  factory _$CommentsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'total_page', required: true)
  final int totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  final int currentPage;
  final List<CommentDto> _comments;
  @override
  @JsonKey(name: 'comments', required: true)
  List<CommentDto> get comments {
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_comments);
  }

  @override
  String toString() {
    return 'CommentsDto(totalPage: $totalPage, currentPage: $currentPage, comments: $comments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentsDtoImpl &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._comments, _comments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalPage, currentPage,
      const DeepCollectionEquality().hash(_comments));

  /// Create a copy of CommentsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentsDtoImplCopyWith<_$CommentsDtoImpl> get copyWith =>
      __$$CommentsDtoImplCopyWithImpl<_$CommentsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentsDtoImplToJson(
      this,
    );
  }
}

abstract class _CommentsDto implements CommentsDto {
  const factory _CommentsDto(
      {@JsonKey(name: 'total_page', required: true)
      required final int totalPage,
      @JsonKey(name: 'current_page', required: true)
      required final int currentPage,
      @JsonKey(name: 'comments', required: true)
      required final List<CommentDto> comments}) = _$CommentsDtoImpl;

  factory _CommentsDto.fromJson(Map<String, dynamic> json) =
      _$CommentsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'total_page', required: true)
  int get totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  int get currentPage;
  @override
  @JsonKey(name: 'comments', required: true)
  List<CommentDto> get comments;

  /// Create a copy of CommentsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentsDtoImplCopyWith<_$CommentsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) {
  return _CommentDto.fromJson(json);
}

/// @nodoc
mixin _$CommentDto {
  @JsonKey(name: 'id', required: true)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'contents', required: true)
  List<ParagraphDto> get contents => throw _privateConstructorUsedError;

  /// Serializes this CommentDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentDtoCopyWith<CommentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentDtoCopyWith<$Res> {
  factory $CommentDtoCopyWith(
          CommentDto value, $Res Function(CommentDto) then) =
      _$CommentDtoCopyWithImpl<$Res, CommentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'contents', required: true) List<ParagraphDto> contents});
}

/// @nodoc
class _$CommentDtoCopyWithImpl<$Res, $Val extends CommentDto>
    implements $CommentDtoCopyWith<$Res> {
  _$CommentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contents = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value.contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ParagraphDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommentDtoImplCopyWith<$Res>
    implements $CommentDtoCopyWith<$Res> {
  factory _$$CommentDtoImplCopyWith(
          _$CommentDtoImpl value, $Res Function(_$CommentDtoImpl) then) =
      __$$CommentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'contents', required: true) List<ParagraphDto> contents});
}

/// @nodoc
class __$$CommentDtoImplCopyWithImpl<$Res>
    extends _$CommentDtoCopyWithImpl<$Res, _$CommentDtoImpl>
    implements _$$CommentDtoImplCopyWith<$Res> {
  __$$CommentDtoImplCopyWithImpl(
      _$CommentDtoImpl _value, $Res Function(_$CommentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? contents = null,
  }) {
    return _then(_$CommentDtoImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      contents: null == contents
          ? _value._contents
          : contents // ignore: cast_nullable_to_non_nullable
              as List<ParagraphDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommentDtoImpl implements _CommentDto {
  const _$CommentDtoImpl(
      {@JsonKey(name: 'id', required: true) required this.id,
      @JsonKey(name: 'contents', required: true)
      required final List<ParagraphDto> contents})
      : _contents = contents;

  factory _$CommentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'id', required: true)
  final String id;
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
    return 'CommentDto(id: $id, contents: $contents)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentDtoImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._contents, _contents));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(_contents));

  /// Create a copy of CommentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentDtoImplCopyWith<_$CommentDtoImpl> get copyWith =>
      __$$CommentDtoImplCopyWithImpl<_$CommentDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentDtoImplToJson(
      this,
    );
  }
}

abstract class _CommentDto implements CommentDto {
  const factory _CommentDto(
      {@JsonKey(name: 'id', required: true) required final String id,
      @JsonKey(name: 'contents', required: true)
      required final List<ParagraphDto> contents}) = _$CommentDtoImpl;

  factory _CommentDto.fromJson(Map<String, dynamic> json) =
      _$CommentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'id', required: true)
  String get id;
  @override
  @JsonKey(name: 'contents', required: true)
  List<ParagraphDto> get contents;

  /// Create a copy of CommentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentDtoImplCopyWith<_$CommentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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

SiteDto _$SiteDtoFromJson(Map<String, dynamic> json) {
  return _SiteDto.fromJson(json);
}

/// @nodoc
mixin _$SiteDto {
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', required: true)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', required: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon', required: true)
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', required: true)
  String get url => throw _privateConstructorUsedError;

  /// Serializes this SiteDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SiteDtoCopyWith<SiteDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SiteDtoCopyWith<$Res> {
  factory $SiteDtoCopyWith(SiteDto value, $Res Function(SiteDto) then) =
      _$SiteDtoCopyWithImpl<$Res, SiteDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'url', required: true) String url});
}

/// @nodoc
class _$SiteDtoCopyWithImpl<$Res, $Val extends SiteDto>
    implements $SiteDtoCopyWith<$Res> {
  _$SiteDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SiteDtoImplCopyWith<$Res> implements $SiteDtoCopyWith<$Res> {
  factory _$$SiteDtoImplCopyWith(
          _$SiteDtoImpl value, $Res Function(_$SiteDtoImpl) then) =
      __$$SiteDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'url', required: true) String url});
}

/// @nodoc
class __$$SiteDtoImplCopyWithImpl<$Res>
    extends _$SiteDtoCopyWithImpl<$Res, _$SiteDtoImpl>
    implements _$$SiteDtoImplCopyWith<$Res> {
  __$$SiteDtoImplCopyWithImpl(
      _$SiteDtoImpl _value, $Res Function(_$SiteDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? url = null,
  }) {
    return _then(_$SiteDtoImpl(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SiteDtoImpl implements _SiteDto {
  const _$SiteDtoImpl(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required this.extensionPkgName,
      @JsonKey(name: 'id', required: true) required this.id,
      @JsonKey(name: 'name', required: true) required this.name,
      @JsonKey(name: 'icon', required: true) required this.icon,
      @JsonKey(name: 'url', required: true) required this.url});

  factory _$SiteDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SiteDtoImplFromJson(json);

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  final String extensionPkgName;
  @override
  @JsonKey(name: 'id', required: true)
  final String id;
  @override
  @JsonKey(name: 'name', required: true)
  final String name;
  @override
  @JsonKey(name: 'icon', required: true)
  final String icon;
  @override
  @JsonKey(name: 'url', required: true)
  final String url;

  @override
  String toString() {
    return 'SiteDto(extensionPkgName: $extensionPkgName, id: $id, name: $name, icon: $icon, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SiteDtoImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extensionPkgName, id, name, icon, url);

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SiteDtoImplCopyWith<_$SiteDtoImpl> get copyWith =>
      __$$SiteDtoImplCopyWithImpl<_$SiteDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SiteDtoImplToJson(
      this,
    );
  }
}

abstract class _SiteDto implements SiteDto {
  const factory _SiteDto(
          {@JsonKey(name: 'extension_pkg_name', required: true)
          required final String extensionPkgName,
          @JsonKey(name: 'id', required: true) required final String id,
          @JsonKey(name: 'name', required: true) required final String name,
          @JsonKey(name: 'icon', required: true) required final String icon,
          @JsonKey(name: 'url', required: true) required final String url}) =
      _$SiteDtoImpl;

  factory _SiteDto.fromJson(Map<String, dynamic> json) = _$SiteDtoImpl.fromJson;

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName;
  @override
  @JsonKey(name: 'id', required: true)
  String get id;
  @override
  @JsonKey(name: 'name', required: true)
  String get name;
  @override
  @JsonKey(name: 'icon', required: true)
  String get icon;
  @override
  @JsonKey(name: 'url', required: true)
  String get url;

  /// Create a copy of SiteDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SiteDtoImplCopyWith<_$SiteDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThreadsDto _$ThreadsDtoFromJson(Map<String, dynamic> json) {
  return _ThreadsDto.fromJson(json);
}

/// @nodoc
mixin _$ThreadsDto {
  @JsonKey(name: 'total_page', required: true)
  int get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', required: true)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'threads', required: true)
  List<ThreadDto> get threads => throw _privateConstructorUsedError;

  /// Serializes this ThreadsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreadsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadsDtoCopyWith<ThreadsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadsDtoCopyWith<$Res> {
  factory $ThreadsDtoCopyWith(
          ThreadsDto value, $Res Function(ThreadsDto) then) =
      _$ThreadsDtoCopyWithImpl<$Res, ThreadsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) int currentPage,
      @JsonKey(name: 'threads', required: true) List<ThreadDto> threads});
}

/// @nodoc
class _$ThreadsDtoCopyWithImpl<$Res, $Val extends ThreadsDto>
    implements $ThreadsDtoCopyWith<$Res> {
  _$ThreadsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? threads = null,
  }) {
    return _then(_value.copyWith(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      threads: null == threads
          ? _value.threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ThreadDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadsDtoImplCopyWith<$Res>
    implements $ThreadsDtoCopyWith<$Res> {
  factory _$$ThreadsDtoImplCopyWith(
          _$ThreadsDtoImpl value, $Res Function(_$ThreadsDtoImpl) then) =
      __$$ThreadsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) int currentPage,
      @JsonKey(name: 'threads', required: true) List<ThreadDto> threads});
}

/// @nodoc
class __$$ThreadsDtoImplCopyWithImpl<$Res>
    extends _$ThreadsDtoCopyWithImpl<$Res, _$ThreadsDtoImpl>
    implements _$$ThreadsDtoImplCopyWith<$Res> {
  __$$ThreadsDtoImplCopyWithImpl(
      _$ThreadsDtoImpl _value, $Res Function(_$ThreadsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? threads = null,
  }) {
    return _then(_$ThreadsDtoImpl(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      threads: null == threads
          ? _value._threads
          : threads // ignore: cast_nullable_to_non_nullable
              as List<ThreadDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreadsDtoImpl implements _ThreadsDto {
  const _$ThreadsDtoImpl(
      {@JsonKey(name: 'total_page', required: true) required this.totalPage,
      @JsonKey(name: 'current_page', required: true) required this.currentPage,
      @JsonKey(name: 'threads', required: true)
      required final List<ThreadDto> threads})
      : _threads = threads;

  factory _$ThreadsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'total_page', required: true)
  final int totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  final int currentPage;
  final List<ThreadDto> _threads;
  @override
  @JsonKey(name: 'threads', required: true)
  List<ThreadDto> get threads {
    if (_threads is EqualUnmodifiableListView) return _threads;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_threads);
  }

  @override
  String toString() {
    return 'ThreadsDto(totalPage: $totalPage, currentPage: $currentPage, threads: $threads)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsDtoImpl &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._threads, _threads));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalPage, currentPage,
      const DeepCollectionEquality().hash(_threads));

  /// Create a copy of ThreadsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadsDtoImplCopyWith<_$ThreadsDtoImpl> get copyWith =>
      __$$ThreadsDtoImplCopyWithImpl<_$ThreadsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadsDtoImplToJson(
      this,
    );
  }
}

abstract class _ThreadsDto implements ThreadsDto {
  const factory _ThreadsDto(
      {@JsonKey(name: 'total_page', required: true)
      required final int totalPage,
      @JsonKey(name: 'current_page', required: true)
      required final int currentPage,
      @JsonKey(name: 'threads', required: true)
      required final List<ThreadDto> threads}) = _$ThreadsDtoImpl;

  factory _ThreadsDto.fromJson(Map<String, dynamic> json) =
      _$ThreadsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'total_page', required: true)
  int get totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  int get currentPage;
  @override
  @JsonKey(name: 'threads', required: true)
  List<ThreadDto> get threads;

  /// Create a copy of ThreadsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadsDtoImplCopyWith<_$ThreadsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ThreadDto _$ThreadDtoFromJson(Map<String, dynamic> json) {
  return _ThreadDto.fromJson(json);
}

/// @nodoc
mixin _$ThreadDto {
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_id', required: true)
  String get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'board_id', required: true)
  String get boardId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', required: true)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', required: true)
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'master_post', required: true)
  PostDto get masterPost => throw _privateConstructorUsedError;

  /// Serializes this ThreadDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadDtoCopyWith<ThreadDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadDtoCopyWith<$Res> {
  factory $ThreadDtoCopyWith(ThreadDto value, $Res Function(ThreadDto) then) =
      _$ThreadDtoCopyWithImpl<$Res, ThreadDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) String siteId,
      @JsonKey(name: 'board_id', required: true) String boardId,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'url', required: true) String url,
      @JsonKey(name: 'master_post', required: true) PostDto masterPost});

  $PostDtoCopyWith<$Res> get masterPost;
}

/// @nodoc
class _$ThreadDtoCopyWithImpl<$Res, $Val extends ThreadDto>
    implements $ThreadDtoCopyWith<$Res> {
  _$ThreadDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? id = null,
    Object? url = null,
    Object? masterPost = null,
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      masterPost: null == masterPost
          ? _value.masterPost
          : masterPost // ignore: cast_nullable_to_non_nullable
              as PostDto,
    ) as $Val);
  }

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PostDtoCopyWith<$Res> get masterPost {
    return $PostDtoCopyWith<$Res>(_value.masterPost, (value) {
      return _then(_value.copyWith(masterPost: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ThreadDtoImplCopyWith<$Res>
    implements $ThreadDtoCopyWith<$Res> {
  factory _$$ThreadDtoImplCopyWith(
          _$ThreadDtoImpl value, $Res Function(_$ThreadDtoImpl) then) =
      __$$ThreadDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) String siteId,
      @JsonKey(name: 'board_id', required: true) String boardId,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'url', required: true) String url,
      @JsonKey(name: 'master_post', required: true) PostDto masterPost});

  @override
  $PostDtoCopyWith<$Res> get masterPost;
}

/// @nodoc
class __$$ThreadDtoImplCopyWithImpl<$Res>
    extends _$ThreadDtoCopyWithImpl<$Res, _$ThreadDtoImpl>
    implements _$$ThreadDtoImplCopyWith<$Res> {
  __$$ThreadDtoImplCopyWithImpl(
      _$ThreadDtoImpl _value, $Res Function(_$ThreadDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? id = null,
    Object? url = null,
    Object? masterPost = null,
  }) {
    return _then(_$ThreadDtoImpl(
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
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      masterPost: null == masterPost
          ? _value.masterPost
          : masterPost // ignore: cast_nullable_to_non_nullable
              as PostDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ThreadDtoImpl implements _ThreadDto {
  const _$ThreadDtoImpl(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required this.extensionPkgName,
      @JsonKey(name: 'site_id', required: true) required this.siteId,
      @JsonKey(name: 'board_id', required: true) required this.boardId,
      @JsonKey(name: 'id', required: true) required this.id,
      @JsonKey(name: 'url', required: true) required this.url,
      @JsonKey(name: 'master_post', required: true) required this.masterPost});

  factory _$ThreadDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ThreadDtoImplFromJson(json);

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
  @JsonKey(name: 'id', required: true)
  final String id;
  @override
  @JsonKey(name: 'url', required: true)
  final String url;
  @override
  @JsonKey(name: 'master_post', required: true)
  final PostDto masterPost;

  @override
  String toString() {
    return 'ThreadDto(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, id: $id, url: $url, masterPost: $masterPost)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadDtoImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.masterPost, masterPost) ||
                other.masterPost == masterPost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, extensionPkgName, siteId, boardId, id, url, masterPost);

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadDtoImplCopyWith<_$ThreadDtoImpl> get copyWith =>
      __$$ThreadDtoImplCopyWithImpl<_$ThreadDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadDtoImplToJson(
      this,
    );
  }
}

abstract class _ThreadDto implements ThreadDto {
  const factory _ThreadDto(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required final String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) required final String siteId,
      @JsonKey(name: 'board_id', required: true) required final String boardId,
      @JsonKey(name: 'id', required: true) required final String id,
      @JsonKey(name: 'url', required: true) required final String url,
      @JsonKey(name: 'master_post', required: true)
      required final PostDto masterPost}) = _$ThreadDtoImpl;

  factory _ThreadDto.fromJson(Map<String, dynamic> json) =
      _$ThreadDtoImpl.fromJson;

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
  @JsonKey(name: 'id', required: true)
  String get id;
  @override
  @JsonKey(name: 'url', required: true)
  String get url;
  @override
  @JsonKey(name: 'master_post', required: true)
  PostDto get masterPost;

  /// Create a copy of ThreadDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadDtoImplCopyWith<_$ThreadDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SlavePostsDto _$SlavePostsDtoFromJson(Map<String, dynamic> json) {
  return _SlavePostsDto.fromJson(json);
}

/// @nodoc
mixin _$SlavePostsDto {
  @JsonKey(name: 'total_page', required: true)
  int get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', required: true)
  String get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'slave_posts', required: true)
  List<PostDto> get slavePosts => throw _privateConstructorUsedError;

  /// Serializes this SlavePostsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SlavePostsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SlavePostsDtoCopyWith<SlavePostsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlavePostsDtoCopyWith<$Res> {
  factory $SlavePostsDtoCopyWith(
          SlavePostsDto value, $Res Function(SlavePostsDto) then) =
      _$SlavePostsDtoCopyWithImpl<$Res, SlavePostsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) String currentPage,
      @JsonKey(name: 'slave_posts', required: true) List<PostDto> slavePosts});
}

/// @nodoc
class _$SlavePostsDtoCopyWithImpl<$Res, $Val extends SlavePostsDto>
    implements $SlavePostsDtoCopyWith<$Res> {
  _$SlavePostsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SlavePostsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? slavePosts = null,
  }) {
    return _then(_value.copyWith(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as String,
      slavePosts: null == slavePosts
          ? _value.slavePosts
          : slavePosts // ignore: cast_nullable_to_non_nullable
              as List<PostDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SlavePostsDtoImplCopyWith<$Res>
    implements $SlavePostsDtoCopyWith<$Res> {
  factory _$$SlavePostsDtoImplCopyWith(
          _$SlavePostsDtoImpl value, $Res Function(_$SlavePostsDtoImpl) then) =
      __$$SlavePostsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) String currentPage,
      @JsonKey(name: 'slave_posts', required: true) List<PostDto> slavePosts});
}

/// @nodoc
class __$$SlavePostsDtoImplCopyWithImpl<$Res>
    extends _$SlavePostsDtoCopyWithImpl<$Res, _$SlavePostsDtoImpl>
    implements _$$SlavePostsDtoImplCopyWith<$Res> {
  __$$SlavePostsDtoImplCopyWithImpl(
      _$SlavePostsDtoImpl _value, $Res Function(_$SlavePostsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of SlavePostsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? slavePosts = null,
  }) {
    return _then(_$SlavePostsDtoImpl(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as String,
      slavePosts: null == slavePosts
          ? _value._slavePosts
          : slavePosts // ignore: cast_nullable_to_non_nullable
              as List<PostDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SlavePostsDtoImpl implements _SlavePostsDto {
  const _$SlavePostsDtoImpl(
      {@JsonKey(name: 'total_page', required: true) required this.totalPage,
      @JsonKey(name: 'current_page', required: true) required this.currentPage,
      @JsonKey(name: 'slave_posts', required: true)
      required final List<PostDto> slavePosts})
      : _slavePosts = slavePosts;

  factory _$SlavePostsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$SlavePostsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'total_page', required: true)
  final int totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  final String currentPage;
  final List<PostDto> _slavePosts;
  @override
  @JsonKey(name: 'slave_posts', required: true)
  List<PostDto> get slavePosts {
    if (_slavePosts is EqualUnmodifiableListView) return _slavePosts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_slavePosts);
  }

  @override
  String toString() {
    return 'SlavePostsDto(totalPage: $totalPage, currentPage: $currentPage, slavePosts: $slavePosts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SlavePostsDtoImpl &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality()
                .equals(other._slavePosts, _slavePosts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalPage, currentPage,
      const DeepCollectionEquality().hash(_slavePosts));

  /// Create a copy of SlavePostsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SlavePostsDtoImplCopyWith<_$SlavePostsDtoImpl> get copyWith =>
      __$$SlavePostsDtoImplCopyWithImpl<_$SlavePostsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SlavePostsDtoImplToJson(
      this,
    );
  }
}

abstract class _SlavePostsDto implements SlavePostsDto {
  const factory _SlavePostsDto(
      {@JsonKey(name: 'total_page', required: true)
      required final int totalPage,
      @JsonKey(name: 'current_page', required: true)
      required final String currentPage,
      @JsonKey(name: 'slave_posts', required: true)
      required final List<PostDto> slavePosts}) = _$SlavePostsDtoImpl;

  factory _SlavePostsDto.fromJson(Map<String, dynamic> json) =
      _$SlavePostsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'total_page', required: true)
  int get totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  String get currentPage;
  @override
  @JsonKey(name: 'slave_posts', required: true)
  List<PostDto> get slavePosts;

  /// Create a copy of SlavePostsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SlavePostsDtoImplCopyWith<_$SlavePostsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExtensionRepoResDto _$ExtensionRepoResDtoFromJson(Map<String, dynamic> json) {
  return _ExtensionRepoResDto.fromJson(json);
}

/// @nodoc
mixin _$ExtensionRepoResDto {
  ExtensionRepoDto get meta => throw _privateConstructorUsedError;

  /// Serializes this ExtensionRepoResDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionRepoResDtoCopyWith<ExtensionRepoResDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionRepoResDtoCopyWith<$Res> {
  factory $ExtensionRepoResDtoCopyWith(
          ExtensionRepoResDto value, $Res Function(ExtensionRepoResDto) then) =
      _$ExtensionRepoResDtoCopyWithImpl<$Res, ExtensionRepoResDto>;
  @useResult
  $Res call({ExtensionRepoDto meta});
}

/// @nodoc
class _$ExtensionRepoResDtoCopyWithImpl<$Res, $Val extends ExtensionRepoResDto>
    implements $ExtensionRepoResDtoCopyWith<$Res> {
  _$ExtensionRepoResDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
  }) {
    return _then(_value.copyWith(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ExtensionRepoDto,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExtensionRepoResDtoImplCopyWith<$Res>
    implements $ExtensionRepoResDtoCopyWith<$Res> {
  factory _$$ExtensionRepoResDtoImplCopyWith(_$ExtensionRepoResDtoImpl value,
          $Res Function(_$ExtensionRepoResDtoImpl) then) =
      __$$ExtensionRepoResDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ExtensionRepoDto meta});
}

/// @nodoc
class __$$ExtensionRepoResDtoImplCopyWithImpl<$Res>
    extends _$ExtensionRepoResDtoCopyWithImpl<$Res, _$ExtensionRepoResDtoImpl>
    implements _$$ExtensionRepoResDtoImplCopyWith<$Res> {
  __$$ExtensionRepoResDtoImplCopyWithImpl(_$ExtensionRepoResDtoImpl _value,
      $Res Function(_$ExtensionRepoResDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? meta = null,
  }) {
    return _then(_$ExtensionRepoResDtoImpl(
      meta: null == meta
          ? _value.meta
          : meta // ignore: cast_nullable_to_non_nullable
              as ExtensionRepoDto,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionRepoResDtoImpl implements _ExtensionRepoResDto {
  const _$ExtensionRepoResDtoImpl({required this.meta});

  factory _$ExtensionRepoResDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionRepoResDtoImplFromJson(json);

  @override
  final ExtensionRepoDto meta;

  @override
  String toString() {
    return 'ExtensionRepoResDto(meta: $meta)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionRepoResDtoImpl &&
            (identical(other.meta, meta) || other.meta == meta));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, meta);

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionRepoResDtoImplCopyWith<_$ExtensionRepoResDtoImpl> get copyWith =>
      __$$ExtensionRepoResDtoImplCopyWithImpl<_$ExtensionRepoResDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionRepoResDtoImplToJson(
      this,
    );
  }
}

abstract class _ExtensionRepoResDto implements ExtensionRepoResDto {
  const factory _ExtensionRepoResDto({required final ExtensionRepoDto meta}) =
      _$ExtensionRepoResDtoImpl;

  factory _ExtensionRepoResDto.fromJson(Map<String, dynamic> json) =
      _$ExtensionRepoResDtoImpl.fromJson;

  @override
  ExtensionRepoDto get meta;

  /// Create a copy of ExtensionRepoResDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionRepoResDtoImplCopyWith<_$ExtensionRepoResDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
