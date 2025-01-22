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

BoardsDto _$BoardsDtoFromJson(Map<String, dynamic> json) {
  return _BoardsDto.fromJson(json);
}

/// @nodoc
mixin _$BoardsDto {
  @JsonKey(name: 'total_page', required: true)
  int get totalPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_page', required: true)
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards => throw _privateConstructorUsedError;

  /// Serializes this BoardsDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoardsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardsDtoCopyWith<BoardsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardsDtoCopyWith<$Res> {
  factory $BoardsDtoCopyWith(BoardsDto value, $Res Function(BoardsDto) then) =
      _$BoardsDtoCopyWithImpl<$Res, BoardsDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) int currentPage,
      @JsonKey(name: 'boards', required: true) List<BoardDto> boards});
}

/// @nodoc
class _$BoardsDtoCopyWithImpl<$Res, $Val extends BoardsDto>
    implements $BoardsDtoCopyWith<$Res> {
  _$BoardsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? boards = null,
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
      boards: null == boards
          ? _value.boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardDto>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardsDtoImplCopyWith<$Res>
    implements $BoardsDtoCopyWith<$Res> {
  factory _$$BoardsDtoImplCopyWith(
          _$BoardsDtoImpl value, $Res Function(_$BoardsDtoImpl) then) =
      __$$BoardsDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_page', required: true) int totalPage,
      @JsonKey(name: 'current_page', required: true) int currentPage,
      @JsonKey(name: 'boards', required: true) List<BoardDto> boards});
}

/// @nodoc
class __$$BoardsDtoImplCopyWithImpl<$Res>
    extends _$BoardsDtoCopyWithImpl<$Res, _$BoardsDtoImpl>
    implements _$$BoardsDtoImplCopyWith<$Res> {
  __$$BoardsDtoImplCopyWithImpl(
      _$BoardsDtoImpl _value, $Res Function(_$BoardsDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoardsDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalPage = null,
    Object? currentPage = null,
    Object? boards = null,
  }) {
    return _then(_$BoardsDtoImpl(
      totalPage: null == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int,
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      boards: null == boards
          ? _value._boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardsDtoImpl implements _BoardsDto {
  const _$BoardsDtoImpl(
      {@JsonKey(name: 'total_page', required: true) required this.totalPage,
      @JsonKey(name: 'current_page', required: true) required this.currentPage,
      @JsonKey(name: 'boards', required: true)
      required final List<BoardDto> boards})
      : _boards = boards;

  factory _$BoardsDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardsDtoImplFromJson(json);

  @override
  @JsonKey(name: 'total_page', required: true)
  final int totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  final int currentPage;
  final List<BoardDto> _boards;
  @override
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards {
    if (_boards is EqualUnmodifiableListView) return _boards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boards);
  }

  @override
  String toString() {
    return 'BoardsDto(totalPage: $totalPage, currentPage: $currentPage, boards: $boards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardsDtoImpl &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._boards, _boards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalPage, currentPage,
      const DeepCollectionEquality().hash(_boards));

  /// Create a copy of BoardsDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardsDtoImplCopyWith<_$BoardsDtoImpl> get copyWith =>
      __$$BoardsDtoImplCopyWithImpl<_$BoardsDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardsDtoImplToJson(
      this,
    );
  }
}

abstract class _BoardsDto implements BoardsDto {
  const factory _BoardsDto(
      {@JsonKey(name: 'total_page', required: true)
      required final int totalPage,
      @JsonKey(name: 'current_page', required: true)
      required final int currentPage,
      @JsonKey(name: 'boards', required: true)
      required final List<BoardDto> boards}) = _$BoardsDtoImpl;

  factory _BoardsDto.fromJson(Map<String, dynamic> json) =
      _$BoardsDtoImpl.fromJson;

  @override
  @JsonKey(name: 'total_page', required: true)
  int get totalPage;
  @override
  @JsonKey(name: 'current_page', required: true)
  int get currentPage;
  @override
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards;

  /// Create a copy of BoardsDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardsDtoImplCopyWith<_$BoardsDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BoardDto _$BoardDtoFromJson(Map<String, dynamic> json) {
  return _BoardDto.fromJson(json);
}

/// @nodoc
mixin _$BoardDto {
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName => throw _privateConstructorUsedError;
  @JsonKey(name: 'site_id', required: true)
  String get siteId => throw _privateConstructorUsedError;
  @JsonKey(name: 'id', required: true)
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', required: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'icon', required: true)
  String get icon => throw _privateConstructorUsedError;
  @JsonKey(name: 'large_welcome_image', required: true)
  String get largeWelcomeImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'url', required: true)
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'supported_sorting', required: true)
  Set<String> get supportedSorting => throw _privateConstructorUsedError;

  /// Serializes this BoardDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BoardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardDtoCopyWith<BoardDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardDtoCopyWith<$Res> {
  factory $BoardDtoCopyWith(BoardDto value, $Res Function(BoardDto) then) =
      _$BoardDtoCopyWithImpl<$Res, BoardDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) String siteId,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'large_welcome_image', required: true)
      String largeWelcomeImage,
      @JsonKey(name: 'url', required: true) String url,
      @JsonKey(name: 'supported_sorting', required: true)
      Set<String> supportedSorting});
}

