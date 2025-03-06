// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'extension_api_service.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetSiteParams {
  String get extensionPkgName => throw _privateConstructorUsedError;

  /// Serializes this GetSiteParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetSiteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetSiteParamsCopyWith<GetSiteParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetSiteParamsCopyWith<$Res> {
  factory $GetSiteParamsCopyWith(
          GetSiteParams value, $Res Function(GetSiteParams) then) =
      _$GetSiteParamsCopyWithImpl<$Res, GetSiteParams>;
  @useResult
  $Res call({String extensionPkgName});
}

/// @nodoc
class _$GetSiteParamsCopyWithImpl<$Res, $Val extends GetSiteParams>
    implements $GetSiteParamsCopyWith<$Res> {
  _$GetSiteParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetSiteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
  }) {
    return _then(_value.copyWith(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetSiteParamsImplCopyWith<$Res>
    implements $GetSiteParamsCopyWith<$Res> {
  factory _$$GetSiteParamsImplCopyWith(
          _$GetSiteParamsImpl value, $Res Function(_$GetSiteParamsImpl) then) =
      __$$GetSiteParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String extensionPkgName});
}

/// @nodoc
class __$$GetSiteParamsImplCopyWithImpl<$Res>
    extends _$GetSiteParamsCopyWithImpl<$Res, _$GetSiteParamsImpl>
    implements _$$GetSiteParamsImplCopyWith<$Res> {
  __$$GetSiteParamsImplCopyWithImpl(
      _$GetSiteParamsImpl _value, $Res Function(_$GetSiteParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetSiteParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
  }) {
    return _then(_$GetSiteParamsImpl(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$GetSiteParamsImpl implements _GetSiteParams {
  const _$GetSiteParamsImpl({required this.extensionPkgName});

  @override
  final String extensionPkgName;

  @override
  String toString() {
    return 'GetSiteParams(extensionPkgName: $extensionPkgName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetSiteParamsImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, extensionPkgName);

  /// Create a copy of GetSiteParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetSiteParamsImplCopyWith<_$GetSiteParamsImpl> get copyWith =>
      __$$GetSiteParamsImplCopyWithImpl<_$GetSiteParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetSiteParamsImplToJson(
      this,
    );
  }
}

abstract class _GetSiteParams implements GetSiteParams {
  const factory _GetSiteParams({required final String extensionPkgName}) =
      _$GetSiteParamsImpl;

  @override
  String get extensionPkgName;

  /// Create a copy of GetSiteParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetSiteParamsImplCopyWith<_$GetSiteParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetBoardsParams {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;

  /// Serializes this GetBoardsParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetBoardsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetBoardsParamsCopyWith<GetBoardsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetBoardsParamsCopyWith<$Res> {
  factory $GetBoardsParamsCopyWith(
          GetBoardsParams value, $Res Function(GetBoardsParams) then) =
      _$GetBoardsParamsCopyWithImpl<$Res, GetBoardsParams>;
  @useResult
  $Res call({String extensionPkgName, String siteId, Pagination? pagination});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$GetBoardsParamsCopyWithImpl<$Res, $Val extends GetBoardsParams>
    implements $GetBoardsParamsCopyWith<$Res> {
  _$GetBoardsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetBoardsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? pagination = freezed,
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
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ) as $Val);
  }

  /// Create a copy of GetBoardsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetBoardsParamsImplCopyWith<$Res>
    implements $GetBoardsParamsCopyWith<$Res> {
  factory _$$GetBoardsParamsImplCopyWith(_$GetBoardsParamsImpl value,
          $Res Function(_$GetBoardsParamsImpl) then) =
      __$$GetBoardsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String extensionPkgName, String siteId, Pagination? pagination});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$GetBoardsParamsImplCopyWithImpl<$Res>
    extends _$GetBoardsParamsCopyWithImpl<$Res, _$GetBoardsParamsImpl>
    implements _$$GetBoardsParamsImplCopyWith<$Res> {
  __$$GetBoardsParamsImplCopyWithImpl(
      _$GetBoardsParamsImpl _value, $Res Function(_$GetBoardsParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetBoardsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? pagination = freezed,
  }) {
    return _then(_$GetBoardsParamsImpl(
      extensionPkgName: null == extensionPkgName
          ? _value.extensionPkgName
          : extensionPkgName // ignore: cast_nullable_to_non_nullable
              as String,
      siteId: null == siteId
          ? _value.siteId
          : siteId // ignore: cast_nullable_to_non_nullable
              as String,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$GetBoardsParamsImpl implements _GetBoardsParams {
  const _$GetBoardsParamsImpl(
      {required this.extensionPkgName, required this.siteId, this.pagination});

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final Pagination? pagination;

  @override
  String toString() {
    return 'GetBoardsParams(extensionPkgName: $extensionPkgName, siteId: $siteId, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetBoardsParamsImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extensionPkgName, siteId, pagination);

  /// Create a copy of GetBoardsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetBoardsParamsImplCopyWith<_$GetBoardsParamsImpl> get copyWith =>
      __$$GetBoardsParamsImplCopyWithImpl<_$GetBoardsParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetBoardsParamsImplToJson(
      this,
    );
  }
}

abstract class _GetBoardsParams implements GetBoardsParams {
  const factory _GetBoardsParams(
      {required final String extensionPkgName,
      required final String siteId,
      final Pagination? pagination}) = _$GetBoardsParamsImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  Pagination? get pagination;

  /// Create a copy of GetBoardsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetBoardsParamsImplCopyWith<_$GetBoardsParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetThreadInfosParams {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;
  String? get sortBy => throw _privateConstructorUsedError;
  String? get keywords => throw _privateConstructorUsedError;

  /// Serializes this GetThreadInfosParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetThreadInfosParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetThreadInfosParamsCopyWith<GetThreadInfosParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetThreadInfosParamsCopyWith<$Res> {
  factory $GetThreadInfosParamsCopyWith(GetThreadInfosParams value,
          $Res Function(GetThreadInfosParams) then) =
      _$GetThreadInfosParamsCopyWithImpl<$Res, GetThreadInfosParams>;
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      Pagination? pagination,
      String? sortBy,
      String? keywords});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$GetThreadInfosParamsCopyWithImpl<$Res,
        $Val extends GetThreadInfosParams>
    implements $GetThreadInfosParamsCopyWith<$Res> {
  _$GetThreadInfosParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetThreadInfosParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? pagination = freezed,
    Object? sortBy = freezed,
    Object? keywords = freezed,
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
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  /// Create a copy of GetThreadInfosParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetThreadInfosParamsImplCopyWith<$Res>
    implements $GetThreadInfosParamsCopyWith<$Res> {
  factory _$$GetThreadInfosParamsImplCopyWith(_$GetThreadInfosParamsImpl value,
          $Res Function(_$GetThreadInfosParamsImpl) then) =
      __$$GetThreadInfosParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      Pagination? pagination,
      String? sortBy,
      String? keywords});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$GetThreadInfosParamsImplCopyWithImpl<$Res>
    extends _$GetThreadInfosParamsCopyWithImpl<$Res, _$GetThreadInfosParamsImpl>
    implements _$$GetThreadInfosParamsImplCopyWith<$Res> {
  __$$GetThreadInfosParamsImplCopyWithImpl(_$GetThreadInfosParamsImpl _value,
      $Res Function(_$GetThreadInfosParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetThreadInfosParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? pagination = freezed,
    Object? sortBy = freezed,
    Object? keywords = freezed,
  }) {
    return _then(_$GetThreadInfosParamsImpl(
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
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
      sortBy: freezed == sortBy
          ? _value.sortBy
          : sortBy // ignore: cast_nullable_to_non_nullable
              as String?,
      keywords: freezed == keywords
          ? _value.keywords
          : keywords // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$GetThreadInfosParamsImpl implements _GetThreadInfosParams {
  const _$GetThreadInfosParamsImpl(
      {required this.extensionPkgName,
      required this.siteId,
      required this.boardId,
      this.pagination,
      this.sortBy,
      this.keywords});

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final String boardId;
  @override
  final Pagination? pagination;
  @override
  final String? sortBy;
  @override
  final String? keywords;

  @override
  String toString() {
    return 'GetThreadInfosParams(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, pagination: $pagination, sortBy: $sortBy, keywords: $keywords)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetThreadInfosParamsImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination) &&
            (identical(other.sortBy, sortBy) || other.sortBy == sortBy) &&
            (identical(other.keywords, keywords) ||
                other.keywords == keywords));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, extensionPkgName, siteId,
      boardId, pagination, sortBy, keywords);

  /// Create a copy of GetThreadInfosParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetThreadInfosParamsImplCopyWith<_$GetThreadInfosParamsImpl>
      get copyWith =>
          __$$GetThreadInfosParamsImplCopyWithImpl<_$GetThreadInfosParamsImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetThreadInfosParamsImplToJson(
      this,
    );
  }
}

abstract class _GetThreadInfosParams implements GetThreadInfosParams {
  const factory _GetThreadInfosParams(
      {required final String extensionPkgName,
      required final String siteId,
      required final String boardId,
      final Pagination? pagination,
      final String? sortBy,
      final String? keywords}) = _$GetThreadInfosParamsImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  String get boardId;
  @override
  Pagination? get pagination;
  @override
  String? get sortBy;
  @override
  String? get keywords;

  /// Create a copy of GetThreadInfosParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetThreadInfosParamsImplCopyWith<_$GetThreadInfosParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetThreadParams {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  String? get postId => throw _privateConstructorUsedError;

  /// Serializes this GetThreadParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetThreadParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetThreadParamsCopyWith<GetThreadParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetThreadParamsCopyWith<$Res> {
  factory $GetThreadParamsCopyWith(
          GetThreadParams value, $Res Function(GetThreadParams) then) =
      _$GetThreadParamsCopyWithImpl<$Res, GetThreadParams>;
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String? postId});
}

/// @nodoc
class _$GetThreadParamsCopyWithImpl<$Res, $Val extends GetThreadParams>
    implements $GetThreadParamsCopyWith<$Res> {
  _$GetThreadParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetThreadParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? postId = freezed,
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
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetThreadParamsImplCopyWith<$Res>
    implements $GetThreadParamsCopyWith<$Res> {
  factory _$$GetThreadParamsImplCopyWith(_$GetThreadParamsImpl value,
          $Res Function(_$GetThreadParamsImpl) then) =
      __$$GetThreadParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String? postId});
}

/// @nodoc
class __$$GetThreadParamsImplCopyWithImpl<$Res>
    extends _$GetThreadParamsCopyWithImpl<$Res, _$GetThreadParamsImpl>
    implements _$$GetThreadParamsImplCopyWith<$Res> {
  __$$GetThreadParamsImplCopyWithImpl(
      _$GetThreadParamsImpl _value, $Res Function(_$GetThreadParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetThreadParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? postId = freezed,
  }) {
    return _then(_$GetThreadParamsImpl(
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
      postId: freezed == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$GetThreadParamsImpl implements _GetThreadParams {
  const _$GetThreadParamsImpl(
      {required this.extensionPkgName,
      required this.siteId,
      required this.boardId,
      required this.threadId,
      this.postId});

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final String boardId;
  @override
  final String threadId;
  @override
  final String? postId;

  @override
  String toString() {
    return 'GetThreadParams(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, threadId: $threadId, postId: $postId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetThreadParamsImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, extensionPkgName, siteId, boardId, threadId, postId);

  /// Create a copy of GetThreadParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetThreadParamsImplCopyWith<_$GetThreadParamsImpl> get copyWith =>
      __$$GetThreadParamsImplCopyWithImpl<_$GetThreadParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetThreadParamsImplToJson(
      this,
    );
  }
}

abstract class _GetThreadParams implements GetThreadParams {
  const factory _GetThreadParams(
      {required final String extensionPkgName,
      required final String siteId,
      required final String boardId,
      required final String threadId,
      final String? postId}) = _$GetThreadParamsImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  String? get postId;

  /// Create a copy of GetThreadParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetThreadParamsImplCopyWith<_$GetThreadParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetRegardingPostsParams {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  String? get replyToId => throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;

  /// Serializes this GetRegardingPostsParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetRegardingPostsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetRegardingPostsParamsCopyWith<GetRegardingPostsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetRegardingPostsParamsCopyWith<$Res> {
  factory $GetRegardingPostsParamsCopyWith(GetRegardingPostsParams value,
          $Res Function(GetRegardingPostsParams) then) =
      _$GetRegardingPostsParamsCopyWithImpl<$Res, GetRegardingPostsParams>;
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String? replyToId,
      Pagination? pagination});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$GetRegardingPostsParamsCopyWithImpl<$Res,
        $Val extends GetRegardingPostsParams>
    implements $GetRegardingPostsParamsCopyWith<$Res> {
  _$GetRegardingPostsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetRegardingPostsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? replyToId = freezed,
    Object? pagination = freezed,
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
      replyToId: freezed == replyToId
          ? _value.replyToId
          : replyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ) as $Val);
  }

  /// Create a copy of GetRegardingPostsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetRegardingPostsParamsImplCopyWith<$Res>
    implements $GetRegardingPostsParamsCopyWith<$Res> {
  factory _$$GetRegardingPostsParamsImplCopyWith(
          _$GetRegardingPostsParamsImpl value,
          $Res Function(_$GetRegardingPostsParamsImpl) then) =
      __$$GetRegardingPostsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String? replyToId,
      Pagination? pagination});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$GetRegardingPostsParamsImplCopyWithImpl<$Res>
    extends _$GetRegardingPostsParamsCopyWithImpl<$Res,
        _$GetRegardingPostsParamsImpl>
    implements _$$GetRegardingPostsParamsImplCopyWith<$Res> {
  __$$GetRegardingPostsParamsImplCopyWithImpl(
      _$GetRegardingPostsParamsImpl _value,
      $Res Function(_$GetRegardingPostsParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetRegardingPostsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? replyToId = freezed,
    Object? pagination = freezed,
  }) {
    return _then(_$GetRegardingPostsParamsImpl(
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
      replyToId: freezed == replyToId
          ? _value.replyToId
          : replyToId // ignore: cast_nullable_to_non_nullable
              as String?,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$GetRegardingPostsParamsImpl implements _GetRegardingPostsParams {
  const _$GetRegardingPostsParamsImpl(
      {required this.extensionPkgName,
      required this.siteId,
      required this.boardId,
      required this.threadId,
      this.replyToId,
      this.pagination});

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final String boardId;
  @override
  final String threadId;
  @override
  final String? replyToId;
  @override
  final Pagination? pagination;

  @override
  String toString() {
    return 'GetRegardingPostsParams(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, threadId: $threadId, replyToId: $replyToId, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetRegardingPostsParamsImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.replyToId, replyToId) ||
                other.replyToId == replyToId) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, extensionPkgName, siteId,
      boardId, threadId, replyToId, pagination);

  /// Create a copy of GetRegardingPostsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetRegardingPostsParamsImplCopyWith<_$GetRegardingPostsParamsImpl>
      get copyWith => __$$GetRegardingPostsParamsImplCopyWithImpl<
          _$GetRegardingPostsParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetRegardingPostsParamsImplToJson(
      this,
    );
  }
}

abstract class _GetRegardingPostsParams implements GetRegardingPostsParams {
  const factory _GetRegardingPostsParams(
      {required final String extensionPkgName,
      required final String siteId,
      required final String boardId,
      required final String threadId,
      final String? replyToId,
      final Pagination? pagination}) = _$GetRegardingPostsParamsImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  String? get replyToId;
  @override
  Pagination? get pagination;

  /// Create a copy of GetRegardingPostsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetRegardingPostsParamsImplCopyWith<_$GetRegardingPostsParamsImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetPostParams {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this GetPostParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetPostParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetPostParamsCopyWith<GetPostParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetPostParamsCopyWith<$Res> {
  factory $GetPostParamsCopyWith(
          GetPostParams value, $Res Function(GetPostParams) then) =
      _$GetPostParamsCopyWithImpl<$Res, GetPostParams>;
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String id});
}

/// @nodoc
class _$GetPostParamsCopyWithImpl<$Res, $Val extends GetPostParams>
    implements $GetPostParamsCopyWith<$Res> {
  _$GetPostParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetPostParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? id = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetPostParamsImplCopyWith<$Res>
    implements $GetPostParamsCopyWith<$Res> {
  factory _$$GetPostParamsImplCopyWith(
          _$GetPostParamsImpl value, $Res Function(_$GetPostParamsImpl) then) =
      __$$GetPostParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String id});
}

/// @nodoc
class __$$GetPostParamsImplCopyWithImpl<$Res>
    extends _$GetPostParamsCopyWithImpl<$Res, _$GetPostParamsImpl>
    implements _$$GetPostParamsImplCopyWith<$Res> {
  __$$GetPostParamsImplCopyWithImpl(
      _$GetPostParamsImpl _value, $Res Function(_$GetPostParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetPostParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? id = null,
  }) {
    return _then(_$GetPostParamsImpl(
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
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$GetPostParamsImpl implements _GetPostParams {
  const _$GetPostParamsImpl(
      {required this.extensionPkgName,
      required this.siteId,
      required this.boardId,
      required this.threadId,
      required this.id});

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final String boardId;
  @override
  final String threadId;
  @override
  final String id;

  @override
  String toString() {
    return 'GetPostParams(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, threadId: $threadId, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetPostParamsImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, extensionPkgName, siteId, boardId, threadId, id);

  /// Create a copy of GetPostParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetPostParamsImplCopyWith<_$GetPostParamsImpl> get copyWith =>
      __$$GetPostParamsImplCopyWithImpl<_$GetPostParamsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetPostParamsImplToJson(
      this,
    );
  }
}

abstract class _GetPostParams implements GetPostParams {
  const factory _GetPostParams(
      {required final String extensionPkgName,
      required final String siteId,
      required final String boardId,
      required final String threadId,
      required final String id}) = _$GetPostParamsImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  String get id;

  /// Create a copy of GetPostParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetPostParamsImplCopyWith<_$GetPostParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GetCommentsParams {
  String get extensionPkgName => throw _privateConstructorUsedError;
  String get siteId => throw _privateConstructorUsedError;
  String get boardId => throw _privateConstructorUsedError;
  String get threadId => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  Pagination? get pagination => throw _privateConstructorUsedError;

  /// Serializes this GetCommentsParams to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetCommentsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetCommentsParamsCopyWith<GetCommentsParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCommentsParamsCopyWith<$Res> {
  factory $GetCommentsParamsCopyWith(
          GetCommentsParams value, $Res Function(GetCommentsParams) then) =
      _$GetCommentsParamsCopyWithImpl<$Res, GetCommentsParams>;
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String postId,
      Pagination? pagination});

  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class _$GetCommentsParamsCopyWithImpl<$Res, $Val extends GetCommentsParams>
    implements $GetCommentsParamsCopyWith<$Res> {
  _$GetCommentsParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetCommentsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? postId = null,
    Object? pagination = freezed,
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
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ) as $Val);
  }

  /// Create a copy of GetCommentsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginationCopyWith<$Res>? get pagination {
    if (_value.pagination == null) {
      return null;
    }

    return $PaginationCopyWith<$Res>(_value.pagination!, (value) {
      return _then(_value.copyWith(pagination: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$GetCommentsParamsImplCopyWith<$Res>
    implements $GetCommentsParamsCopyWith<$Res> {
  factory _$$GetCommentsParamsImplCopyWith(_$GetCommentsParamsImpl value,
          $Res Function(_$GetCommentsParamsImpl) then) =
      __$$GetCommentsParamsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String extensionPkgName,
      String siteId,
      String boardId,
      String threadId,
      String postId,
      Pagination? pagination});

  @override
  $PaginationCopyWith<$Res>? get pagination;
}

/// @nodoc
class __$$GetCommentsParamsImplCopyWithImpl<$Res>
    extends _$GetCommentsParamsCopyWithImpl<$Res, _$GetCommentsParamsImpl>
    implements _$$GetCommentsParamsImplCopyWith<$Res> {
  __$$GetCommentsParamsImplCopyWithImpl(_$GetCommentsParamsImpl _value,
      $Res Function(_$GetCommentsParamsImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetCommentsParams
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? extensionPkgName = null,
    Object? siteId = null,
    Object? boardId = null,
    Object? threadId = null,
    Object? postId = null,
    Object? pagination = freezed,
  }) {
    return _then(_$GetCommentsParamsImpl(
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
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      pagination: freezed == pagination
          ? _value.pagination
          : pagination // ignore: cast_nullable_to_non_nullable
              as Pagination?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$GetCommentsParamsImpl implements _GetCommentsParams {
  const _$GetCommentsParamsImpl(
      {required this.extensionPkgName,
      required this.siteId,
      required this.boardId,
      required this.threadId,
      required this.postId,
      this.pagination});

  @override
  final String extensionPkgName;
  @override
  final String siteId;
  @override
  final String boardId;
  @override
  final String threadId;
  @override
  final String postId;
  @override
  final Pagination? pagination;

  @override
  String toString() {
    return 'GetCommentsParams(extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId, threadId: $threadId, postId: $postId, pagination: $pagination)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCommentsParamsImpl &&
            (identical(other.extensionPkgName, extensionPkgName) ||
                other.extensionPkgName == extensionPkgName) &&
            (identical(other.siteId, siteId) || other.siteId == siteId) &&
            (identical(other.boardId, boardId) || other.boardId == boardId) &&
            (identical(other.threadId, threadId) ||
                other.threadId == threadId) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.pagination, pagination) ||
                other.pagination == pagination));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, extensionPkgName, siteId,
      boardId, threadId, postId, pagination);

  /// Create a copy of GetCommentsParams
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCommentsParamsImplCopyWith<_$GetCommentsParamsImpl> get copyWith =>
      __$$GetCommentsParamsImplCopyWithImpl<_$GetCommentsParamsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetCommentsParamsImplToJson(
      this,
    );
  }
}

abstract class _GetCommentsParams implements GetCommentsParams {
  const factory _GetCommentsParams(
      {required final String extensionPkgName,
      required final String siteId,
      required final String boardId,
      required final String threadId,
      required final String postId,
      final Pagination? pagination}) = _$GetCommentsParamsImpl;

  @override
  String get extensionPkgName;
  @override
  String get siteId;
  @override
  String get boardId;
  @override
  String get threadId;
  @override
  String get postId;
  @override
  Pagination? get pagination;

  /// Create a copy of GetCommentsParams
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetCommentsParamsImplCopyWith<_$GetCommentsParamsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
