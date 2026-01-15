// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Post _$PostFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'article':
      return ArticlePost.fromJson(json);
    case 'singleImage':
      return SingleImagePost.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'Post',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$Post {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  int? get liked => throw _privateConstructorUsedError;
  int? get disliked => throw _privateConstructorUsedError;
  List<Paragraph> get contents => throw _privateConstructorUsedError;
  DateTime? get latestReplyCreatedAt => throw _privateConstructorUsedError;
  int? get repliesCount => throw _privateConstructorUsedError;
  List<Comment>? get top5Comments => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )
    article,
    required TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )
    singleImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )?
    article,
    TResult? Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )?
    singleImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )?
    article,
    TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )?
    singleImage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlePost value) article,
    required TResult Function(SingleImagePost value) singleImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlePost value)? article,
    TResult? Function(SingleImagePost value)? singleImage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlePost value)? article,
    TResult Function(SingleImagePost value)? singleImage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call({
    String extensionPkgName,
    String boardId,
    String threadId,
    String id,
    String? title,
    String? url,
    DateTime createdAt,
    String authorId,
    String authorName,
    int? liked,
    int? disliked,
    List<Paragraph> contents,
    DateTime? latestReplyCreatedAt,
    int? repliesCount,
    List<Comment>? top5Comments,
    List<String>? tags,
  });
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? id = null,
    Object? title = freezed,
    Object? url = freezed,
    Object? createdAt = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? liked = freezed,
    Object? disliked = freezed,
    Object? contents = null,
    Object? latestReplyCreatedAt = freezed,
    Object? repliesCount = freezed,
    Object? top5Comments = freezed,
    Object? tags = freezed,
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
            id: null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                      as String,
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
                      as DateTime,
            authorId: null == authorId
                ? _value.authorId
                : authorId // ignore: cast_nullable_to_non_nullable
                      as String,
            authorName: null == authorName
                ? _value.authorName
                : authorName // ignore: cast_nullable_to_non_nullable
                      as String,
            liked: freezed == liked
                ? _value.liked
                : liked // ignore: cast_nullable_to_non_nullable
                      as int?,
            disliked: freezed == disliked
                ? _value.disliked
                : disliked // ignore: cast_nullable_to_non_nullable
                      as int?,
            contents: null == contents
                ? _value.contents
                : contents // ignore: cast_nullable_to_non_nullable
                      as List<Paragraph>,
            latestReplyCreatedAt: freezed == latestReplyCreatedAt
                ? _value.latestReplyCreatedAt
                : latestReplyCreatedAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
            repliesCount: freezed == repliesCount
                ? _value.repliesCount
                : repliesCount // ignore: cast_nullable_to_non_nullable
                      as int?,
            top5Comments: freezed == top5Comments
                ? _value.top5Comments
                : top5Comments // ignore: cast_nullable_to_non_nullable
                      as List<Comment>?,
            tags: freezed == tags
                ? _value.tags
                : tags // ignore: cast_nullable_to_non_nullable
                      as List<String>?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ArticlePostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$ArticlePostImplCopyWith(
    _$ArticlePostImpl value,
    $Res Function(_$ArticlePostImpl) then,
  ) = __$$ArticlePostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String extensionPkgName,
    String boardId,
    String threadId,
    String id,
    String? title,
    String? url,
    DateTime createdAt,
    String authorId,
    String authorName,
    int? liked,
    int? disliked,
    List<Paragraph> contents,
    DateTime? latestReplyCreatedAt,
    int? repliesCount,
    List<Comment>? top5Comments,
    List<String>? tags,
  });
}