/// @nodoc
class _$BoardDtoCopyWithImpl<$Res, $Val extends BoardDto>
    implements $BoardDtoCopyWith<$Res> {
  _$BoardDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BoardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? largeWelcomeImage = null,
    Object? url = null,
    Object? supportedSorting = null,
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
      largeWelcomeImage: null == largeWelcomeImage
          ? _value.largeWelcomeImage
          : largeWelcomeImage // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      supportedSorting: null == supportedSorting
          ? _value.supportedSorting
          : supportedSorting // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardDtoImplCopyWith<$Res>
    implements $BoardDtoCopyWith<$Res> {
  factory _$$BoardDtoImplCopyWith(
          _$BoardDtoImpl value, $Res Function(_$BoardDtoImpl) then) =
      __$$BoardDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) String siteId,
      @JsonKey(name: 'id', required: true) String id,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'icon', required: true) String icon,
      @JsonKey(name: 'large_welcome_image', required: true)
      String largeWelcomeImage,
      @JsonKey(name: 'url', required: true) String url,
      @JsonKey(name: 'supported_sorting', required: true)
      Set<String> supportedSorting});
}

/// @nodoc
class __$$BoardDtoImplCopyWithImpl<$Res>
    extends _$BoardDtoCopyWithImpl<$Res, _$BoardDtoImpl>
    implements _$$BoardDtoImplCopyWith<$Res> {
  __$$BoardDtoImplCopyWithImpl(
      _$BoardDtoImpl _value, $Res Function(_$BoardDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of BoardDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? largeWelcomeImage = null,
    Object? url = null,
    Object? supportedSorting = null,
  }) {
    return _then(_$BoardDtoImpl(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
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
      largeWelcomeImage: null == largeWelcomeImage
          ? _value.largeWelcomeImage
          : largeWelcomeImage // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      supportedSorting: null == supportedSorting
          ? _value._supportedSorting
          : supportedSorting // ignore: cast_nullable_to_non_nullable
              as Set<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoardDtoImpl implements _BoardDto {
  const _$BoardDtoImpl(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required this.extensionPkgName,
      @JsonKey(name: 'site_id', required: true) required this.siteId,
      @JsonKey(name: 'id', required: true) required this.id,
      @JsonKey(name: 'name', required: true) required this.name,
      @JsonKey(name: 'icon', required: true) required this.icon,
      @JsonKey(name: 'large_welcome_image', required: true)
      required this.largeWelcomeImage,
      @JsonKey(name: 'url', required: true) required this.url,
      @JsonKey(name: 'supported_sorting', required: true)
      required final Set<String> supportedSorting})
      : _supportedSorting = supportedSorting;

  factory _$BoardDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoardDtoImplFromJson(json);

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  final String extensionPkgName;
  @override
  @JsonKey(name: 'site_id', required: true)
  final String siteId;
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
  @JsonKey(name: 'large_welcome_image', required: true)
  final String largeWelcomeImage;
  @override
  @JsonKey(name: 'url', required: true)
  final String url;
  final Set<String> _supportedSorting;
  @override
  @JsonKey(name: 'supported_sorting', required: true)
  Set<String> get supportedSorting {
    if (_supportedSorting is EqualUnmodifiableSetView) return _supportedSorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_supportedSorting);
  }

  @override
  String toString() {
    return 'BoardDto(extensionPkgName: $extensionPkgName, siteId: $siteId, id: $id, name: $name, icon: $icon, largeWelcomeImage: $largeWelcomeImage, url: $url, supportedSorting: $supportedSorting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardDtoImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.largeWelcomeImage, largeWelcomeImage) ||
                other.largeWelcomeImage == largeWelcomeImage) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality()
                .equals(other._supportedSorting, _supportedSorting));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      extensionPkgName,
      siteId,
      id,
      name,
      icon,
      largeWelcomeImage,
      url,
      const DeepCollectionEquality().hash(_supportedSorting));

  /// Create a copy of BoardDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardDtoImplCopyWith<_$BoardDtoImpl> get copyWith =>
      __$$BoardDtoImplCopyWithImpl<_$BoardDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoardDtoImplToJson(
      this,
    );
  }
}

