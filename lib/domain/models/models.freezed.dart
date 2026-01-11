// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Board {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  String get largeWelcomeImage => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  Set<String> get supportedThreadsSorting => throw _privateConstructorUsedError;
  String? get selectedThreadsSorting => throw _privateConstructorUsedError;

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoardCopyWith<Board> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoardCopyWith<$Res> {
  factory $BoardCopyWith(Board value, $Res Function(Board) then) =
      _$BoardCopyWithImpl<$Res, Board>;
  @useResult
  $Res call(
      {String extensionPkgName,
      String id,
      String name,
      String icon,
      String largeWelcomeImage,
      String url,
      Set<String> supportedThreadsSorting,
      String? selectedThreadsSorting});
}

/// @nodoc
class _$BoardCopyWithImpl<$Res, $Val extends Board>
    implements $BoardCopyWith<$Res> {
  _$BoardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? largeWelcomeImage = null,
    Object? url = null,
    Object? supportedThreadsSorting = null,
    Object? selectedThreadsSorting = freezed,
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
      selectedThreadsSorting: freezed == selectedThreadsSorting
          ? _value.selectedThreadsSorting
          : selectedThreadsSorting // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoardImplCopyWith<$Res> implements $BoardCopyWith<$Res> {
  factory _$$BoardImplCopyWith(
          _$BoardImpl value, $Res Function(_$BoardImpl) then) =
      __$$BoardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String extensionPkgName,
      String id,
      String name,
      String icon,
      String largeWelcomeImage,
      String url,
      Set<String> supportedThreadsSorting,
      String? selectedThreadsSorting});
}

/// @nodoc
class __$$BoardImplCopyWithImpl<$Res>
    extends _$BoardCopyWithImpl<$Res, _$BoardImpl>
    implements _$$BoardImplCopyWith<$Res> {
  __$$BoardImplCopyWithImpl(
      _$BoardImpl _value, $Res Function(_$BoardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? id = null,
    Object? name = null,
    Object? icon = null,
    Object? largeWelcomeImage = null,
    Object? url = null,
    Object? supportedThreadsSorting = null,
    Object? selectedThreadsSorting = freezed,
  }) {
    return _then(_$BoardImpl(
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
      selectedThreadsSorting: freezed == selectedThreadsSorting
          ? _value.selectedThreadsSorting
          : selectedThreadsSorting // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$BoardImpl with DiagnosticableTreeMixin implements _Board {
  const _$BoardImpl(
      {required this.extensionPkgName,
      required this.id,
      required this.name,
      required this.icon,
      required this.largeWelcomeImage,
      required this.url,
      required final Set<String> supportedThreadsSorting,
      this.selectedThreadsSorting})
      : _supportedThreadsSorting = supportedThreadsSorting;

  @override
  final String extensionPkgName;
  @override
  final String id;
  @override
  final String name;
  @override
  final String icon;
  @override
  final String largeWelcomeImage;
  @override
  final String url;
  final Set<String> _supportedThreadsSorting;
  @override
  Set<String> get supportedThreadsSorting {
    if (_supportedThreadsSorting is EqualUnmodifiableSetView)
      return _supportedThreadsSorting;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_supportedThreadsSorting);
  }

  @override
  final String? selectedThreadsSorting;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Board(extensionPkgName: $extensionPkgName, id: $id, name: $name, icon: $icon, largeWelcomeImage: $largeWelcomeImage, url: $url, supportedThreadsSorting: $supportedThreadsSorting, selectedThreadsSorting: $selectedThreadsSorting)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Board'))
      ..add(DiagnosticsProperty('extensionPkgName', extensionPkgName))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('icon', icon))
      ..add(DiagnosticsProperty('largeWelcomeImage', largeWelcomeImage))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty(
          'supportedThreadsSorting', supportedThreadsSorting))
      ..add(DiagnosticsProperty(
          'selectedThreadsSorting', selectedThreadsSorting));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoardImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.largeWelcomeImage, largeWelcomeImage) ||
                other.largeWelcomeImage == largeWelcomeImage) &&
            (identical(other.url, url) || other.url == url) &&
            const DeepCollectionEquality().equals(
                other._supportedThreadsSorting, _supportedThreadsSorting) &&
            (identical(other.selectedThreadsSorting, selectedThreadsSorting) ||
                other.selectedThreadsSorting == selectedThreadsSorting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      extensionPkgName,
      id,
      name,
      icon,
      largeWelcomeImage,
      url,
      const DeepCollectionEquality().hash(_supportedThreadsSorting),
      selectedThreadsSorting);

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      __$$BoardImplCopyWithImpl<_$BoardImpl>(this, _$identity);
}