/// @nodoc
class __$$ArticlePostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$ArticlePostImpl>
    implements _$$ArticlePostImplCopyWith<$Res> {
  __$$ArticlePostImplCopyWithImpl(
    _$ArticlePostImpl _value,
    $Res Function(_$ArticlePostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? id = null,
    Object? title = freezed,
    Object? url = freezed,
    Object? createdAt = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? liked = freezed,
    Object? disliked = freezed,
    Object? contents = null,
    Object? latestReplyCreatedAt = freezed,
    Object? repliesCount = freezed,
    Object? top5Comments = freezed,
    Object? tags = freezed,
  }) {
    return _then(
      _$ArticlePostImpl(
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
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as DateTime,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        liked: freezed == liked
            ? _value.liked
            : liked // ignore: cast_nullable_to_non_nullable
                  as int?,
        disliked: freezed == disliked
            ? _value.disliked
            : disliked // ignore: cast_nullable_to_non_nullable
                  as int?,
        contents: null == contents
            ? _value._contents
            : contents // ignore: cast_nullable_to_non_nullable
                  as List<Paragraph>,
        latestReplyCreatedAt: freezed == latestReplyCreatedAt
            ? _value.latestReplyCreatedAt
            : latestReplyCreatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        repliesCount: freezed == repliesCount
            ? _value.repliesCount
            : repliesCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        top5Comments: freezed == top5Comments
            ? _value._top5Comments
            : top5Comments // ignore: cast_nullable_to_non_nullable
                  as List<Comment>?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticlePostImpl extends ArticlePost {
  const _$ArticlePostImpl({
    required this.extensionPkgName,
    required this.boardId,
    required this.threadId,
    required this.id,
    this.title,
    this.url,
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    this.liked,
    this.disliked,
    required final List<Paragraph> contents,
    this.latestReplyCreatedAt,
    this.repliesCount,
    final List<Comment>? top5Comments,
    final List<String>? tags,
    final String? $type,
  }) : _contents = contents,
       _top5Comments = top5Comments,
       _tags = tags,
       $type = $type ?? 'article',
       super._();

  factory _$ArticlePostImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticlePostImplFromJson(json);

  @override
  final String extensionPkgName;
  @override
  final String boardId;
  @override
  final String threadId;
  @override
  final String id;
  @override
  final String? title;
  @override
  final String? url;
  @override
  final DateTime createdAt;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final int? liked;
  @override
  final int? disliked;
  final List<Paragraph> _contents;
  @override
  List<Paragraph> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  final DateTime? latestReplyCreatedAt;
  @override
  final int? repliesCount;
  final List<Comment>? _top5Comments;
  @override
  List<Comment>? get top5Comments {
    final value = _top5Comments;
    if (value == null) return null;
    if (_top5Comments is EqualUnmodifiableListView) return _top5Comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Post.article(extensionPkgName: $extensionPkgName, boardId: $boardId, threadId: $threadId, id: $id, title: $title, url: $url, createdAt: $createdAt, authorId: $authorId, authorName: $authorName, liked: $liked, disliked: $disliked, contents: $contents, latestReplyCreatedAt: $latestReplyCreatedAt, repliesCount: $repliesCount, top5Comments: $top5Comments, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticlePostImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.disliked, disliked) ||
                other.disliked == disliked) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.latestReplyCreatedAt, latestReplyCreatedAt) ||
                other.latestReplyCreatedAt == latestReplyCreatedAt) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            const DeepCollectionEquality().equals(
              other._top5Comments,
              _top5Comments,
            ) &&
            const DeepCollectionEquality().equals(other._tags, _tags));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    extensionPkgName,
    boardId,
    threadId,
    id,
    title,
    url,
    createdAt,
    authorId,
    authorName,
    liked,
    disliked,
    const DeepCollectionEquality().hash(_contents),
    latestReplyCreatedAt,
    repliesCount,
    const DeepCollectionEquality().hash(_top5Comments),
    const DeepCollectionEquality().hash(_tags),
  );

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticlePostImplCopyWith<_$ArticlePostImpl> get copyWith =>
      __$$ArticlePostImplCopyWithImpl<_$ArticlePostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )
    article,
    required TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )
    singleImage,
  }) {
    return article(
      extensionPkgName,
      boardId,
      threadId,
      id,
      title,
      url,
      createdAt,
      authorId,
      authorName,
      liked,
      disliked,
      contents,
      latestReplyCreatedAt,
      repliesCount,
      top5Comments,
      tags,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )?
    article,
    TResult? Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )?
    singleImage,
  }) {
    return article?.call(
      extensionPkgName,
      boardId,
      threadId,
      id,
      title,
      url,
      createdAt,
      authorId,
      authorName,
      liked,
      disliked,
      contents,
      latestReplyCreatedAt,
      repliesCount,
      top5Comments,
      tags,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )?
    article,
    TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )?
    singleImage,
    required TResult orElse(),
  }) {
    if (article != null) {
      return article(
        extensionPkgName,
        boardId,
        threadId,
        id,
        title,
        url,
        createdAt,
        authorId,
        authorName,
        liked,
        disliked,
        contents,
        latestReplyCreatedAt,
        repliesCount,
        top5Comments,
        tags,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlePost value) article,
    required TResult Function(SingleImagePost value) singleImage,
  }) {
    return article(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlePost value)? article,
    TResult? Function(SingleImagePost value)? singleImage,
  }) {
    return article?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlePost value)? article,
    TResult Function(SingleImagePost value)? singleImage,
    required TResult orElse(),
  }) {
    if (article != null) {
      return article(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticlePostImplToJson(this);
  }
}

abstract class ArticlePost extends Post {
  const factory ArticlePost({
    required final String extensionPkgName,
    required final String boardId,
    required final String threadId,
    required final String id,
    final String? title,
    final String? url,
    required final DateTime createdAt,
    required final String authorId,
    required final String authorName,
    final int? liked,
    final int? disliked,
    required final List<Paragraph> contents,
    final DateTime? latestReplyCreatedAt,
    final int? repliesCount,
    final List<Comment>? top5Comments,
    final List<String>? tags,
  }) = _$ArticlePostImpl;
  const ArticlePost._() : super._();

  factory ArticlePost.fromJson(Map<String, dynamic> json) =
      _$ArticlePostImpl.fromJson;

  @override
  String get extensionPkgName;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  String get id;
  @override
  String? get title;
  @override
  String? get url;
  @override
  DateTime get createdAt;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  int? get liked;
  @override
  int? get disliked;
  @override
  List<Paragraph> get contents;
  @override
  DateTime? get latestReplyCreatedAt;
  @override
  int? get repliesCount;
  @override
  List<Comment>? get top5Comments;
  @override
  List<String>? get tags;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticlePostImplCopyWith<_$ArticlePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SingleImagePostImplCopyWith<$Res>
    implements $PostCopyWith<$Res> {
  factory _$$SingleImagePostImplCopyWith(
    _$SingleImagePostImpl value,
    $Res Function(_$SingleImagePostImpl) then,
  ) = __$$SingleImagePostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String extensionPkgName,
    String boardId,
    String threadId,
    String id,
    String? title,
    String? url,
    DateTime createdAt,
    String authorId,
    String authorName,
    int? liked,
    int? disliked,
    List<Paragraph> contents,
    DateTime? latestReplyCreatedAt,
    int? repliesCount,
    List<Comment>? top5Comments,
    List<String>? tags,
    ImageParagraph? image,
  });
}

