// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_dto.dart';

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