abstract class _BoardDto implements BoardDto {
  const factory _BoardDto(
      {@JsonKey(name: 'extension_pkg_name', required: true)
      required final String extensionPkgName,
      @JsonKey(name: 'site_id', required: true) required final String siteId,
      @JsonKey(name: 'id', required: true) required final String id,
      @JsonKey(name: 'name', required: true) required final String name,
      @JsonKey(name: 'icon', required: true) required final String icon,
      @JsonKey(name: 'large_welcome_image', required: true)
      required final String largeWelcomeImage,
      @JsonKey(name: 'url', required: true) required final String url,
      @JsonKey(name: 'supported_sorting', required: true)
      required final Set<String> supportedSorting}) = _$BoardDtoImpl;

  factory _BoardDto.fromJson(Map<String, dynamic> json) =
      _$BoardDtoImpl.fromJson;

  @override
  @JsonKey(name: 'extension_pkg_name', required: true)
  String get extensionPkgName;
  @override
  @JsonKey(name: 'site_id', required: true)
  String get siteId;
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
  @JsonKey(name: 'large_welcome_image', required: true)
  String get largeWelcomeImage;
  @override
  @JsonKey(name: 'url', required: true)
  String get url;
  @override
  @JsonKey(name: 'supported_sorting', required: true)
  Set<String> get supportedSorting;

  /// Create a copy of BoardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardDtoImplCopyWith<_$BoardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

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

ExtensionDto _$ExtensionDtoFromJson(Map<String, dynamic> json) {
  return _ExtensionDto.fromJson(json);
}

/// @nodoc
mixin _$ExtensionDto {
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
  @JsonKey(name: 'site', required: true)
  SiteDto get site => throw _privateConstructorUsedError;
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards => throw _privateConstructorUsedError;

  /// Serializes this ExtensionDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionDtoCopyWith<ExtensionDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionDtoCopyWith<$Res> {
  factory $ExtensionDtoCopyWith(
          ExtensionDto value, $Res Function(ExtensionDto) then) =
      _$ExtensionDtoCopyWithImpl<$Res, ExtensionDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'pkg_name', required: true) String pkgName,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'zip_name', required: true) String zipName,
      @JsonKey(name: 'address', required: true) String address,
      @JsonKey(name: 'version', required: true) int version,
      @JsonKey(name: 'python_version', required: true) int pythonVersion,
      @JsonKey(name: 'lang', required: true) String lang,
      @JsonKey(name: 'is_nsfw', required: true) bool isNsfw,
      @JsonKey(name: 'site', required: true) SiteDto site,
      @JsonKey(name: 'boards', required: true) List<BoardDto> boards});

  $SiteDtoCopyWith<$Res> get site;
}

