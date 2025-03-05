// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_repo_api.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GithubResponseDto _$GithubResponseDtoFromJson(Map<String, dynamic> json) {
  return _GithubResponseDto.fromJson(json);
}

/// @nodoc
mixin _$GithubResponseDto {
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

  /// Create a copy of GithubResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GithubResponseDtoCopyWith<GithubResponseDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GithubResponseDtoCopyWith<$Res> {
  factory $GithubResponseDtoCopyWith(
          GithubResponseDto value, $Res Function(GithubResponseDto) then) =
      _$GithubResponseDtoCopyWithImpl<$Res, GithubResponseDto>;
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
      @JsonKey(name: 'encoding', required: true) String encoding});
}

/// @nodoc
class _$GithubResponseDtoCopyWithImpl<$Res, $Val extends GithubResponseDto>
    implements $GithubResponseDtoCopyWith<$Res> {
  _$GithubResponseDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GithubResponseDto
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GithubResponseDtoImplCopyWith<$Res>
    implements $GithubResponseDtoCopyWith<$Res> {
  factory _$$GithubResponseDtoImplCopyWith(_$GithubResponseDtoImpl value,
          $Res Function(_$GithubResponseDtoImpl) then) =
      __$$GithubResponseDtoImplCopyWithImpl<$Res>;
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
      @JsonKey(name: 'encoding', required: true) String encoding});
}

/// @nodoc
class __$$GithubResponseDtoImplCopyWithImpl<$Res>
    extends _$GithubResponseDtoCopyWithImpl<$Res, _$GithubResponseDtoImpl>
    implements _$$GithubResponseDtoImplCopyWith<$Res> {
  __$$GithubResponseDtoImplCopyWithImpl(_$GithubResponseDtoImpl _value,
      $Res Function(_$GithubResponseDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GithubResponseDto
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
  }) {
    return _then(_$GithubResponseDtoImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GithubResponseDtoImpl implements _GithubResponseDto {
  const _$GithubResponseDtoImpl(
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
      @JsonKey(name: 'encoding', required: true) required this.encoding});

  factory _$GithubResponseDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GithubResponseDtoImplFromJson(json);

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
  String toString() {
    return 'GithubResponseDto(name: $name, path: $path, sha: $sha, size: $size, url: $url, htmlUrl: $htmlUrl, gitUrl: $gitUrl, downloadUrl: $downloadUrl, type: $type, content: $content, encoding: $encoding)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GithubResponseDtoImpl &&
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
                other.encoding == encoding));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, path, sha, size, url,
      htmlUrl, gitUrl, downloadUrl, type, content, encoding);

  /// Create a copy of GithubResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GithubResponseDtoImplCopyWith<_$GithubResponseDtoImpl> get copyWith =>
      __$$GithubResponseDtoImplCopyWithImpl<_$GithubResponseDtoImpl>(
          this, _$identity);
}

abstract class _GithubResponseDto implements GithubResponseDto {
  const factory _GithubResponseDto(
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
      @JsonKey(name: 'encoding', required: true)
      required final String encoding}) = _$GithubResponseDtoImpl;

  factory _GithubResponseDto.fromJson(Map<String, dynamic> json) =
      _$GithubResponseDtoImpl.fromJson;

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

  /// Create a copy of GithubResponseDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GithubResponseDtoImplCopyWith<_$GithubResponseDtoImpl> get copyWith =>
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
@JsonSerializable(createToJson: false)
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

GetDetailContentDto _$GetDetailContentDtoFromJson(Map<String, dynamic> json) {
  return _GetDetailContentDto.fromJson(json);
}

/// @nodoc
mixin _$GetDetailContentDto {
  @JsonKey(name: 'icon', required: true)
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'base_url', required: true)
  String get baseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name', required: true)
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'website', required: true)
  String get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'signing_key_fingerprint', required: true)
  String get signingKeyFingerprint => throw _privateConstructorUsedError;

  /// Create a copy of GetDetailContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetDetailContentDtoCopyWith<GetDetailContentDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetDetailContentDtoCopyWith<$Res> {
  factory $GetDetailContentDtoCopyWith(
          GetDetailContentDto value, $Res Function(GetDetailContentDto) then) =
      _$GetDetailContentDtoCopyWithImpl<$Res, GetDetailContentDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'base_url', required: true) String baseUrl,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'website', required: true) String website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      String signingKeyFingerprint});
}

