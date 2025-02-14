// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_res_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailResDto _$DetailResDtoFromJson(Map<String, dynamic> json) {
  return _DetailResDto.fromJson(json);
}

/// @nodoc
mixin _$DetailResDto {
  @JsonKey(name: 'name', required: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'path', required: true)
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'sha', required: true)
  String get sha => throw _privateConstructorUsedError;
  @JsonKey(name: 'size', required: true)
  int get size => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', required: true)
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'html_url', required: true)
  String get htmlUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'git_url', required: true)
  String get gitUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'download_url', required: true)
  String get downloadUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'type', required: true)
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'content', required: true)
  String get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'encoding', required: true)
  String get encoding => throw _privateConstructorUsedError;
  @JsonKey(name: '_links', required: true)
  Links get links => throw _privateConstructorUsedError;

  /// Serializes this DetailResDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DetailResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DetailResDtoCopyWith<DetailResDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailResDtoCopyWith<$Res> {
  factory $DetailResDtoCopyWith(
          DetailResDto value, $Res Function(DetailResDto) then) =
      _$DetailResDtoCopyWithImpl<$Res, DetailResDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'path', required: true) String path,
      @JsonKey(name: 'sha', required: true) String sha,
      @JsonKey(name: 'size', required: true) int size,
      @JsonKey(name: 'url', required: true) String url,
      @JsonKey(name: 'html_url', required: true) String htmlUrl,
      @JsonKey(name: 'git_url', required: true) String gitUrl,
      @JsonKey(name: 'download_url', required: true) String downloadUrl,
      @JsonKey(name: 'type', required: true) String type,
      @JsonKey(name: 'content', required: true) String content,
      @JsonKey(name: 'encoding', required: true) String encoding,
      @JsonKey(name: '_links', required: true) Links links});

  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class _$DetailResDtoCopyWithImpl<$Res, $Val extends DetailResDto>
    implements $DetailResDtoCopyWith<$Res> {
  _$DetailResDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? sha = null,
    Object? size = null,
    Object? url = null,
    Object? htmlUrl = null,
    Object? gitUrl = null,
    Object? downloadUrl = null,
    Object? type = null,
    Object? content = null,
    Object? encoding = null,
    Object? links = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      sha: null == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gitUrl: null == gitUrl
          ? _value.gitUrl
          : gitUrl // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      encoding: null == encoding
          ? _value.encoding
          : encoding // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ) as $Val);
  }

  /// Create a copy of DetailResDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LinksCopyWith<$Res> get links {
    return $LinksCopyWith<$Res>(_value.links, (value) {
      return _then(_value.copyWith(links: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailResDtoImplCopyWith<$Res>
    implements $DetailResDtoCopyWith<$Res> {
  factory _$$DetailResDtoImplCopyWith(
          _$DetailResDtoImpl value, $Res Function(_$DetailResDtoImpl) then) =
      __$$DetailResDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'path', required: true) String path,
      @JsonKey(name: 'sha', required: true) String sha,
      @JsonKey(name: 'size', required: true) int size,
      @JsonKey(name: 'url', required: true) String url,
      @JsonKey(name: 'html_url', required: true) String htmlUrl,
      @JsonKey(name: 'git_url', required: true) String gitUrl,
      @JsonKey(name: 'download_url', required: true) String downloadUrl,
      @JsonKey(name: 'type', required: true) String type,
      @JsonKey(name: 'content', required: true) String content,
      @JsonKey(name: 'encoding', required: true) String encoding,
      @JsonKey(name: '_links', required: true) Links links});

  @override
  $LinksCopyWith<$Res> get links;
}

/// @nodoc
class __$$DetailResDtoImplCopyWithImpl<$Res>
    extends _$DetailResDtoCopyWithImpl<$Res, _$DetailResDtoImpl>
    implements _$$DetailResDtoImplCopyWith<$Res> {
  __$$DetailResDtoImplCopyWithImpl(
      _$DetailResDtoImpl _value, $Res Function(_$DetailResDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of DetailResDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? path = null,
    Object? sha = null,
    Object? size = null,
    Object? url = null,
    Object? htmlUrl = null,
    Object? gitUrl = null,
    Object? downloadUrl = null,
    Object? type = null,
    Object? content = null,
    Object? encoding = null,
    Object? links = null,
  }) {
    return _then(_$DetailResDtoImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      sha: null == sha
          ? _value.sha
          : sha // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      htmlUrl: null == htmlUrl
          ? _value.htmlUrl
          : htmlUrl // ignore: cast_nullable_to_non_nullable
              as String,
      gitUrl: null == gitUrl
          ? _value.gitUrl
          : gitUrl // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      encoding: null == encoding
          ? _value.encoding
          : encoding // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as Links,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailResDtoImpl implements _DetailResDto {
  const _$DetailResDtoImpl(
      {@JsonKey(name: 'name', required: true) required this.name,
      @JsonKey(name: 'path', required: true) required this.path,
      @JsonKey(name: 'sha', required: true) required this.sha,
      @JsonKey(name: 'size', required: true) required this.size,
      @JsonKey(name: 'url', required: true) required this.url,
      @JsonKey(name: 'html_url', required: true) required this.htmlUrl,
      @JsonKey(name: 'git_url', required: true) required this.gitUrl,
      @JsonKey(name: 'download_url', required: true) required this.downloadUrl,
      @JsonKey(name: 'type', required: true) required this.type,
      @JsonKey(name: 'content', required: true) required this.content,
      @JsonKey(name: 'encoding', required: true) required this.encoding,
      @JsonKey(name: '_links', required: true) required this.links});

  factory _$DetailResDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailResDtoImplFromJson(json);

  @override
  @JsonKey(name: 'name', required: true)
  final String name;
  @override
  @JsonKey(name: 'path', required: true)
  final String path;
  @override
  @JsonKey(name: 'sha', required: true)
  final String sha;
  @override
  @JsonKey(name: 'size', required: true)
  final int size;
  @override
  @JsonKey(name: 'url', required: true)
  final String url;
  @override
  @JsonKey(name: 'html_url', required: true)
  final String htmlUrl;
  @override
  @JsonKey(name: 'git_url', required: true)
  final String gitUrl;
  @override
  @JsonKey(name: 'download_url', required: true)
  final String downloadUrl;
  @override
  @JsonKey(name: 'type', required: true)
  final String type;
  @override
  @JsonKey(name: 'content', required: true)
  final String content;
  @override
  @JsonKey(name: 'encoding', required: true)
  final String encoding;
  @override
  @JsonKey(name: '_links', required: true)
  final Links links;

  @override
  String toString() {
    return 'DetailResDto(name: $name, path: $path, sha: $sha, size: $size, url: $url, htmlUrl: $htmlUrl, gitUrl: $gitUrl, downloadUrl: $downloadUrl, type: $type, content: $content, encoding: $encoding, links: $links)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailResDtoImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.sha, sha) || other.sha == sha) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.htmlUrl, htmlUrl) || other.htmlUrl == htmlUrl) &&
            (identical(other.gitUrl, gitUrl) || other.gitUrl == gitUrl) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.encoding, encoding) ||
                other.encoding == encoding) &&
            (identical(other.links, links) || other.links == links));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, path, sha, size, url,
      htmlUrl, gitUrl, downloadUrl, type, content, encoding, links);

  /// Create a copy of DetailResDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailResDtoImplCopyWith<_$DetailResDtoImpl> get copyWith =>
      __$$DetailResDtoImplCopyWithImpl<_$DetailResDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailResDtoImplToJson(
      this,
    );
  }
}

