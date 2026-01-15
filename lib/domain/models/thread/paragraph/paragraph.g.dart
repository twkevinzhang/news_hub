// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TextParagraphImpl _$$TextParagraphImplFromJson(Map<String, dynamic> json) =>
    _$TextParagraphImpl(
      content: json['content'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$TextParagraphImplToJson(_$TextParagraphImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'runtimeType': instance.$type,
    };

_$NewLineParagraphImpl _$$NewLineParagraphImplFromJson(
  Map<String, dynamic> json,
) => _$NewLineParagraphImpl(
  symbol: json['symbol'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$NewLineParagraphImplToJson(
  _$NewLineParagraphImpl instance,
) => <String, dynamic>{
  'symbol': instance.symbol,
  'runtimeType': instance.$type,
};

_$QuoteParagraphImpl _$$QuoteParagraphImplFromJson(Map<String, dynamic> json) =>
    _$QuoteParagraphImpl(
      content: json['content'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$QuoteParagraphImplToJson(
  _$QuoteParagraphImpl instance,
) => <String, dynamic>{
  'content': instance.content,
  'runtimeType': instance.$type,
};

_$LinkParagraphImpl _$$LinkParagraphImplFromJson(Map<String, dynamic> json) =>
    _$LinkParagraphImpl(
      content: json['content'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$LinkParagraphImplToJson(_$LinkParagraphImpl instance) =>
    <String, dynamic>{
      'content': instance.content,
      'runtimeType': instance.$type,
    };

_$ReplyToParagraphImpl _$$ReplyToParagraphImplFromJson(
  Map<String, dynamic> json,
) => _$ReplyToParagraphImpl(
  id: json['id'] as String,
  authorName: json['authorName'] as String,
  preview: json['preview'] as String,
  $type: json['runtimeType'] as String?,
);

Map<String, dynamic> _$$ReplyToParagraphImplToJson(
  _$ReplyToParagraphImpl instance,
) => <String, dynamic>{
  'id': instance.id,
  'authorName': instance.authorName,
  'preview': instance.preview,
  'runtimeType': instance.$type,
};

_$ImageParagraphImpl _$$ImageParagraphImplFromJson(Map<String, dynamic> json) =>
    _$ImageParagraphImpl(
      thumbUrl: json['thumbUrl'] as String?,
      raw: json['raw'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$ImageParagraphImplToJson(
  _$ImageParagraphImpl instance,
) => <String, dynamic>{
  'thumbUrl': instance.thumbUrl,
  'raw': instance.raw,
  'runtimeType': instance.$type,
};

_$VideoParagraphImpl _$$VideoParagraphImplFromJson(Map<String, dynamic> json) =>
    _$VideoParagraphImpl(
      thumb: json['thumb'] as String?,
      url: json['url'] as String,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$VideoParagraphImplToJson(
  _$VideoParagraphImpl instance,
) => <String, dynamic>{
  'thumb': instance.thumb,
  'url': instance.url,
  'runtimeType': instance.$type,
};