/// @nodoc
class _$GetDetailContentDtoCopyWithImpl<$Res, $Val extends GetDetailContentDto>
    implements $GetDetailContentDtoCopyWith<$Res> {
  _$GetDetailContentDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetDetailContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? baseUrl = null,
    Object? displayName = null,
    Object? website = null,
    Object? signingKeyFingerprint = null,
  }) {
    return _then(_value.copyWith(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      signingKeyFingerprint: null == signingKeyFingerprint
          ? _value.signingKeyFingerprint
          : signingKeyFingerprint // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetDetailContentDtoImplCopyWith<$Res>
    implements $GetDetailContentDtoCopyWith<$Res> {
  factory _$$GetDetailContentDtoImplCopyWith(_$GetDetailContentDtoImpl value,
          $Res Function(_$GetDetailContentDtoImpl) then) =
      __$$GetDetailContentDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'base_url', required: true) String baseUrl,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'website', required: true) String website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      String signingKeyFingerprint});
}

/// @nodoc
class __$$GetDetailContentDtoImplCopyWithImpl<$Res>
    extends _$GetDetailContentDtoCopyWithImpl<$Res, _$GetDetailContentDtoImpl>
    implements _$$GetDetailContentDtoImplCopyWith<$Res> {
  __$$GetDetailContentDtoImplCopyWithImpl(_$GetDetailContentDtoImpl _value,
      $Res Function(_$GetDetailContentDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetDetailContentDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? icon = null,
    Object? baseUrl = null,
    Object? displayName = null,
    Object? website = null,
    Object? signingKeyFingerprint = null,
  }) {
    return _then(_$GetDetailContentDtoImpl(
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as String,
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      website: null == website
          ? _value.website
          : website // ignore: cast_nullable_to_non_nullable
              as String,
      signingKeyFingerprint: null == signingKeyFingerprint
          ? _value.signingKeyFingerprint
          : signingKeyFingerprint // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GetDetailContentDtoImpl implements _GetDetailContentDto {
  const _$GetDetailContentDtoImpl(
      {@JsonKey(name: 'icon', required: true) required this.icon,
      @JsonKey(name: 'base_url', required: true) required this.baseUrl,
      @JsonKey(name: 'display_name', required: true) required this.displayName,
      @JsonKey(name: 'website', required: true) required this.website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      required this.signingKeyFingerprint});

  factory _$GetDetailContentDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$GetDetailContentDtoImplFromJson(json);

  @override
  @JsonKey(name: 'icon', required: true)
  final String icon;
  @override
  @JsonKey(name: 'base_url', required: true)
  final String baseUrl;
  @override
  @JsonKey(name: 'display_name', required: true)
  final String displayName;
  @override
  @JsonKey(name: 'website', required: true)
  final String website;
  @override
  @JsonKey(name: 'signing_key_fingerprint', required: true)
  final String signingKeyFingerprint;

  @override
  String toString() {
    return 'GetDetailContentDto(icon: $icon, baseUrl: $baseUrl, displayName: $displayName, website: $website, signingKeyFingerprint: $signingKeyFingerprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDetailContentDtoImpl &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.signingKeyFingerprint, signingKeyFingerprint) ||
                other.signingKeyFingerprint == signingKeyFingerprint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, icon, baseUrl, displayName, website, signingKeyFingerprint);

  /// Create a copy of GetDetailContentDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDetailContentDtoImplCopyWith<_$GetDetailContentDtoImpl> get copyWith =>
      __$$GetDetailContentDtoImplCopyWithImpl<_$GetDetailContentDtoImpl>(
          this, _$identity);
}

abstract class _GetDetailContentDto implements GetDetailContentDto {
  const factory _GetDetailContentDto(
      {@JsonKey(name: 'icon', required: true) required final String icon,
      @JsonKey(name: 'base_url', required: true) required final String baseUrl,
      @JsonKey(name: 'display_name', required: true)
      required final String displayName,
      @JsonKey(name: 'website', required: true) required final String website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      required final String signingKeyFingerprint}) = _$GetDetailContentDtoImpl;

  factory _GetDetailContentDto.fromJson(Map<String, dynamic> json) =
      _$GetDetailContentDtoImpl.fromJson;

  @override
  @JsonKey(name: 'icon', required: true)
  String get icon;
  @override
  @JsonKey(name: 'base_url', required: true)
  String get baseUrl;
  @override
  @JsonKey(name: 'display_name', required: true)
  String get displayName;
  @override
  @JsonKey(name: 'website', required: true)
  String get website;
  @override
  @JsonKey(name: 'signing_key_fingerprint', required: true)
  String get signingKeyFingerprint;

  /// Create a copy of GetDetailContentDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDetailContentDtoImplCopyWith<_$GetDetailContentDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

GetExtensionsContentItemDto _$GetExtensionsContentItemDtoFromJson(
    Map<String, dynamic> json) {
  return _GetExtensionsContentItemDto.fromJson(json);
}

/// @nodoc
mixin _$GetExtensionsContentItemDto {
  @JsonKey(name: 'repo_base_url', required: true)
  String get repoBaseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'pkg_name', required: true)
  String get pkgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'display_name', required: true)
  String get displayName => throw _privateConstructorUsedError;
  @JsonKey(name: 'zip_name', required: true)
  String get zipName => throw _privateConstructorUsedError;
  @JsonKey(name: 'address', required: true)
  String get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'version', required: true)
  int get version => throw _privateConstructorUsedError;
  @JsonKey(name: 'python_version', required: true)
  int get pythonVersion => throw _privateConstructorUsedError;
  @JsonKey(name: 'lang', required: true)
  String get lang => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_nsfw', required: true)
  bool get isNsfw => throw _privateConstructorUsedError;

  /// Create a copy of GetExtensionsContentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetExtensionsContentItemDtoCopyWith<GetExtensionsContentItemDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetExtensionsContentItemDtoCopyWith<$Res> {
  factory $GetExtensionsContentItemDtoCopyWith(
          GetExtensionsContentItemDto value,
          $Res Function(GetExtensionsContentItemDto) then) =
      _$GetExtensionsContentItemDtoCopyWithImpl<$Res,
          GetExtensionsContentItemDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'repo_base_url', required: true) String repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) String pkgName,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'zip_name', required: true) String zipName,
      @JsonKey(name: 'address', required: true) String address,
      @JsonKey(name: 'version', required: true) int version,
      @JsonKey(name: 'python_version', required: true) int pythonVersion,
      @JsonKey(name: 'lang', required: true) String lang,
      @JsonKey(name: 'is_nsfw', required: true) bool isNsfw});
}