abstract class _DetailResDto implements DetailResDto {
  const factory _DetailResDto(
      {@JsonKey(name: 'name', required: true) required final String name,
      @JsonKey(name: 'path', required: true) required final String path,
      @JsonKey(name: 'sha', required: true) required final String sha,
      @JsonKey(name: 'size', required: true) required final int size,
      @JsonKey(name: 'url', required: true) required final String url,
      @JsonKey(name: 'html_url', required: true) required final String htmlUrl,
      @JsonKey(name: 'git_url', required: true) required final String gitUrl,
      @JsonKey(name: 'download_url', required: true)
      required final String downloadUrl,
      @JsonKey(name: 'type', required: true) required final String type,
      @JsonKey(name: 'content', required: true) required final String content,
      @JsonKey(name: 'encoding', required: true) required final String encoding,
      @JsonKey(name: '_links', required: true)
      required final Links links}) = _$DetailResDtoImpl;

  factory _DetailResDto.fromJson(Map<String, dynamic> json) =
      _$DetailResDtoImpl.fromJson;

  @override
  @JsonKey(name: 'name', required: true)
  String get name;
  @override
  @JsonKey(name: 'path', required: true)
  String get path;
  @override
  @JsonKey(name: 'sha', required: true)
  String get sha;
  @override
  @JsonKey(name: 'size', required: true)
  int get size;
  @override
  @JsonKey(name: 'url', required: true)
  String get url;
  @override
  @JsonKey(name: 'html_url', required: true)
  String get htmlUrl;
  @override
  @JsonKey(name: 'git_url', required: true)
  String get gitUrl;
  @override
  @JsonKey(name: 'download_url', required: true)
  String get downloadUrl;
  @override
  @JsonKey(name: 'type', required: true)
  String get type;
  @override
  @JsonKey(name: 'content', required: true)
  String get content;
  @override
  @JsonKey(name: 'encoding', required: true)
  String get encoding;
  @override
  @JsonKey(name: '_links', required: true)
  Links get links;