/// @nodoc
class _$ExtensionDtoCopyWithImpl<$Res, $Val extends ExtensionDto>
    implements $ExtensionDtoCopyWith<$Res> {
  _$ExtensionDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pkgName = null,
    Object? displayName = null,
    Object? zipName = null,
    Object? address = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = null,
    Object? isNsfw = null,
    Object? site = null,
    Object? boards = null,
  }) {
    return _then(_value.copyWith(
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
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as SiteDto,
      boards: null == boards
          ? _value.boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardDto>,
    ) as $Val);
  }

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SiteDtoCopyWith<$Res> get site {
    return $SiteDtoCopyWith<$Res>(_value.site, (value) {
      return _then(_value.copyWith(site: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ExtensionDtoImplCopyWith<$Res>
    implements $ExtensionDtoCopyWith<$Res> {
  factory _$$ExtensionDtoImplCopyWith(
          _$ExtensionDtoImpl value, $Res Function(_$ExtensionDtoImpl) then) =
      __$$ExtensionDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pkg_name', required: true) String pkgName,
      @JsonKey(name: 'display_name', required: true) String displayName,
      @JsonKey(name: 'zip_name', required: true) String zipName,
      @JsonKey(name: 'address', required: true) String address,
      @JsonKey(name: 'version', required: true) int version,
      @JsonKey(name: 'python_version', required: true) int pythonVersion,
      @JsonKey(name: 'lang', required: true) String lang,
      @JsonKey(name: 'is_nsfw', required: true) bool isNsfw,
      @JsonKey(name: 'site', required: true) SiteDto site,
      @JsonKey(name: 'boards', required: true) List<BoardDto> boards});

  @override
  $SiteDtoCopyWith<$Res> get site;
}

/// @nodoc
class __$$ExtensionDtoImplCopyWithImpl<$Res>
    extends _$ExtensionDtoCopyWithImpl<$Res, _$ExtensionDtoImpl>
    implements _$$ExtensionDtoImplCopyWith<$Res> {
  __$$ExtensionDtoImplCopyWithImpl(
      _$ExtensionDtoImpl _value, $Res Function(_$ExtensionDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pkgName = null,
    Object? displayName = null,
    Object? zipName = null,
    Object? address = null,
    Object? version = null,
    Object? pythonVersion = null,
    Object? lang = null,
    Object? isNsfw = null,
    Object? site = null,
    Object? boards = null,
  }) {
    return _then(_$ExtensionDtoImpl(
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
      site: null == site
          ? _value.site
          : site // ignore: cast_nullable_to_non_nullable
              as SiteDto,
      boards: null == boards
          ? _value._boards
          : boards // ignore: cast_nullable_to_non_nullable
              as List<BoardDto>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExtensionDtoImpl implements _ExtensionDto {
  const _$ExtensionDtoImpl(
      {@JsonKey(name: 'pkg_name', required: true) required this.pkgName,
      @JsonKey(name: 'display_name', required: true) required this.displayName,
      @JsonKey(name: 'zip_name', required: true) required this.zipName,
      @JsonKey(name: 'address', required: true) required this.address,
      @JsonKey(name: 'version', required: true) required this.version,
      @JsonKey(name: 'python_version', required: true)
      required this.pythonVersion,
      @JsonKey(name: 'lang', required: true) required this.lang,
      @JsonKey(name: 'is_nsfw', required: true) required this.isNsfw,
      @JsonKey(name: 'site', required: true) required this.site,
      @JsonKey(name: 'boards', required: true)
      required final List<BoardDto> boards})
      : _boards = boards;

  factory _$ExtensionDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionDtoImplFromJson(json);

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
  @JsonKey(name: 'site', required: true)
  final SiteDto site;
  final List<BoardDto> _boards;
  @override
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards {
    if (_boards is EqualUnmodifiableListView) return _boards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boards);
  }

  @override
  String toString() {
    return 'ExtensionDto(pkgName: $pkgName, displayName: $displayName, zipName: $zipName, address: $address, version: $version, pythonVersion: $pythonVersion, lang: $lang, isNsfw: $isNsfw, site: $site, boards: $boards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionDtoImpl &&
            (identical(other.pkgName, pkgName) || other.pkgName == pkgName) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.zipName, zipName) || other.zipName == zipName) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.pythonVersion, pythonVersion) ||
                other.pythonVersion == pythonVersion) &&
            (identical(other.lang, lang) || other.lang == lang) &&
            (identical(other.isNsfw, isNsfw) || other.isNsfw == isNsfw) &&
            (identical(other.site, site) || other.site == site) &&
            const DeepCollectionEquality().equals(other._boards, _boards));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      pkgName,
      displayName,
      zipName,
      address,
      version,
      pythonVersion,
      lang,
      isNsfw,
      site,
      const DeepCollectionEquality().hash(_boards));

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionDtoImplCopyWith<_$ExtensionDtoImpl> get copyWith =>
      __$$ExtensionDtoImplCopyWithImpl<_$ExtensionDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionDtoImplToJson(
      this,
    );
  }
}