/// @nodoc
class _$GetExtensionsContentItemDtoCopyWithImpl<$Res,
        $Val extends GetExtensionsContentItemDto>
    implements $GetExtensionsContentItemDtoCopyWith<$Res> {
  _$GetExtensionsContentItemDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetExtensionsContentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repoBaseUrl = null,
    Object? pkgName = null,
    Object? displayName = null,
    Object? zipName = null,
    Object? address = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = null,
    Object? isNsfw = null,
  }) {
    return _then(_value.copyWith(
      repoBaseUrl: null == repoBaseUrl
          ? _value.repoBaseUrl
          : repoBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pkgName: null == pkgName
          ? _value.pkgName
          : pkgName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      zipName: null == zipName
          ? _value.zipName
          : zipName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      pythonVersion: null == pythonVersion
          ? _value.pythonVersion
          : pythonVersion // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      isNsfw: null == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetExtensionsContentItemDtoImplCopyWith<$Res>
    implements $GetExtensionsContentItemDtoCopyWith<$Res> {
  factory _$$GetExtensionsContentItemDtoImplCopyWith(
          _$GetExtensionsContentItemDtoImpl value,
          $Res Function(_$GetExtensionsContentItemDtoImpl) then) =
      __$$GetExtensionsContentItemDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'repo_base_url', required: true) String repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) String pkgName,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'zip_name', required: true) String zipName,
      @JsonKey(name: 'address', required: true) String address,
      @JsonKey(name: 'version', required: true) int version,
      @JsonKey(name: 'python_version', required: true) int pythonVersion,
      @JsonKey(name: 'lang', required: true) String lang,
      @JsonKey(name: 'is_nsfw', required: true) bool isNsfw});
}

