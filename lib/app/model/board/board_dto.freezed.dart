// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'board_dto.dart';

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
  Set<String> get supportedThreadsSorting => throw _privateConstructorUsedError;

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
      Set<String> supportedThreadsSorting});
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
    Object? supportedThreadsSorting = null,
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
      supportedThreadsSorting: null == supportedThreadsSorting
          ? _value.supportedThreadsSorting
          : supportedThreadsSorting // ignore: cast_nullable_to_non_nullable
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
      Set<String> supportedThreadsSorting});
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
    Object? supportedThreadsSorting = null,
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
      supportedThreadsSorting: null == supportedThreadsSorting
          ? _value._supportedThreadsSorting
          : supportedThreadsSorting // ignore: cast_nullable_to_non_nullable
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
      required final Set<String> supportedThreadsSorting})
      : _supportedThreadsSorting = supportedThreadsSorting;

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
  final Set<String> _supportedThreadsSorting;
  @override
  @JsonKey(name: 'supported_sorting', required: true)
  Set<String> get supportedThreadsSorting {
    if (_supportedThreadsSorting is EqualUnmodifiableSetView)
      return _supportedThreadsSorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_supportedThreadsSorting);
  }

  @override
  String toString() {
    return 'BoardDto(extensionPkgName: $extensionPkgName, siteId: $siteId, id: $id, name: $name, icon: $icon, largeWelcomeImage: $largeWelcomeImage, url: $url, supportedThreadsSorting: $supportedThreadsSorting)';
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
            const DeepCollectionEquality().equals(
                other._supportedThreadsSorting, _supportedThreadsSorting));
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
      const DeepCollectionEquality().hash(_supportedThreadsSorting));

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
      required final Set<String> supportedThreadsSorting}) = _$BoardDtoImpl;

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
  Set<String> get supportedThreadsSorting;

  /// Create a copy of BoardDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardDtoImplCopyWith<_$BoardDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