abstract class _ExtensionDto implements ExtensionDto {
  const factory _ExtensionDto(
      {@JsonKey(name: 'pkg_name', required: true) required final String pkgName,
      @JsonKey(name: 'display_name', required: true)
      required final String displayName,
      @JsonKey(name: 'zip_name', required: true) required final String zipName,
      @JsonKey(name: 'address', required: true) required final String address,
      @JsonKey(name: 'version', required: true) required final int version,
      @JsonKey(name: 'python_version', required: true)
      required final int pythonVersion,
      @JsonKey(name: 'lang', required: true) required final String lang,
      @JsonKey(name: 'is_nsfw', required: true) required final bool isNsfw,
      @JsonKey(name: 'site', required: true) required final SiteDto site,
      @JsonKey(name: 'boards', required: true)
      required final List<BoardDto> boards}) = _$ExtensionDtoImpl;

  factory _ExtensionDto.fromJson(Map<String, dynamic> json) =
      _$ExtensionDtoImpl.fromJson;

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
  @override
  @JsonKey(name: 'site', required: true)
  SiteDto get site;
  @override
  @JsonKey(name: 'boards', required: true)
  List<BoardDto> get boards;

  /// Create a copy of ExtensionDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionDtoImplCopyWith<_$ExtensionDtoImpl> get copyWith =>
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

ExtensionRepoDto _$ExtensionRepoDtoFromJson(Map<String, dynamic> json) {
  return _ExtensionRepoDto.fromJson(json);
}

/// @nodoc
mixin _$ExtensionRepoDto {
  @JsonKey(name: 'base_url', required: true)
  String get baseUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'name', required: true)
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'website', required: true)
  String get website => throw _privateConstructorUsedError;
  @JsonKey(name: 'signing_key_fingerprint', required: true)
  String get signingKeyFingerprint => throw _privateConstructorUsedError;

  /// Serializes this ExtensionRepoDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExtensionRepoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExtensionRepoDtoCopyWith<ExtensionRepoDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionRepoDtoCopyWith<$Res> {
  factory $ExtensionRepoDtoCopyWith(
          ExtensionRepoDto value, $Res Function(ExtensionRepoDto) then) =
      _$ExtensionRepoDtoCopyWithImpl<$Res, ExtensionRepoDto>;
  @useResult
  $Res call(
      {@JsonKey(name: 'base_url', required: true) String baseUrl,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'website', required: true) String website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      String signingKeyFingerprint});
}