/// @nodoc
class __$$GetExtensionsContentItemDtoImplCopyWithImpl<$Res>
    extends _$GetExtensionsContentItemDtoCopyWithImpl<$Res,
        _$GetExtensionsContentItemDtoImpl>
    implements _$$GetExtensionsContentItemDtoImplCopyWith<$Res> {
  __$$GetExtensionsContentItemDtoImplCopyWithImpl(
      _$GetExtensionsContentItemDtoImpl _value,
      $Res Function(_$GetExtensionsContentItemDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetExtensionsContentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repoBaseUrl = null,
    Object? pkgName = null,
    Object? displayName = null,
    Object? zipName = null,
    Object? address = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = null,
    Object? isNsfw = null,
  }) {
    return _then(_$GetExtensionsContentItemDtoImpl(
      repoBaseUrl: null == repoBaseUrl
          ? _value.repoBaseUrl
          : repoBaseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      pkgName: null == pkgName
          ? _value.pkgName
          : pkgName // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      zipName: null == zipName
          ? _value.zipName
          : zipName // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as int,
      pythonVersion: null == pythonVersion
          ? _value.pythonVersion
          : pythonVersion // ignore: cast_nullable_to_non_nullable
              as int,
      lang: null == lang
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String,
      isNsfw: null == isNsfw
          ? _value.isNsfw
          : isNsfw // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$GetExtensionsContentItemDtoImpl
    implements _GetExtensionsContentItemDto {
  const _$GetExtensionsContentItemDtoImpl(
      {@JsonKey(name: 'repo_base_url', required: true)
      required this.repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) required this.pkgName,
      @JsonKey(name: 'display_name', required: true) required this.displayName,
      @JsonKey(name: 'zip_name', required: true) required this.zipName,
      @JsonKey(name: 'address', required: true) required this.address,
      @JsonKey(name: 'version', required: true) required this.version,
      @JsonKey(name: 'python_version', required: true)
      required this.pythonVersion,
      @JsonKey(name: 'lang', required: true) required this.lang,
      @JsonKey(name: 'is_nsfw', required: true) required this.isNsfw});

  factory _$GetExtensionsContentItemDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetExtensionsContentItemDtoImplFromJson(json);

  @override
  @JsonKey(name: 'repo_base_url', required: true)
  final String repoBaseUrl;
  @override
  @JsonKey(name: 'pkg_name', required: true)
  final String pkgName;
  @override
  @JsonKey(name: 'display_name', required: true)
  final String displayName;
  @override
  @JsonKey(name: 'zip_name', required: true)
  final String zipName;
  @override
  @JsonKey(name: 'address', required: true)
  final String address;
  @override
  @JsonKey(name: 'version', required: true)
  final int version;
  @override
  @JsonKey(name: 'python_version', required: true)
  final int pythonVersion;
  @override
  @JsonKey(name: 'lang', required: true)
  final String lang;
  @override
  @JsonKey(name: 'is_nsfw', required: true)
  final bool isNsfw;

  @override
  String toString() {
    return 'GetExtensionsContentItemDto(repoBaseUrl: $repoBaseUrl, pkgName: $pkgName, displayName: $displayName, zipName: $zipName, address: $address, version: $version, pythonVersion: $pythonVersion, lang: $lang, isNsfw: $isNsfw)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetExtensionsContentItemDtoImpl &&
            (identical(other.repoBaseUrl, repoBaseUrl) ||
                other.repoBaseUrl == repoBaseUrl) &&
            (identical(other.pkgName, pkgName) || other.pkgName == pkgName) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.zipName, zipName) || other.zipName == zipName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.pythonVersion, pythonVersion) ||
                other.pythonVersion == pythonVersion) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, repoBaseUrl, pkgName,
      displayName, zipName, address, version, pythonVersion, lang, isNsfw);

  /// Create a copy of GetExtensionsContentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetExtensionsContentItemDtoImplCopyWith<_$GetExtensionsContentItemDtoImpl>
      get copyWith => __$$GetExtensionsContentItemDtoImplCopyWithImpl<
          _$GetExtensionsContentItemDtoImpl>(this, _$identity);
}

abstract class _GetExtensionsContentItemDto
    implements GetExtensionsContentItemDto {
  const factory _GetExtensionsContentItemDto(
      {@JsonKey(name: 'repo_base_url', required: true)
      required final String repoBaseUrl,
      @JsonKey(name: 'pkg_name', required: true) required final String pkgName,
      @JsonKey(name: 'display_name', required: true)
      required final String displayName,
      @JsonKey(name: 'zip_name', required: true) required final String zipName,
      @JsonKey(name: 'address', required: true) required final String address,
      @JsonKey(name: 'version', required: true) required final int version,
      @JsonKey(name: 'python_version', required: true)
      required final int pythonVersion,
      @JsonKey(name: 'lang', required: true) required final String lang,
      @JsonKey(name: 'is_nsfw', required: true)
      required final bool isNsfw}) = _$GetExtensionsContentItemDtoImpl;

  factory _GetExtensionsContentItemDto.fromJson(Map<String, dynamic> json) =
      _$GetExtensionsContentItemDtoImpl.fromJson;

  @override
  @JsonKey(name: 'repo_base_url', required: true)
  String get repoBaseUrl;
  @override
  @JsonKey(name: 'pkg_name', required: true)
  String get pkgName;
  @override
  @JsonKey(name: 'display_name', required: true)
  String get displayName;
  @override
  @JsonKey(name: 'zip_name', required: true)
  String get zipName;
  @override
  @JsonKey(name: 'address', required: true)
  String get address;
  @override
  @JsonKey(name: 'version', required: true)
  int get version;
  @override
  @JsonKey(name: 'python_version', required: true)
  int get pythonVersion;
  @override
  @JsonKey(name: 'lang', required: true)
  String get lang;
  @override
  @JsonKey(name: 'is_nsfw', required: true)
  bool get isNsfw;

  /// Create a copy of GetExtensionsContentItemDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetExtensionsContentItemDtoImplCopyWith<_$GetExtensionsContentItemDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