  /// Create a copy of DetailResDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailResDtoImplCopyWith<_$DetailResDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Links _$LinksFromJson(Map<String, dynamic> json) {
  return _Links.fromJson(json);
}

/// @nodoc
mixin _$Links {
  @JsonKey(name: 'self', required: true)
  String get self => throw _privateConstructorUsedError;
  @JsonKey(name: 'git', required: true)
  String get git => throw _privateConstructorUsedError;
  @JsonKey(name: 'html', required: true)
  String get html => throw _privateConstructorUsedError;

  /// Serializes this Links to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinksCopyWith<Links> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinksCopyWith<$Res> {
  factory $LinksCopyWith(Links value, $Res Function(Links) then) =
      _$LinksCopyWithImpl<$Res, Links>;
  @useResult
  $Res call(
      {@JsonKey(name: 'self', required: true) String self,
      @JsonKey(name: 'git', required: true) String git,
      @JsonKey(name: 'html', required: true) String html});
}

/// @nodoc
class _$LinksCopyWithImpl<$Res, $Val extends Links>
    implements $LinksCopyWith<$Res> {
  _$LinksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = null,
    Object? git = null,
    Object? html = null,
  }) {
    return _then(_value.copyWith(
      self: null == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String,
      git: null == git
          ? _value.git
          : git // ignore: cast_nullable_to_non_nullable
              as String,
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinksImplCopyWith<$Res> implements $LinksCopyWith<$Res> {
  factory _$$LinksImplCopyWith(
          _$LinksImpl value, $Res Function(_$LinksImpl) then) =
      __$$LinksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'self', required: true) String self,
      @JsonKey(name: 'git', required: true) String git,
      @JsonKey(name: 'html', required: true) String html});
}

/// @nodoc
class __$$LinksImplCopyWithImpl<$Res>
    extends _$LinksCopyWithImpl<$Res, _$LinksImpl>
    implements _$$LinksImplCopyWith<$Res> {
  __$$LinksImplCopyWithImpl(
      _$LinksImpl _value, $Res Function(_$LinksImpl) _then)
      : super(_value, _then);

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? self = null,
    Object? git = null,
    Object? html = null,
  }) {
    return _then(_$LinksImpl(
      self: null == self
          ? _value.self
          : self // ignore: cast_nullable_to_non_nullable
              as String,
      git: null == git
          ? _value.git
          : git // ignore: cast_nullable_to_non_nullable
              as String,
      html: null == html
          ? _value.html
          : html // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinksImpl implements _Links {
  const _$LinksImpl(
      {@JsonKey(name: 'self', required: true) required this.self,
      @JsonKey(name: 'git', required: true) required this.git,
      @JsonKey(name: 'html', required: true) required this.html});

  factory _$LinksImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinksImplFromJson(json);

  @override
  @JsonKey(name: 'self', required: true)
  final String self;
  @override
  @JsonKey(name: 'git', required: true)
  final String git;
  @override
  @JsonKey(name: 'html', required: true)
  final String html;

  @override
  String toString() {
    return 'Links(self: $self, git: $git, html: $html)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinksImpl &&
            (identical(other.self, self) || other.self == self) &&
            (identical(other.git, git) || other.git == git) &&
            (identical(other.html, html) || other.html == html));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, self, git, html);

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      __$$LinksImplCopyWithImpl<_$LinksImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinksImplToJson(
      this,
    );
  }
}

abstract class _Links implements Links {
  const factory _Links(
          {@JsonKey(name: 'self', required: true) required final String self,
          @JsonKey(name: 'git', required: true) required final String git,
          @JsonKey(name: 'html', required: true) required final String html}) =
      _$LinksImpl;

  factory _Links.fromJson(Map<String, dynamic> json) = _$LinksImpl.fromJson;

  @override
  @JsonKey(name: 'self', required: true)
  String get self;
  @override
  @JsonKey(name: 'git', required: true)
  String get git;
  @override
  @JsonKey(name: 'html', required: true)
  String get html;

  /// Create a copy of Links
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinksImplCopyWith<_$LinksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