abstract class _Board implements Board {
  const factory _Board(
      {required final String extensionPkgName,
      required final String id,
      required final String name,
      required final String icon,
      required final String largeWelcomeImage,
      required final String url,
      required final Set<String> supportedThreadsSorting,
      final String? selectedThreadsSorting}) = _$BoardImpl;

  @override
  String get extensionPkgName;
  @override
  String get id;
  @override
  String get name;
  @override
  String get icon;
  @override
  String get largeWelcomeImage;
  @override
  String get url;
  @override
  Set<String> get supportedThreadsSorting;
  @override
  String? get selectedThreadsSorting;

  /// Create a copy of Board
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BoardImplCopyWith<_$BoardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThreadsFilter {
  Map<String, String> get boardSorts => throw _privateConstructorUsedError;
  String get keywords => throw _privateConstructorUsedError;

  /// Serializes this ThreadsFilter to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadsFilterCopyWith<ThreadsFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadsFilterCopyWith<$Res> {
  factory $ThreadsFilterCopyWith(
          ThreadsFilter value, $Res Function(ThreadsFilter) then) =
      _$ThreadsFilterCopyWithImpl<$Res, ThreadsFilter>;
  @useResult
  $Res call({Map<String, String> boardSorts, String keywords});
}

/// @nodoc
class _$ThreadsFilterCopyWithImpl<$Res, $Val extends ThreadsFilter>
    implements $ThreadsFilterCopyWith<$Res> {
  _$ThreadsFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardSorts = null,
    Object? keywords = null,
  }) {
    return _then(_value.copyWith(
      boardSorts: null == boardSorts
          ? _value.boardSorts
          : boardSorts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadsFilterImplCopyWith<$Res>
    implements $ThreadsFilterCopyWith<$Res> {
  factory _$$ThreadsFilterImplCopyWith(
          _$ThreadsFilterImpl value, $Res Function(_$ThreadsFilterImpl) then) =
      __$$ThreadsFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, String> boardSorts, String keywords});
}

/// @nodoc
class __$$ThreadsFilterImplCopyWithImpl<$Res>
    extends _$ThreadsFilterCopyWithImpl<$Res, _$ThreadsFilterImpl>
    implements _$$ThreadsFilterImplCopyWith<$Res> {
  __$$ThreadsFilterImplCopyWithImpl(
      _$ThreadsFilterImpl _value, $Res Function(_$ThreadsFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardSorts = null,
    Object? keywords = null,
  }) {
    return _then(_$ThreadsFilterImpl(
      boardSorts: null == boardSorts
          ? _value._boardSorts
          : boardSorts // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      keywords: null == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ThreadsFilterImpl
    with DiagnosticableTreeMixin
    implements _ThreadsFilter {
  const _$ThreadsFilterImpl(
      {required final Map<String, String> boardSorts, required this.keywords})
      : _boardSorts = boardSorts;

  final Map<String, String> _boardSorts;
  @override
  Map<String, String> get boardSorts {
    if (_boardSorts is EqualUnmodifiableMapView) return _boardSorts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_boardSorts);
  }

  @override
  final String keywords;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadsFilter(boardSorts: $boardSorts, keywords: $keywords)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadsFilter'))
      ..add(DiagnosticsProperty('boardSorts', boardSorts))
      ..add(DiagnosticsProperty('keywords', keywords));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsFilterImpl &&
            const DeepCollectionEquality()
                .equals(other._boardSorts, _boardSorts) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_boardSorts), keywords);

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadsFilterImplCopyWith<_$ThreadsFilterImpl> get copyWith =>
      __$$ThreadsFilterImplCopyWithImpl<_$ThreadsFilterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadsFilterImplToJson(
      this,
    );
  }
}

abstract class _ThreadsFilter implements ThreadsFilter {
  const factory _ThreadsFilter(
      {required final Map<String, String> boardSorts,
      required final String keywords}) = _$ThreadsFilterImpl;

  @override
  Map<String, String> get boardSorts;
  @override
  String get keywords;

  /// Create a copy of ThreadsFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadsFilterImplCopyWith<_$ThreadsFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ThreadsSorting {
  List<String> get boardsOrder => throw _privateConstructorUsedError;

  /// Serializes this ThreadsSorting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ThreadsSortingCopyWith<ThreadsSorting> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ThreadsSortingCopyWith<$Res> {
  factory $ThreadsSortingCopyWith(
          ThreadsSorting value, $Res Function(ThreadsSorting) then) =
      _$ThreadsSortingCopyWithImpl<$Res, ThreadsSorting>;
  @useResult
  $Res call({List<String> boardsOrder});
}

/// @nodoc
class _$ThreadsSortingCopyWithImpl<$Res, $Val extends ThreadsSorting>
    implements $ThreadsSortingCopyWith<$Res> {
  _$ThreadsSortingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardsOrder = null,
  }) {
    return _then(_value.copyWith(
      boardsOrder: null == boardsOrder
          ? _value.boardsOrder
          : boardsOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ThreadsSortingImplCopyWith<$Res>
    implements $ThreadsSortingCopyWith<$Res> {
  factory _$$ThreadsSortingImplCopyWith(_$ThreadsSortingImpl value,
          $Res Function(_$ThreadsSortingImpl) then) =
      __$$ThreadsSortingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> boardsOrder});
}

/// @nodoc
class __$$ThreadsSortingImplCopyWithImpl<$Res>
    extends _$ThreadsSortingCopyWithImpl<$Res, _$ThreadsSortingImpl>
    implements _$$ThreadsSortingImplCopyWith<$Res> {
  __$$ThreadsSortingImplCopyWithImpl(
      _$ThreadsSortingImpl _value, $Res Function(_$ThreadsSortingImpl) _then)
      : super(_value, _then);

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boardsOrder = null,
  }) {
    return _then(_$ThreadsSortingImpl(
      boardsOrder: null == boardsOrder
          ? _value._boardsOrder
          : boardsOrder // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$ThreadsSortingImpl
    with DiagnosticableTreeMixin
    implements _ThreadsSorting {
  const _$ThreadsSortingImpl({required final List<String> boardsOrder})
      : _boardsOrder = boardsOrder;

  final List<String> _boardsOrder;
  @override
  List<String> get boardsOrder {
    if (_boardsOrder is EqualUnmodifiableListView) return _boardsOrder;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boardsOrder);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ThreadsSorting(boardsOrder: $boardsOrder)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ThreadsSorting'))
      ..add(DiagnosticsProperty('boardsOrder', boardsOrder));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ThreadsSortingImpl &&
            const DeepCollectionEquality()
                .equals(other._boardsOrder, _boardsOrder));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_boardsOrder));

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ThreadsSortingImplCopyWith<_$ThreadsSortingImpl> get copyWith =>
      __$$ThreadsSortingImplCopyWithImpl<_$ThreadsSortingImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ThreadsSortingImplToJson(
      this,
    );
  }
}

abstract class _ThreadsSorting implements ThreadsSorting {
  const factory _ThreadsSorting({required final List<String> boardsOrder}) =
      _$ThreadsSortingImpl;

  @override
  List<String> get boardsOrder;

  /// Create a copy of ThreadsSorting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ThreadsSortingImplCopyWith<_$ThreadsSortingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