/// @nodoc
class _$ExtensionRepoDtoCopyWithImpl<$Res, $Val extends ExtensionRepoDto>
    implements $ExtensionRepoDtoCopyWith<$Res> {
  _$ExtensionRepoDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExtensionRepoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? name = null,
    Object? website = null,
    Object? signingKeyFingerprint = null,
  }) {
    return _then(_value.copyWith(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
abstract class _$$ExtensionRepoDtoImplCopyWith<$Res>
    implements $ExtensionRepoDtoCopyWith<$Res> {
  factory _$$ExtensionRepoDtoImplCopyWith(_$ExtensionRepoDtoImpl value,
          $Res Function(_$ExtensionRepoDtoImpl) then) =
      __$$ExtensionRepoDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'base_url', required: true) String baseUrl,
      @JsonKey(name: 'name', required: true) String name,
      @JsonKey(name: 'website', required: true) String website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      String signingKeyFingerprint});
}

/// @nodoc
class __$$ExtensionRepoDtoImplCopyWithImpl<$Res>
    extends _$ExtensionRepoDtoCopyWithImpl<$Res, _$ExtensionRepoDtoImpl>
    implements _$$ExtensionRepoDtoImplCopyWith<$Res> {
  __$$ExtensionRepoDtoImplCopyWithImpl(_$ExtensionRepoDtoImpl _value,
      $Res Function(_$ExtensionRepoDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExtensionRepoDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? baseUrl = null,
    Object? name = null,
    Object? website = null,
    Object? signingKeyFingerprint = null,
  }) {
    return _then(_$ExtensionRepoDtoImpl(
      baseUrl: null == baseUrl
          ? _value.baseUrl
          : baseUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$ExtensionRepoDtoImpl implements _ExtensionRepoDto {
  const _$ExtensionRepoDtoImpl(
      {@JsonKey(name: 'base_url', required: true) required this.baseUrl,
      @JsonKey(name: 'name', required: true) required this.name,
      @JsonKey(name: 'website', required: true) required this.website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      required this.signingKeyFingerprint});

  factory _$ExtensionRepoDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExtensionRepoDtoImplFromJson(json);

  @override
  @JsonKey(name: 'base_url', required: true)
  final String baseUrl;
  @override
  @JsonKey(name: 'name', required: true)
  final String name;
  @override
  @JsonKey(name: 'website', required: true)
  final String website;
  @override
  @JsonKey(name: 'signing_key_fingerprint', required: true)
  final String signingKeyFingerprint;

  @override
  String toString() {
    return 'ExtensionRepoDto(baseUrl: $baseUrl, name: $name, website: $website, signingKeyFingerprint: $signingKeyFingerprint)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExtensionRepoDtoImpl &&
            (identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.website, website) || other.website == website) &&
            (identical(other.signingKeyFingerprint, signingKeyFingerprint) ||
                other.signingKeyFingerprint == signingKeyFingerprint));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, baseUrl, name, website, signingKeyFingerprint);

  /// Create a copy of ExtensionRepoDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExtensionRepoDtoImplCopyWith<_$ExtensionRepoDtoImpl> get copyWith =>
      __$$ExtensionRepoDtoImplCopyWithImpl<_$ExtensionRepoDtoImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExtensionRepoDtoImplToJson(
      this,
    );
  }
}

abstract class _ExtensionRepoDto implements ExtensionRepoDto {
  const factory _ExtensionRepoDto(
      {@JsonKey(name: 'base_url', required: true) required final String baseUrl,
      @JsonKey(name: 'name', required: true) required final String name,
      @JsonKey(name: 'website', required: true) required final String website,
      @JsonKey(name: 'signing_key_fingerprint', required: true)
      required final String signingKeyFingerprint}) = _$ExtensionRepoDtoImpl;

  factory _ExtensionRepoDto.fromJson(Map<String, dynamic> json) =
      _$ExtensionRepoDtoImpl.fromJson;

  @override
  @JsonKey(name: 'base_url', required: true)
  String get baseUrl;
  @override
  @JsonKey(name: 'name', required: true)
  String get name;
  @override
  @JsonKey(name: 'website', required: true)
  String get website;
  @override
  @JsonKey(name: 'signing_key_fingerprint', required: true)
  String get signingKeyFingerprint;

  /// Create a copy of ExtensionRepoDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExtensionRepoDtoImplCopyWith<_$ExtensionRepoDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