/// @nodoc
class __$$SingleImagePostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$SingleImagePostImpl>
    implements _$$SingleImagePostImplCopyWith<$Res> {
  __$$SingleImagePostImplCopyWithImpl(
    _$SingleImagePostImpl _value,
    $Res Function(_$SingleImagePostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? id = null,
    Object? title = freezed,
    Object? url = freezed,
    Object? createdAt = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? liked = freezed,
    Object? disliked = freezed,
    Object? contents = null,
    Object? latestReplyCreatedAt = freezed,
    Object? repliesCount = freezed,
    Object? top5Comments = freezed,
    Object? tags = freezed,
    Object? image = freezed,
  }) {
    return _then(
      _$SingleImagePostImpl(
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
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
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
                  as DateTime,
        authorId: null == authorId
            ? _value.authorId
            : authorId // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        liked: freezed == liked
            ? _value.liked
            : liked // ignore: cast_nullable_to_non_nullable
                  as int?,
        disliked: freezed == disliked
            ? _value.disliked
            : disliked // ignore: cast_nullable_to_non_nullable
                  as int?,
        contents: null == contents
            ? _value._contents
            : contents // ignore: cast_nullable_to_non_nullable
                  as List<Paragraph>,
        latestReplyCreatedAt: freezed == latestReplyCreatedAt
            ? _value.latestReplyCreatedAt
            : latestReplyCreatedAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
        repliesCount: freezed == repliesCount
            ? _value.repliesCount
            : repliesCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        top5Comments: freezed == top5Comments
            ? _value._top5Comments
            : top5Comments // ignore: cast_nullable_to_non_nullable
                  as List<Comment>?,
        tags: freezed == tags
            ? _value._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        image: freezed == image
            ? _value.image
            : image // ignore: cast_nullable_to_non_nullable
                  as ImageParagraph?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$SingleImagePostImpl extends SingleImagePost {
  const _$SingleImagePostImpl({
    required this.extensionPkgName,
    required this.boardId,
    required this.threadId,
    required this.id,
    this.title,
    this.url,
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    this.liked,
    this.disliked,
    required final List<Paragraph> contents,
    this.latestReplyCreatedAt,
    this.repliesCount,
    final List<Comment>? top5Comments,
    final List<String>? tags,
    this.image,
    final String? $type,
  }) : _contents = contents,
       _top5Comments = top5Comments,
       _tags = tags,
       $type = $type ?? 'singleImage',
       super._();

  factory _$SingleImagePostImpl.fromJson(Map<String, dynamic> json) =>
      _$$SingleImagePostImplFromJson(json);

  @override
  final String extensionPkgName;
  @override
  final String boardId;
  @override
  final String threadId;
  @override
  final String id;
  @override
  final String? title;
  @override
  final String? url;
  @override
  final DateTime createdAt;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final int? liked;
  @override
  final int? disliked;
  final List<Paragraph> _contents;
  @override
  List<Paragraph> get contents {
    if (_contents is EqualUnmodifiableListView) return _contents;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_contents);
  }

  @override
  final DateTime? latestReplyCreatedAt;
  @override
  final int? repliesCount;
  final List<Comment>? _top5Comments;
  @override
  List<Comment>? get top5Comments {
    final value = _top5Comments;
    if (value == null) return null;
    if (_top5Comments is EqualUnmodifiableListView) return _top5Comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ImageParagraph? image;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Post.singleImage(extensionPkgName: $extensionPkgName, boardId: $boardId, threadId: $threadId, id: $id, title: $title, url: $url, createdAt: $createdAt, authorId: $authorId, authorName: $authorName, liked: $liked, disliked: $disliked, contents: $contents, latestReplyCreatedAt: $latestReplyCreatedAt, repliesCount: $repliesCount, top5Comments: $top5Comments, tags: $tags, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SingleImagePostImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.disliked, disliked) ||
                other.disliked == disliked) &&
            const DeepCollectionEquality().equals(other._contents, _contents) &&
            (identical(other.latestReplyCreatedAt, latestReplyCreatedAt) ||
                other.latestReplyCreatedAt == latestReplyCreatedAt) &&
            (identical(other.repliesCount, repliesCount) ||
                other.repliesCount == repliesCount) &&
            const DeepCollectionEquality().equals(
              other._top5Comments,
              _top5Comments,
            ) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality().equals(other.image, image));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    extensionPkgName,
    boardId,
    threadId,
    id,
    title,
    url,
    createdAt,
    authorId,
    authorName,
    liked,
    disliked,
    const DeepCollectionEquality().hash(_contents),
    latestReplyCreatedAt,
    repliesCount,
    const DeepCollectionEquality().hash(_top5Comments),
    const DeepCollectionEquality().hash(_tags),
    const DeepCollectionEquality().hash(image),
  );

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SingleImagePostImplCopyWith<_$SingleImagePostImpl> get copyWith =>
      __$$SingleImagePostImplCopyWithImpl<_$SingleImagePostImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )
    article,
    required TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )
    singleImage,
  }) {
    return singleImage(
      extensionPkgName,
      boardId,
      threadId,
      id,
      title,
      url,
      createdAt,
      authorId,
      authorName,
      liked,
      disliked,
      contents,
      latestReplyCreatedAt,
      repliesCount,
      top5Comments,
      tags,
      image,
    );
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )?
    article,
    TResult? Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )?
    singleImage,
  }) {
    return singleImage?.call(
      extensionPkgName,
      boardId,
      threadId,
      id,
      title,
      url,
      createdAt,
      authorId,
      authorName,
      liked,
      disliked,
      contents,
      latestReplyCreatedAt,
      repliesCount,
      top5Comments,
      tags,
      image,
    );
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
    )?
    article,
    TResult Function(
      String extensionPkgName,
      String boardId,
      String threadId,
      String id,
      String? title,
      String? url,
      DateTime createdAt,
      String authorId,
      String authorName,
      int? liked,
      int? disliked,
      List<Paragraph> contents,
      DateTime? latestReplyCreatedAt,
      int? repliesCount,
      List<Comment>? top5Comments,
      List<String>? tags,
      ImageParagraph? image,
    )?
    singleImage,
    required TResult orElse(),
  }) {
    if (singleImage != null) {
      return singleImage(
        extensionPkgName,
        boardId,
        threadId,
        id,
        title,
        url,
        createdAt,
        authorId,
        authorName,
        liked,
        disliked,
        contents,
        latestReplyCreatedAt,
        repliesCount,
        top5Comments,
        tags,
        image,
      );
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ArticlePost value) article,
    required TResult Function(SingleImagePost value) singleImage,
  }) {
    return singleImage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ArticlePost value)? article,
    TResult? Function(SingleImagePost value)? singleImage,
  }) {
    return singleImage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ArticlePost value)? article,
    TResult Function(SingleImagePost value)? singleImage,
    required TResult orElse(),
  }) {
    if (singleImage != null) {
      return singleImage(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$SingleImagePostImplToJson(this);
  }
}

abstract class SingleImagePost extends Post {
  const factory SingleImagePost({
    required final String extensionPkgName,
    required final String boardId,
    required final String threadId,
    required final String id,
    final String? title,
    final String? url,
    required final DateTime createdAt,
    required final String authorId,
    required final String authorName,
    final int? liked,
    final int? disliked,
    required final List<Paragraph> contents,
    final DateTime? latestReplyCreatedAt,
    final int? repliesCount,
    final List<Comment>? top5Comments,
    final List<String>? tags,
    final ImageParagraph? image,
  }) = _$SingleImagePostImpl;
  const SingleImagePost._() : super._();

  factory SingleImagePost.fromJson(Map<String, dynamic> json) =
      _$SingleImagePostImpl.fromJson;

  @override
  String get extensionPkgName;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  String get id;
  @override
  String? get title;
  @override
  String? get url;
  @override
  DateTime get createdAt;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  int? get liked;
  @override
  int? get disliked;
  @override
  List<Paragraph> get contents;
  @override
  DateTime? get latestReplyCreatedAt;
  @override
  int? get repliesCount;
  @override
  List<Comment>? get top5Comments;
  @override
  List<String>? get tags;
  ImageParagraph? get image;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SingleImagePostImplCopyWith<_$SingleImagePostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
