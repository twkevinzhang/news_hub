// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'thread_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
  @JsonKey(name: 'last_slave_post_created_at', required: true)
  int get lastSlavePostCreatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'slave_post_count', required: true)
  int get slavePostCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags', required: true)
  List<String> get tags => throw _privateConstructorUsedError;

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
      @JsonKey(name: 'master_post', required: true) PostDto masterPost,
      @JsonKey(name: 'last_slave_post_created_at', required: true)
      int lastSlavePostCreatedAt,
      @JsonKey(name: 'slave_post_count', required: true) int slavePostCount,
      @JsonKey(name: 'tags', required: true) List<String> tags});

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
    Object? lastSlavePostCreatedAt = null,
    Object? slavePostCount = null,
    Object? tags = null,
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
      lastSlavePostCreatedAt: null == lastSlavePostCreatedAt
          ? _value.lastSlavePostCreatedAt
          : lastSlavePostCreatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      slavePostCount: null == slavePostCount
          ? _value.slavePostCount
          : slavePostCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      @JsonKey(name: 'master_post', required: true) PostDto masterPost,
      @JsonKey(name: 'last_slave_post_created_at', required: true)
      int lastSlavePostCreatedAt,
      @JsonKey(name: 'slave_post_count', required: true) int slavePostCount,
      @JsonKey(name: 'tags', required: true) List<String> tags});

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
    Object? lastSlavePostCreatedAt = null,
    Object? slavePostCount = null,
    Object? tags = null,
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
      lastSlavePostCreatedAt: null == lastSlavePostCreatedAt
          ? _value.lastSlavePostCreatedAt
          : lastSlavePostCreatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      slavePostCount: null == slavePostCount
          ? _value.slavePostCount
          : slavePostCount // ignore: cast_nullable_to_non_nullable
              as int,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
      @JsonKey(name: 'master_post', required: true) required this.masterPost,
      @JsonKey(name: 'last_slave_post_created_at', required: true)
      required this.lastSlavePostCreatedAt,
      @JsonKey(name: 'slave_post_count', required: true)
      required this.slavePostCount,
      @JsonKey(name: 'tags', required: true) required final List<String> tags})
      : _tags = tags;

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
  @JsonKey(name: 'last_slave_post_created_at', required: true)
  final int lastSlavePostCreatedAt;
  @override
  @JsonKey(name: 'slave_post_count', required: true)
  final int slavePostCount;
  final List<String> _tags;
  @override
  @JsonKey(name: 'tags', required: true)
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  String toString() {
    return 'ThreadDto(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, id: $id, url: $url, masterPost: $masterPost, lastSlavePostCreatedAt: $lastSlavePostCreatedAt, slavePostCount: $slavePostCount, tags: $tags)';
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
                other.masterPost == masterPost) &&
            (identical(other.lastSlavePostCreatedAt, lastSlavePostCreatedAt) ||
                other.lastSlavePostCreatedAt == lastSlavePostCreatedAt) &&
            (identical(other.slavePostCount, slavePostCount) ||
                other.slavePostCount == slavePostCount) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      extensionPkgName,
      siteId,
      boardId,
      id,
      url,
      masterPost,
      lastSlavePostCreatedAt,
      slavePostCount,
      const DeepCollectionEquality().hash(_tags));

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
      required final PostDto masterPost,
      @JsonKey(name: 'last_slave_post_created_at', required: true)
      required final int lastSlavePostCreatedAt,
      @JsonKey(name: 'slave_post_count', required: true)
      required final int slavePostCount,
      @JsonKey(name: 'tags', required: true)
      required final List<String> tags}) = _$ThreadDtoImpl;

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
  @override
  @JsonKey(name: 'last_slave_post_created_at', required: true)
  int get lastSlavePostCreatedAt;
  @override
  @JsonKey(name: 'slave_post_count', required: true)
  int get slavePostCount;
  @override
  @JsonKey(name: 'tags', required: true)
  List<String> get tags;

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
