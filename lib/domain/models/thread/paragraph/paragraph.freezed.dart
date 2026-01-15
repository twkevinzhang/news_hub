// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paragraph.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Paragraph _$ParagraphFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'text':
      return TextParagraph.fromJson(json);
    case 'newLine':
      return NewLineParagraph.fromJson(json);
    case 'quote':
      return QuoteParagraph.fromJson(json);
    case 'link':
      return LinkParagraph.fromJson(json);
    case 'replyTo':
      return ReplyToParagraph.fromJson(json);
    case 'image':
      return ImageParagraph.fromJson(json);
    case 'video':
      return VideoParagraph.fromJson(json);

    default:
      throw CheckedFromJsonException(
        json,
        'runtimeType',
        'Paragraph',
        'Invalid union type "${json['runtimeType']}"!',
      );
  }
}

/// @nodoc
mixin _$Paragraph {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Serializes this Paragraph to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParagraphCopyWith<$Res> {
  factory $ParagraphCopyWith(Paragraph value, $Res Function(Paragraph) then) =
      _$ParagraphCopyWithImpl<$Res, Paragraph>;
}

/// @nodoc
class _$ParagraphCopyWithImpl<$Res, $Val extends Paragraph>
    implements $ParagraphCopyWith<$Res> {
  _$ParagraphCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TextParagraphImplCopyWith<$Res> {
  factory _$$TextParagraphImplCopyWith(
    _$TextParagraphImpl value,
    $Res Function(_$TextParagraphImpl) then,
  ) = __$$TextParagraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$TextParagraphImplCopyWithImpl<$Res>
    extends _$ParagraphCopyWithImpl<$Res, _$TextParagraphImpl>
    implements _$$TextParagraphImplCopyWith<$Res> {
  __$$TextParagraphImplCopyWithImpl(
    _$TextParagraphImpl _value,
    $Res Function(_$TextParagraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null}) {
    return _then(
      _$TextParagraphImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$TextParagraphImpl extends TextParagraph {
  const _$TextParagraphImpl({required this.content, final String? $type})
    : $type = $type ?? 'text',
      super._();

  factory _$TextParagraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextParagraphImplFromJson(json);

  @override
  final String content;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Paragraph.text(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextParagraphImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextParagraphImplCopyWith<_$TextParagraphImpl> get copyWith =>
      __$$TextParagraphImplCopyWithImpl<_$TextParagraphImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) {
    return text(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) {
    return text?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) {
    return text(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) {
    return text?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) {
    if (text != null) {
      return text(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$TextParagraphImplToJson(this);
  }
}

abstract class TextParagraph extends Paragraph {
  const factory TextParagraph({required final String content}) =
      _$TextParagraphImpl;
  const TextParagraph._() : super._();

  factory TextParagraph.fromJson(Map<String, dynamic> json) =
      _$TextParagraphImpl.fromJson;

  String get content;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextParagraphImplCopyWith<_$TextParagraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NewLineParagraphImplCopyWith<$Res> {
  factory _$$NewLineParagraphImplCopyWith(
    _$NewLineParagraphImpl value,
    $Res Function(_$NewLineParagraphImpl) then,
  ) = __$$NewLineParagraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String symbol});
}

/// @nodoc
class __$$NewLineParagraphImplCopyWithImpl<$Res>
    extends _$ParagraphCopyWithImpl<$Res, _$NewLineParagraphImpl>
    implements _$$NewLineParagraphImplCopyWith<$Res> {
  __$$NewLineParagraphImplCopyWithImpl(
    _$NewLineParagraphImpl _value,
    $Res Function(_$NewLineParagraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? symbol = null}) {
    return _then(
      _$NewLineParagraphImpl(
        symbol: null == symbol
            ? _value.symbol
            : symbol // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$NewLineParagraphImpl extends NewLineParagraph {
  const _$NewLineParagraphImpl({required this.symbol, final String? $type})
    : $type = $type ?? 'newLine',
      super._();

  factory _$NewLineParagraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewLineParagraphImplFromJson(json);

  @override
  final String symbol;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Paragraph.newLine(symbol: $symbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewLineParagraphImpl &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, symbol);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewLineParagraphImplCopyWith<_$NewLineParagraphImpl> get copyWith =>
      __$$NewLineParagraphImplCopyWithImpl<_$NewLineParagraphImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) {
    return newLine(symbol);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) {
    return newLine?.call(symbol);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) {
    if (newLine != null) {
      return newLine(symbol);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) {
    return newLine(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) {
    return newLine?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) {
    if (newLine != null) {
      return newLine(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NewLineParagraphImplToJson(this);
  }
}

abstract class NewLineParagraph extends Paragraph {
  const factory NewLineParagraph({required final String symbol}) =
      _$NewLineParagraphImpl;
  const NewLineParagraph._() : super._();

  factory NewLineParagraph.fromJson(Map<String, dynamic> json) =
      _$NewLineParagraphImpl.fromJson;

  String get symbol;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewLineParagraphImplCopyWith<_$NewLineParagraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$QuoteParagraphImplCopyWith<$Res> {
  factory _$$QuoteParagraphImplCopyWith(
    _$QuoteParagraphImpl value,
    $Res Function(_$QuoteParagraphImpl) then,
  ) = __$$QuoteParagraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$QuoteParagraphImplCopyWithImpl<$Res>
    extends _$ParagraphCopyWithImpl<$Res, _$QuoteParagraphImpl>
    implements _$$QuoteParagraphImplCopyWith<$Res> {
  __$$QuoteParagraphImplCopyWithImpl(
    _$QuoteParagraphImpl _value,
    $Res Function(_$QuoteParagraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null}) {
    return _then(
      _$QuoteParagraphImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$QuoteParagraphImpl extends QuoteParagraph {
  const _$QuoteParagraphImpl({required this.content, final String? $type})
    : $type = $type ?? 'quote',
      super._();

  factory _$QuoteParagraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$QuoteParagraphImplFromJson(json);

  @override
  final String content;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Paragraph.quote(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QuoteParagraphImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QuoteParagraphImplCopyWith<_$QuoteParagraphImpl> get copyWith =>
      __$$QuoteParagraphImplCopyWithImpl<_$QuoteParagraphImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) {
    return quote(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) {
    return quote?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) {
    if (quote != null) {
      return quote(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) {
    return quote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) {
    return quote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) {
    if (quote != null) {
      return quote(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$QuoteParagraphImplToJson(this);
  }
}

abstract class QuoteParagraph extends Paragraph {
  const factory QuoteParagraph({required final String content}) =
      _$QuoteParagraphImpl;
  const QuoteParagraph._() : super._();

  factory QuoteParagraph.fromJson(Map<String, dynamic> json) =
      _$QuoteParagraphImpl.fromJson;

  String get content;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QuoteParagraphImplCopyWith<_$QuoteParagraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LinkParagraphImplCopyWith<$Res> {
  factory _$$LinkParagraphImplCopyWith(
    _$LinkParagraphImpl value,
    $Res Function(_$LinkParagraphImpl) then,
  ) = __$$LinkParagraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String content});
}

/// @nodoc
class __$$LinkParagraphImplCopyWithImpl<$Res>
    extends _$ParagraphCopyWithImpl<$Res, _$LinkParagraphImpl>
    implements _$$LinkParagraphImplCopyWith<$Res> {
  __$$LinkParagraphImplCopyWithImpl(
    _$LinkParagraphImpl _value,
    $Res Function(_$LinkParagraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? content = null}) {
    return _then(
      _$LinkParagraphImpl(
        content: null == content
            ? _value.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkParagraphImpl extends LinkParagraph {
  const _$LinkParagraphImpl({required this.content, final String? $type})
    : $type = $type ?? 'link',
      super._();

  factory _$LinkParagraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkParagraphImplFromJson(json);

  @override
  final String content;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Paragraph.link(content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkParagraphImpl &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, content);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkParagraphImplCopyWith<_$LinkParagraphImpl> get copyWith =>
      __$$LinkParagraphImplCopyWithImpl<_$LinkParagraphImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) {
    return link(content);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) {
    return link?.call(content);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) {
    if (link != null) {
      return link(content);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) {
    return link(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) {
    return link?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) {
    if (link != null) {
      return link(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkParagraphImplToJson(this);
  }
}

abstract class LinkParagraph extends Paragraph {
  const factory LinkParagraph({required final String content}) =
      _$LinkParagraphImpl;
  const LinkParagraph._() : super._();

  factory LinkParagraph.fromJson(Map<String, dynamic> json) =
      _$LinkParagraphImpl.fromJson;

  String get content;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkParagraphImplCopyWith<_$LinkParagraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReplyToParagraphImplCopyWith<$Res> {
  factory _$$ReplyToParagraphImplCopyWith(
    _$ReplyToParagraphImpl value,
    $Res Function(_$ReplyToParagraphImpl) then,
  ) = __$$ReplyToParagraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String authorName, String preview});
}

/// @nodoc
class __$$ReplyToParagraphImplCopyWithImpl<$Res>
    extends _$ParagraphCopyWithImpl<$Res, _$ReplyToParagraphImpl>
    implements _$$ReplyToParagraphImplCopyWith<$Res> {
  __$$ReplyToParagraphImplCopyWithImpl(
    _$ReplyToParagraphImpl _value,
    $Res Function(_$ReplyToParagraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? authorName = null,
    Object? preview = null,
  }) {
    return _then(
      _$ReplyToParagraphImpl(
        id: null == id
            ? _value.id
            : id // ignore: cast_nullable_to_non_nullable
                  as String,
        authorName: null == authorName
            ? _value.authorName
            : authorName // ignore: cast_nullable_to_non_nullable
                  as String,
        preview: null == preview
            ? _value.preview
            : preview // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ReplyToParagraphImpl extends ReplyToParagraph {
  const _$ReplyToParagraphImpl({
    required this.id,
    required this.authorName,
    required this.preview,
    final String? $type,
  }) : $type = $type ?? 'replyTo',
       super._();

  factory _$ReplyToParagraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReplyToParagraphImplFromJson(json);

  @override
  final String id;
  @override
  final String authorName;
  @override
  final String preview;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Paragraph.replyTo(id: $id, authorName: $authorName, preview: $preview)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReplyToParagraphImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.preview, preview) || other.preview == preview));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, authorName, preview);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReplyToParagraphImplCopyWith<_$ReplyToParagraphImpl> get copyWith =>
      __$$ReplyToParagraphImplCopyWithImpl<_$ReplyToParagraphImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) {
    return replyTo(id, authorName, preview);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) {
    return replyTo?.call(id, authorName, preview);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) {
    if (replyTo != null) {
      return replyTo(id, authorName, preview);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) {
    return replyTo(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) {
    return replyTo?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) {
    if (replyTo != null) {
      return replyTo(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ReplyToParagraphImplToJson(this);
  }
}

abstract class ReplyToParagraph extends Paragraph {
  const factory ReplyToParagraph({
    required final String id,
    required final String authorName,
    required final String preview,
  }) = _$ReplyToParagraphImpl;
  const ReplyToParagraph._() : super._();

  factory ReplyToParagraph.fromJson(Map<String, dynamic> json) =
      _$ReplyToParagraphImpl.fromJson;

  String get id;
  String get authorName;
  String get preview;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReplyToParagraphImplCopyWith<_$ReplyToParagraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ImageParagraphImplCopyWith<$Res> {
  factory _$$ImageParagraphImplCopyWith(
    _$ImageParagraphImpl value,
    $Res Function(_$ImageParagraphImpl) then,
  ) = __$$ImageParagraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? thumbUrl, String raw});
}

/// @nodoc
class __$$ImageParagraphImplCopyWithImpl<$Res>
    extends _$ParagraphCopyWithImpl<$Res, _$ImageParagraphImpl>
    implements _$$ImageParagraphImplCopyWith<$Res> {
  __$$ImageParagraphImplCopyWithImpl(
    _$ImageParagraphImpl _value,
    $Res Function(_$ImageParagraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? thumbUrl = freezed, Object? raw = null}) {
    return _then(
      _$ImageParagraphImpl(
        thumbUrl: freezed == thumbUrl
            ? _value.thumbUrl
            : thumbUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        raw: null == raw
            ? _value.raw
            : raw // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageParagraphImpl extends ImageParagraph {
  const _$ImageParagraphImpl({
    this.thumbUrl,
    required this.raw,
    final String? $type,
  }) : $type = $type ?? 'image',
       super._();

  factory _$ImageParagraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageParagraphImplFromJson(json);

  @override
  final String? thumbUrl;
  @override
  final String raw;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Paragraph.image(thumbUrl: $thumbUrl, raw: $raw)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageParagraphImpl &&
            (identical(other.thumbUrl, thumbUrl) ||
                other.thumbUrl == thumbUrl) &&
            (identical(other.raw, raw) || other.raw == raw));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, thumbUrl, raw);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageParagraphImplCopyWith<_$ImageParagraphImpl> get copyWith =>
      __$$ImageParagraphImplCopyWithImpl<_$ImageParagraphImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) {
    return image(thumbUrl, raw);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) {
    return image?.call(thumbUrl, raw);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(thumbUrl, raw);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) {
    return image(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) {
    return image?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) {
    if (image != null) {
      return image(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageParagraphImplToJson(this);
  }
}

abstract class ImageParagraph extends Paragraph {
  const factory ImageParagraph({
    final String? thumbUrl,
    required final String raw,
  }) = _$ImageParagraphImpl;
  const ImageParagraph._() : super._();

  factory ImageParagraph.fromJson(Map<String, dynamic> json) =
      _$ImageParagraphImpl.fromJson;

  String? get thumbUrl;
  String get raw;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageParagraphImplCopyWith<_$ImageParagraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VideoParagraphImplCopyWith<$Res> {
  factory _$$VideoParagraphImplCopyWith(
    _$VideoParagraphImpl value,
    $Res Function(_$VideoParagraphImpl) then,
  ) = __$$VideoParagraphImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String? thumb, String url});
}

/// @nodoc
class __$$VideoParagraphImplCopyWithImpl<$Res>
    extends _$ParagraphCopyWithImpl<$Res, _$VideoParagraphImpl>
    implements _$$VideoParagraphImplCopyWith<$Res> {
  __$$VideoParagraphImplCopyWithImpl(
    _$VideoParagraphImpl _value,
    $Res Function(_$VideoParagraphImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? thumb = freezed, Object? url = null}) {
    return _then(
      _$VideoParagraphImpl(
        thumb: freezed == thumb
            ? _value.thumb
            : thumb // ignore: cast_nullable_to_non_nullable
                  as String?,
        url: null == url
            ? _value.url
            : url // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$VideoParagraphImpl extends VideoParagraph {
  const _$VideoParagraphImpl({
    this.thumb,
    required this.url,
    final String? $type,
  }) : $type = $type ?? 'video',
       super._();

  factory _$VideoParagraphImpl.fromJson(Map<String, dynamic> json) =>
      _$$VideoParagraphImplFromJson(json);

  @override
  final String? thumb;
  @override
  final String url;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Paragraph.video(thumb: $thumb, url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VideoParagraphImpl &&
            (identical(other.thumb, thumb) || other.thumb == thumb) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, thumb, url);

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VideoParagraphImplCopyWith<_$VideoParagraphImpl> get copyWith =>
      __$$VideoParagraphImplCopyWithImpl<_$VideoParagraphImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String content) text,
    required TResult Function(String symbol) newLine,
    required TResult Function(String content) quote,
    required TResult Function(String content) link,
    required TResult Function(String id, String authorName, String preview)
    replyTo,
    required TResult Function(String? thumbUrl, String raw) image,
    required TResult Function(String? thumb, String url) video,
  }) {
    return video(thumb, url);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String content)? text,
    TResult? Function(String symbol)? newLine,
    TResult? Function(String content)? quote,
    TResult? Function(String content)? link,
    TResult? Function(String id, String authorName, String preview)? replyTo,
    TResult? Function(String? thumbUrl, String raw)? image,
    TResult? Function(String? thumb, String url)? video,
  }) {
    return video?.call(thumb, url);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String content)? text,
    TResult Function(String symbol)? newLine,
    TResult Function(String content)? quote,
    TResult Function(String content)? link,
    TResult Function(String id, String authorName, String preview)? replyTo,
    TResult Function(String? thumbUrl, String raw)? image,
    TResult Function(String? thumb, String url)? video,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(thumb, url);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TextParagraph value) text,
    required TResult Function(NewLineParagraph value) newLine,
    required TResult Function(QuoteParagraph value) quote,
    required TResult Function(LinkParagraph value) link,
    required TResult Function(ReplyToParagraph value) replyTo,
    required TResult Function(ImageParagraph value) image,
    required TResult Function(VideoParagraph value) video,
  }) {
    return video(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TextParagraph value)? text,
    TResult? Function(NewLineParagraph value)? newLine,
    TResult? Function(QuoteParagraph value)? quote,
    TResult? Function(LinkParagraph value)? link,
    TResult? Function(ReplyToParagraph value)? replyTo,
    TResult? Function(ImageParagraph value)? image,
    TResult? Function(VideoParagraph value)? video,
  }) {
    return video?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TextParagraph value)? text,
    TResult Function(NewLineParagraph value)? newLine,
    TResult Function(QuoteParagraph value)? quote,
    TResult Function(LinkParagraph value)? link,
    TResult Function(ReplyToParagraph value)? replyTo,
    TResult Function(ImageParagraph value)? image,
    TResult Function(VideoParagraph value)? video,
    required TResult orElse(),
  }) {
    if (video != null) {
      return video(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$VideoParagraphImplToJson(this);
  }
}

abstract class VideoParagraph extends Paragraph {
  const factory VideoParagraph({
    final String? thumb,
    required final String url,
  }) = _$VideoParagraphImpl;
  const VideoParagraph._() : super._();

  factory VideoParagraph.fromJson(Map<String, dynamic> json) =
      _$VideoParagraphImpl.fromJson;

  String? get thumb;
  String get url;

  /// Create a copy of Paragraph
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VideoParagraphImplCopyWith<_$VideoParagraphImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
