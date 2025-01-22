part of 'index.dart';

@Freezed(toJson: true)
class PostDto with _$PostDto {
  const factory PostDto({
    @JsonKey(name: 'extension_pkg_name', required: true)
    required String extensionPkgName,

    @JsonKey(name: 'site_id', required: true)
    required String siteId,

    @JsonKey(name: 'board_id', required: true)
    required String boardId,

    @JsonKey(name: 'thread_id', required: true)
    required String threadId,

    @JsonKey(name: 'id', required: true)
    required String id,

    @JsonKey(name: 'master_id', required: true)
    required String? masterId,

    @JsonKey(name: 'title')
    required String? title,

    @JsonKey(name: 'url')
    required String? url,

    @JsonKey(name: 'created_at', required: true)
    required int createdAt,

    @JsonKey(name: 'poster_name', required: true)
    required String posterName,

    @JsonKey(name: 'poster_id', required: true)
    required String posterId,

    @JsonKey(name: 'like', required: true)
    required int like,

    @JsonKey(name: 'dislike', required: true)
    required int dislike,

    @JsonKey(name: 'comments', required: true)
    required int comments,

    @JsonKey(name: 'contents', required: true)
    required List<ParagraphDto> contents,
  }) = _PostDto;

  factory PostDto.fromJson(Map<String, dynamic> json) => _$PostDtoFromJson(json);
}

extension PostDtoEx on PostDto {
  Post toPost() {
    return Post(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      boardId: boardId,
      threadId: threadId,
      id: id,
      masterId: masterId,
      title: title,
      url: url,
      createdAt: DateTime.fromMillisecondsSinceEpoch(createdAt),
      posterName: posterName,
      posterId: posterId,
      like: like,
      dislike: dislike,
      comments: comments,
      contents: contents.map((e) => e.toParagraph()).toList(),
    );
  }
}

abstract class ParagraphDto {
  final ParagraphType type;

  const ParagraphDto(this.type);

  factory ParagraphDto.fromJson(Map<String, dynamic> json) {
    final type = ParagraphType.values.firstWhere(
          (e) => e.toString() == 'ParagraphType.${json['type']}',
    );

    switch (type) {
      case ParagraphType.IMAGE:
        return ImageInfoDto.fromJson(json);
      case ParagraphType.VIDEO:
        return VideoInfoDto.fromJson(json);
      case ParagraphType.TEXT:
        return TextDto.fromJson(json);
      case ParagraphType.QUOTE:
        return QuoteDto.fromJson(json);
      case ParagraphType.REPLY_TO:
        return ReplyToDto.fromJson(json);
      case ParagraphType.LINK:
        return LinkDto.fromJson(json);
    }
  }
  Map<String, dynamic> toJson();
}

extension ParagraphDtoEx on ParagraphDto {
  Paragraph toParagraph() {
    switch (type) {
      case ParagraphType.IMAGE:
        final img = this as ImageInfoDto;
        return ApiImage(img.thumb, img.raw);
      case ParagraphType.VIDEO:
        final vid = this as VideoInfoDto;
        return ApiVideo(vid.thumb, vid.url);
      case ParagraphType.TEXT:
        final txt = this as TextDto;
        return ApiText(txt.content);
      case ParagraphType.QUOTE:
        final quote = this as QuoteDto;
        return Quote(quote.content);
      case ParagraphType.REPLY_TO:
        final reply = this as ReplyToDto;
        return ReplyTo(reply.id);
      case ParagraphType.LINK:
        final link = this as LinkDto;
        return Link(link.content);
    }
  }
}

@JsonSerializable()
class ImageInfoDto extends ParagraphDto {
  final String? thumb;
  final String raw;

  ImageInfoDto(
      this.thumb,
      this.raw,
      ) : super(ParagraphType.IMAGE);

  factory ImageInfoDto.fromJson(Map<String, dynamic> json) =>
      _$ImageInfoDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ImageInfoDtoToJson(this);
}

@JsonSerializable()
class VideoInfoDto extends ParagraphDto {
  final String thumb;
  final String url;

  VideoInfoDto(this.thumb, this.url) : super(ParagraphType.VIDEO);

  factory VideoInfoDto.fromJson(Map<String, dynamic> json) =>
      _$VideoInfoDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$VideoInfoDtoToJson(this);
}

@JsonSerializable()
class TextDto extends ParagraphDto {
  final String content;

  TextDto(this.content) : super(ParagraphType.TEXT);

  factory TextDto.fromJson(Map<String, dynamic> json) => _$TextDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TextDtoToJson(this);
}

@JsonSerializable()
class QuoteDto extends ParagraphDto {
  final String content;

  QuoteDto(this.content) : super(ParagraphType.QUOTE);

  factory QuoteDto.fromJson(Map<String, dynamic> json) => _$QuoteDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$QuoteDtoToJson(this);
}

@JsonSerializable()
class ReplyToDto extends ParagraphDto {
  final String id;

  ReplyToDto(this.id) : super(ParagraphType.REPLY_TO);

  factory ReplyToDto.fromJson(Map<String, dynamic> json) =>
      _$ReplyToDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ReplyToDtoToJson(this);
}

@JsonSerializable()
class LinkDto extends ParagraphDto {
  final String content;

  LinkDto(this.content) : super(ParagraphType.LINK);

  factory LinkDto.fromJson(Map<String, dynamic> json) => _$LinkDtoFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LinkDtoToJson(this);
}
