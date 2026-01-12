//
//  Generated code. Do not modify.
//  source: domain_models.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'domain_models.pbenum.dart';

export 'domain_models.pbenum.dart';

class PaginationReq extends $pb.GeneratedMessage {
  factory PaginationReq({
    $core.int? page,
    $core.int? limit,
    $core.int? pageSize,
    $core.String? prevCursor,
    $core.String? nextCursor,
  }) {
    final result = create();
    if (page != null) {
      result.page = page;
    }
    if (limit != null) {
      result.limit = limit;
    }
    if (pageSize != null) {
      result.pageSize = pageSize;
    }
    if (prevCursor != null) {
      result.prevCursor = prevCursor;
    }
    if (nextCursor != null) {
      result.nextCursor = nextCursor;
    }
    return result;
  }
  PaginationReq._() : super();
  factory PaginationReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaginationReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PaginationReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'page', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'prevCursor')
    ..aOS(5, _omitFieldNames ? '' : 'nextCursor')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaginationReq clone() => PaginationReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaginationReq copyWith(void Function(PaginationReq) updates) => super.copyWith((message) => updates(message as PaginationReq)) as PaginationReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaginationReq create() => PaginationReq._();
  PaginationReq createEmptyInstance() => create();
  static $pb.PbList<PaginationReq> createRepeated() => $pb.PbList<PaginationReq>();
  @$core.pragma('dart2js:noInline')
  static PaginationReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaginationReq>(create);
  static PaginationReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get prevCursor => $_getSZ(3);
  @$pb.TagNumber(4)
  set prevCursor($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrevCursor() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrevCursor() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nextCursor => $_getSZ(4);
  @$pb.TagNumber(5)
  set nextCursor($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNextCursor() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextCursor() => clearField(5);
}

class PaginationRes extends $pb.GeneratedMessage {
  factory PaginationRes({
    $core.int? totalPage,
    $core.int? currentPage,
    $core.int? pageSize,
    $core.String? prevCursor,
    $core.String? nextCursor,
  }) {
    final result = create();
    if (totalPage != null) {
      result.totalPage = totalPage;
    }
    if (currentPage != null) {
      result.currentPage = currentPage;
    }
    if (pageSize != null) {
      result.pageSize = pageSize;
    }
    if (prevCursor != null) {
      result.prevCursor = prevCursor;
    }
    if (nextCursor != null) {
      result.nextCursor = nextCursor;
    }
    return result;
  }
  PaginationRes._() : super();
  factory PaginationRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaginationRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PaginationRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'totalPage', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'currentPage', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'prevCursor')
    ..aOS(5, _omitFieldNames ? '' : 'nextCursor')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PaginationRes clone() => PaginationRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PaginationRes copyWith(void Function(PaginationRes) updates) => super.copyWith((message) => updates(message as PaginationRes)) as PaginationRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaginationRes create() => PaginationRes._();
  PaginationRes createEmptyInstance() => create();
  static $pb.PbList<PaginationRes> createRepeated() => $pb.PbList<PaginationRes>();
  @$core.pragma('dart2js:noInline')
  static PaginationRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PaginationRes>(create);
  static PaginationRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get totalPage => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalPage($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTotalPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPage() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentPage => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentPage($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCurrentPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentPage() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get prevCursor => $_getSZ(3);
  @$pb.TagNumber(4)
  set prevCursor($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPrevCursor() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrevCursor() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get nextCursor => $_getSZ(4);
  @$pb.TagNumber(5)
  set nextCursor($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasNextCursor() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextCursor() => clearField(5);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();
  Empty._() : super();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class Board extends $pb.GeneratedMessage {
  factory Board({
    $core.String? id,
    $core.String? name,
    $core.String? icon,
    $core.String? largeWelcomeImage,
    $core.String? url,
    $core.Iterable<$core.String>? supportedThreadsSorting,
    $core.String? pkgName,
  }) {
    final result = create();
    if (id != null) {
      result.id = id;
    }
    if (name != null) {
      result.name = name;
    }
    if (icon != null) {
      result.icon = icon;
    }
    if (largeWelcomeImage != null) {
      result.largeWelcomeImage = largeWelcomeImage;
    }
    if (url != null) {
      result.url = url;
    }
    if (supportedThreadsSorting != null) {
      result.supportedThreadsSorting.addAll(supportedThreadsSorting);
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  Board._() : super();
  factory Board.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Board.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Board', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'largeWelcomeImage')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..pPS(7, _omitFieldNames ? '' : 'supportedThreadsSorting')
    ..aOS(8, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Board clone() => Board()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Board copyWith(void Function(Board) updates) => super.copyWith((message) => updates(message as Board)) as Board;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Board create() => Board._();
  Board createEmptyInstance() => create();
  static $pb.PbList<Board> createRepeated() => $pb.PbList<Board>();
  @$core.pragma('dart2js:noInline')
  static Board getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Board>(create);
  static Board? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(2);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(2);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get largeWelcomeImage => $_getSZ(3);
  @$pb.TagNumber(5)
  set largeWelcomeImage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasLargeWelcomeImage() => $_has(3);
  @$pb.TagNumber(5)
  void clearLargeWelcomeImage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(4);
  @$pb.TagNumber(6)
  set url($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(4);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get supportedThreadsSorting => $_getList(5);

  @$pb.TagNumber(8)
  $core.String get pkgName => $_getSZ(6);
  @$pb.TagNumber(8)
  set pkgName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasPkgName() => $_has(6);
  @$pb.TagNumber(8)
  void clearPkgName() => clearField(8);
}

enum Paragraph_Content {
  image, 
  video, 
  text, 
  quote, 
  replyTo, 
  link, 
  newLine, 
  notSet
}

class Paragraph extends $pb.GeneratedMessage {
  factory Paragraph({
    ParagraphType? type,
    ImageParagraph? image,
    VideoParagraph? video,
    TextParagraph? text,
    QuoteParagraph? quote,
    ReplyToParagraph? replyTo,
    LinkParagraph? link,
    NewLineParagraph? newLine,
  }) {
    final result = create();
    if (type != null) {
      result.type = type;
    }
    if (image != null) {
      result.image = image;
    }
    if (video != null) {
      result.video = video;
    }
    if (text != null) {
      result.text = text;
    }
    if (quote != null) {
      result.quote = quote;
    }
    if (replyTo != null) {
      result.replyTo = replyTo;
    }
    if (link != null) {
      result.link = link;
    }
    if (newLine != null) {
      result.newLine = newLine;
    }
    return result;
  }
  Paragraph._() : super();
  factory Paragraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Paragraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Paragraph_Content> _Paragraph_ContentByTag = {
    2 : Paragraph_Content.image,
    3 : Paragraph_Content.video,
    4 : Paragraph_Content.text,
    5 : Paragraph_Content.quote,
    6 : Paragraph_Content.replyTo,
    7 : Paragraph_Content.link,
    8 : Paragraph_Content.newLine,
    0 : Paragraph_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Paragraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8])
    ..e<ParagraphType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ParagraphType.PARAGRAPH_TYPE_UNSPECIFIED, valueOf: ParagraphType.valueOf, enumValues: ParagraphType.values)
    ..aOM<ImageParagraph>(2, _omitFieldNames ? '' : 'image', subBuilder: ImageParagraph.create)
    ..aOM<VideoParagraph>(3, _omitFieldNames ? '' : 'video', subBuilder: VideoParagraph.create)
    ..aOM<TextParagraph>(4, _omitFieldNames ? '' : 'text', subBuilder: TextParagraph.create)
    ..aOM<QuoteParagraph>(5, _omitFieldNames ? '' : 'quote', subBuilder: QuoteParagraph.create)
    ..aOM<ReplyToParagraph>(6, _omitFieldNames ? '' : 'replyTo', subBuilder: ReplyToParagraph.create)
    ..aOM<LinkParagraph>(7, _omitFieldNames ? '' : 'link', subBuilder: LinkParagraph.create)
    ..aOM<NewLineParagraph>(8, _omitFieldNames ? '' : 'newLine', subBuilder: NewLineParagraph.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Paragraph clone() => Paragraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Paragraph copyWith(void Function(Paragraph) updates) => super.copyWith((message) => updates(message as Paragraph)) as Paragraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Paragraph create() => Paragraph._();
  Paragraph createEmptyInstance() => create();
  static $pb.PbList<Paragraph> createRepeated() => $pb.PbList<Paragraph>();
  @$core.pragma('dart2js:noInline')
  static Paragraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Paragraph>(create);
  static Paragraph? _defaultInstance;

  Paragraph_Content whichContent() => _Paragraph_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ParagraphType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ParagraphType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => clearField(1);

  @$pb.TagNumber(2)
  ImageParagraph get image => $_getN(1);
  @$pb.TagNumber(2)
  set image(ImageParagraph v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => clearField(2);
  @$pb.TagNumber(2)
  ImageParagraph ensureImage() => $_ensure(1);

  @$pb.TagNumber(3)
  VideoParagraph get video => $_getN(2);
  @$pb.TagNumber(3)
  set video(VideoParagraph v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasVideo() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideo() => clearField(3);
  @$pb.TagNumber(3)
  VideoParagraph ensureVideo() => $_ensure(2);

  @$pb.TagNumber(4)
  TextParagraph get text => $_getN(3);
  @$pb.TagNumber(4)
  set text(TextParagraph v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => clearField(4);
  @$pb.TagNumber(4)
  TextParagraph ensureText() => $_ensure(3);

  @$pb.TagNumber(5)
  QuoteParagraph get quote => $_getN(4);
  @$pb.TagNumber(5)
  set quote(QuoteParagraph v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasQuote() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuote() => clearField(5);
  @$pb.TagNumber(5)
  QuoteParagraph ensureQuote() => $_ensure(4);

  @$pb.TagNumber(6)
  ReplyToParagraph get replyTo => $_getN(5);
  @$pb.TagNumber(6)
  set replyTo(ReplyToParagraph v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasReplyTo() => $_has(5);
  @$pb.TagNumber(6)
  void clearReplyTo() => clearField(6);
  @$pb.TagNumber(6)
  ReplyToParagraph ensureReplyTo() => $_ensure(5);

  @$pb.TagNumber(7)
  LinkParagraph get link => $_getN(6);
  @$pb.TagNumber(7)
  set link(LinkParagraph v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasLink() => $_has(6);
  @$pb.TagNumber(7)
  void clearLink() => clearField(7);
  @$pb.TagNumber(7)
  LinkParagraph ensureLink() => $_ensure(6);

  @$pb.TagNumber(8)
  NewLineParagraph get newLine => $_getN(7);
  @$pb.TagNumber(8)
  set newLine(NewLineParagraph v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasNewLine() => $_has(7);
  @$pb.TagNumber(8)
  void clearNewLine() => clearField(8);
  @$pb.TagNumber(8)
  NewLineParagraph ensureNewLine() => $_ensure(7);
}

class ImageParagraph extends $pb.GeneratedMessage {
  factory ImageParagraph({
    $core.String? thumb,
    $core.String? raw,
  }) {
    final result = create();
    if (thumb != null) {
      result.thumb = thumb;
    }
    if (raw != null) {
      result.raw = raw;
    }
    return result;
  }
  ImageParagraph._() : super();
  factory ImageParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'thumb')
    ..aOS(2, _omitFieldNames ? '' : 'raw')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ImageParagraph clone() => ImageParagraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ImageParagraph copyWith(void Function(ImageParagraph) updates) => super.copyWith((message) => updates(message as ImageParagraph)) as ImageParagraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageParagraph create() => ImageParagraph._();
  ImageParagraph createEmptyInstance() => create();
  static $pb.PbList<ImageParagraph> createRepeated() => $pb.PbList<ImageParagraph>();
  @$core.pragma('dart2js:noInline')
  static ImageParagraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ImageParagraph>(create);
  static ImageParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get thumb => $_getSZ(0);
  @$pb.TagNumber(1)
  set thumb($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThumb() => $_has(0);
  @$pb.TagNumber(1)
  void clearThumb() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get raw => $_getSZ(1);
  @$pb.TagNumber(2)
  set raw($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRaw() => $_has(1);
  @$pb.TagNumber(2)
  void clearRaw() => clearField(2);
}

class VideoParagraph extends $pb.GeneratedMessage {
  factory VideoParagraph({
    $core.String? thumb,
    $core.String? url,
  }) {
    final result = create();
    if (thumb != null) {
      result.thumb = thumb;
    }
    if (url != null) {
      result.url = url;
    }
    return result;
  }
  VideoParagraph._() : super();
  factory VideoParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VideoParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'thumb')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  VideoParagraph clone() => VideoParagraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  VideoParagraph copyWith(void Function(VideoParagraph) updates) => super.copyWith((message) => updates(message as VideoParagraph)) as VideoParagraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VideoParagraph create() => VideoParagraph._();
  VideoParagraph createEmptyInstance() => create();
  static $pb.PbList<VideoParagraph> createRepeated() => $pb.PbList<VideoParagraph>();
  @$core.pragma('dart2js:noInline')
  static VideoParagraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<VideoParagraph>(create);
  static VideoParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get thumb => $_getSZ(0);
  @$pb.TagNumber(1)
  set thumb($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThumb() => $_has(0);
  @$pb.TagNumber(1)
  void clearThumb() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class TextParagraph extends $pb.GeneratedMessage {
  factory TextParagraph({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) {
      result.content = content;
    }
    return result;
  }
  TextParagraph._() : super();
  factory TextParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TextParagraph clone() => TextParagraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TextParagraph copyWith(void Function(TextParagraph) updates) => super.copyWith((message) => updates(message as TextParagraph)) as TextParagraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextParagraph create() => TextParagraph._();
  TextParagraph createEmptyInstance() => create();
  static $pb.PbList<TextParagraph> createRepeated() => $pb.PbList<TextParagraph>();
  @$core.pragma('dart2js:noInline')
  static TextParagraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TextParagraph>(create);
  static TextParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
}

class NewLineParagraph extends $pb.GeneratedMessage {
  factory NewLineParagraph({
    $core.String? symbol,
  }) {
    final result = create();
    if (symbol != null) {
      result.symbol = symbol;
    }
    return result;
  }
  NewLineParagraph._() : super();
  factory NewLineParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory NewLineParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewLineParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'symbol')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  NewLineParagraph clone() => NewLineParagraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  NewLineParagraph copyWith(void Function(NewLineParagraph) updates) => super.copyWith((message) => updates(message as NewLineParagraph)) as NewLineParagraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewLineParagraph create() => NewLineParagraph._();
  NewLineParagraph createEmptyInstance() => create();
  static $pb.PbList<NewLineParagraph> createRepeated() => $pb.PbList<NewLineParagraph>();
  @$core.pragma('dart2js:noInline')
  static NewLineParagraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<NewLineParagraph>(create);
  static NewLineParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => clearField(1);
}

class QuoteParagraph extends $pb.GeneratedMessage {
  factory QuoteParagraph({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) {
      result.content = content;
    }
    return result;
  }
  QuoteParagraph._() : super();
  factory QuoteParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuoteParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'QuoteParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  QuoteParagraph clone() => QuoteParagraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  QuoteParagraph copyWith(void Function(QuoteParagraph) updates) => super.copyWith((message) => updates(message as QuoteParagraph)) as QuoteParagraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuoteParagraph create() => QuoteParagraph._();
  QuoteParagraph createEmptyInstance() => create();
  static $pb.PbList<QuoteParagraph> createRepeated() => $pb.PbList<QuoteParagraph>();
  @$core.pragma('dart2js:noInline')
  static QuoteParagraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<QuoteParagraph>(create);
  static QuoteParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
}

class ReplyToParagraph extends $pb.GeneratedMessage {
  factory ReplyToParagraph({
    $core.String? id,
    $core.String? preview,
    $core.String? authorName,
  }) {
    final result = create();
    if (id != null) {
      result.id = id;
    }
    if (preview != null) {
      result.preview = preview;
    }
    if (authorName != null) {
      result.authorName = authorName;
    }
    return result;
  }
  ReplyToParagraph._() : super();
  factory ReplyToParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyToParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyToParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'preview')
    ..aOS(3, _omitFieldNames ? '' : 'authorName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ReplyToParagraph clone() => ReplyToParagraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ReplyToParagraph copyWith(void Function(ReplyToParagraph) updates) => super.copyWith((message) => updates(message as ReplyToParagraph)) as ReplyToParagraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyToParagraph create() => ReplyToParagraph._();
  ReplyToParagraph createEmptyInstance() => create();
  static $pb.PbList<ReplyToParagraph> createRepeated() => $pb.PbList<ReplyToParagraph>();
  @$core.pragma('dart2js:noInline')
  static ReplyToParagraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ReplyToParagraph>(create);
  static ReplyToParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get preview => $_getSZ(1);
  @$pb.TagNumber(2)
  set preview($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPreview() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreview() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authorName => $_getSZ(2);
  @$pb.TagNumber(3)
  set authorName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthorName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthorName() => clearField(3);
}

class LinkParagraph extends $pb.GeneratedMessage {
  factory LinkParagraph({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) {
      result.content = content;
    }
    return result;
  }
  LinkParagraph._() : super();
  factory LinkParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LinkParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LinkParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LinkParagraph clone() => LinkParagraph()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LinkParagraph copyWith(void Function(LinkParagraph) updates) => super.copyWith((message) => updates(message as LinkParagraph)) as LinkParagraph;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkParagraph create() => LinkParagraph._();
  LinkParagraph createEmptyInstance() => create();
  static $pb.PbList<LinkParagraph> createRepeated() => $pb.PbList<LinkParagraph>();
  @$core.pragma('dart2js:noInline')
  static LinkParagraph getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LinkParagraph>(create);
  static LinkParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => clearField(1);
}

enum Post_Content {
  articlePost, 
  singleImagePost, 
  notSet
}

class Post extends $pb.GeneratedMessage {
  factory Post({
    $core.String? id,
    $core.String? threadId,
    $core.String? boardId,
    $core.String? pkgName,
    ArticlePost? articlePost,
    SingleImagePost? singleImagePost,
  }) {
    final result = create();
    if (id != null) {
      result.id = id;
    }
    if (threadId != null) {
      result.threadId = threadId;
    }
    if (boardId != null) {
      result.boardId = boardId;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    if (articlePost != null) {
      result.articlePost = articlePost;
    }
    if (singleImagePost != null) {
      result.singleImagePost = singleImagePost;
    }
    return result;
  }
  Post._() : super();
  factory Post.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Post.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static const $core.Map<$core.int, Post_Content> _Post_ContentByTag = {
    7 : Post_Content.articlePost,
    8 : Post_Content.singleImagePost,
    0 : Post_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Post', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..oo(0, [7, 8])
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'threadId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..aOM<ArticlePost>(7, _omitFieldNames ? '' : 'articlePost', subBuilder: ArticlePost.create)
    ..aOM<SingleImagePost>(8, _omitFieldNames ? '' : 'singleImagePost', subBuilder: SingleImagePost.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Post clone() => Post()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Post copyWith(void Function(Post) updates) => super.copyWith((message) => updates(message as Post)) as Post;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Post create() => Post._();
  Post createEmptyInstance() => create();
  static $pb.PbList<Post> createRepeated() => $pb.PbList<Post>();
  @$core.pragma('dart2js:noInline')
  static Post getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Post>(create);
  static Post? _defaultInstance;

  Post_Content whichContent() => _Post_ContentByTag[$_whichOneof(0)]!;
  void clearContent() => clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get threadId => $_getSZ(1);
  @$pb.TagNumber(2)
  set threadId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasThreadId() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreadId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boardId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boardId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoardId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoardId() => clearField(3);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(3);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(3);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);

  @$pb.TagNumber(7)
  ArticlePost get articlePost => $_getN(4);
  @$pb.TagNumber(7)
  set articlePost(ArticlePost v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasArticlePost() => $_has(4);
  @$pb.TagNumber(7)
  void clearArticlePost() => clearField(7);
  @$pb.TagNumber(7)
  ArticlePost ensureArticlePost() => $_ensure(4);

  @$pb.TagNumber(8)
  SingleImagePost get singleImagePost => $_getN(5);
  @$pb.TagNumber(8)
  set singleImagePost(SingleImagePost v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSingleImagePost() => $_has(5);
  @$pb.TagNumber(8)
  void clearSingleImagePost() => clearField(8);
  @$pb.TagNumber(8)
  SingleImagePost ensureSingleImagePost() => $_ensure(5);
}

class ArticlePost extends $pb.GeneratedMessage {
  factory ArticlePost({
    $core.String? authorName,
    $fixnum.Int64? createdAt,
    $core.String? title,
    $core.String? authorId,
    $core.int? liked,
    $core.int? disliked,
    $fixnum.Int64? latestReplyCreatedAt,
    $core.Iterable<Paragraph>? contents,
    $core.Iterable<$core.String>? tags,
    $core.int? repliesCount,
    $core.String? url,
    $core.Iterable<Comment>? top5Comments,
  }) {
    final result = create();
    if (authorName != null) {
      result.authorName = authorName;
    }
    if (createdAt != null) {
      result.createdAt = createdAt;
    }
    if (title != null) {
      result.title = title;
    }
    if (authorId != null) {
      result.authorId = authorId;
    }
    if (liked != null) {
      result.liked = liked;
    }
    if (disliked != null) {
      result.disliked = disliked;
    }
    if (latestReplyCreatedAt != null) {
      result.latestReplyCreatedAt = latestReplyCreatedAt;
    }
    if (contents != null) {
      result.contents.addAll(contents);
    }
    if (tags != null) {
      result.tags.addAll(tags);
    }
    if (repliesCount != null) {
      result.repliesCount = repliesCount;
    }
    if (url != null) {
      result.url = url;
    }
    if (top5Comments != null) {
      result.top5Comments.addAll(top5Comments);
    }
    return result;
  }
  ArticlePost._() : super();
  factory ArticlePost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticlePost', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'authorName')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'title')
    ..aOS(11, _omitFieldNames ? '' : 'authorId')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'liked', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'disliked', $pb.PbFieldType.O3)
    ..aInt64(15, _omitFieldNames ? '' : 'latestReplyCreatedAt')
    ..pc<Paragraph>(17, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM, subBuilder: Paragraph.create)
    ..pPS(18, _omitFieldNames ? '' : 'tags')
    ..a<$core.int>(19, _omitFieldNames ? '' : 'repliesCount', $pb.PbFieldType.O3)
    ..aOS(20, _omitFieldNames ? '' : 'url')
    ..pc<Comment>(21, _omitFieldNames ? '' : 'top5Comments', $pb.PbFieldType.PM, protoName: 'top_5_comments', subBuilder: Comment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ArticlePost clone() => ArticlePost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ArticlePost copyWith(void Function(ArticlePost) updates) => super.copyWith((message) => updates(message as ArticlePost)) as ArticlePost;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticlePost create() => ArticlePost._();
  ArticlePost createEmptyInstance() => create();
  static $pb.PbList<ArticlePost> createRepeated() => $pb.PbList<ArticlePost>();
  @$core.pragma('dart2js:noInline')
  static ArticlePost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ArticlePost>(create);
  static ArticlePost? _defaultInstance;

  @$pb.TagNumber(5)
  $core.String get authorName => $_getSZ(0);
  @$pb.TagNumber(5)
  set authorName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthorName() => $_has(0);
  @$pb.TagNumber(5)
  void clearAuthorName() => clearField(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);

  @$pb.TagNumber(9)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(9)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(9)
  void clearTitle() => clearField(9);

  @$pb.TagNumber(11)
  $core.String get authorId => $_getSZ(3);
  @$pb.TagNumber(11)
  set authorId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(11)
  $core.bool hasAuthorId() => $_has(3);
  @$pb.TagNumber(11)
  void clearAuthorId() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get liked => $_getIZ(4);
  @$pb.TagNumber(12)
  set liked($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(12)
  $core.bool hasLiked() => $_has(4);
  @$pb.TagNumber(12)
  void clearLiked() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get disliked => $_getIZ(5);
  @$pb.TagNumber(13)
  set disliked($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(13)
  $core.bool hasDisliked() => $_has(5);
  @$pb.TagNumber(13)
  void clearDisliked() => clearField(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get latestReplyCreatedAt => $_getI64(6);
  @$pb.TagNumber(15)
  set latestReplyCreatedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(15)
  $core.bool hasLatestReplyCreatedAt() => $_has(6);
  @$pb.TagNumber(15)
  void clearLatestReplyCreatedAt() => clearField(15);

  @$pb.TagNumber(17)
  $core.List<Paragraph> get contents => $_getList(7);

  @$pb.TagNumber(18)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(19)
  $core.int get repliesCount => $_getIZ(9);
  @$pb.TagNumber(19)
  set repliesCount($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(19)
  $core.bool hasRepliesCount() => $_has(9);
  @$pb.TagNumber(19)
  void clearRepliesCount() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get url => $_getSZ(10);
  @$pb.TagNumber(20)
  set url($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(20)
  $core.bool hasUrl() => $_has(10);
  @$pb.TagNumber(20)
  void clearUrl() => clearField(20);

  @$pb.TagNumber(21)
  $core.List<Comment> get top5Comments => $_getList(11);
}

class SingleImagePost extends $pb.GeneratedMessage {
  factory SingleImagePost({
    $core.String? authorName,
    $fixnum.Int64? createdAt,
    $core.String? title,
    $core.String? authorId,
    $core.int? liked,
    $core.int? disliked,
    $fixnum.Int64? latestReplyCreatedAt,
    $core.Iterable<Paragraph>? contents,
    $core.Iterable<$core.String>? tags,
    $core.int? repliesCount,
    $core.String? url,
    ImageParagraph? image,
    $core.Iterable<Comment>? top5Comments,
  }) {
    final result = create();
    if (authorName != null) {
      result.authorName = authorName;
    }
    if (createdAt != null) {
      result.createdAt = createdAt;
    }
    if (title != null) {
      result.title = title;
    }
    if (authorId != null) {
      result.authorId = authorId;
    }
    if (liked != null) {
      result.liked = liked;
    }
    if (disliked != null) {
      result.disliked = disliked;
    }
    if (latestReplyCreatedAt != null) {
      result.latestReplyCreatedAt = latestReplyCreatedAt;
    }
    if (contents != null) {
      result.contents.addAll(contents);
    }
    if (tags != null) {
      result.tags.addAll(tags);
    }
    if (repliesCount != null) {
      result.repliesCount = repliesCount;
    }
    if (url != null) {
      result.url = url;
    }
    if (image != null) {
      result.image = image;
    }
    if (top5Comments != null) {
      result.top5Comments.addAll(top5Comments);
    }
    return result;
  }
  SingleImagePost._() : super();
  factory SingleImagePost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleImagePost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SingleImagePost', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'authorName')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'title')
    ..aOS(11, _omitFieldNames ? '' : 'authorId')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'liked', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'disliked', $pb.PbFieldType.O3)
    ..aInt64(15, _omitFieldNames ? '' : 'latestReplyCreatedAt')
    ..pc<Paragraph>(17, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM, subBuilder: Paragraph.create)
    ..pPS(18, _omitFieldNames ? '' : 'tags')
    ..a<$core.int>(19, _omitFieldNames ? '' : 'repliesCount', $pb.PbFieldType.O3)
    ..aOS(20, _omitFieldNames ? '' : 'url')
    ..aOM<ImageParagraph>(21, _omitFieldNames ? '' : 'image', subBuilder: ImageParagraph.create)
    ..pc<Comment>(22, _omitFieldNames ? '' : 'top5Comments', $pb.PbFieldType.PM, protoName: 'top_5_comments', subBuilder: Comment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SingleImagePost clone() => SingleImagePost()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SingleImagePost copyWith(void Function(SingleImagePost) updates) => super.copyWith((message) => updates(message as SingleImagePost)) as SingleImagePost;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SingleImagePost create() => SingleImagePost._();
  SingleImagePost createEmptyInstance() => create();
  static $pb.PbList<SingleImagePost> createRepeated() => $pb.PbList<SingleImagePost>();
  @$core.pragma('dart2js:noInline')
  static SingleImagePost getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SingleImagePost>(create);
  static SingleImagePost? _defaultInstance;

  @$pb.TagNumber(5)
  $core.String get authorName => $_getSZ(0);
  @$pb.TagNumber(5)
  set authorName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthorName() => $_has(0);
  @$pb.TagNumber(5)
  void clearAuthorName() => clearField(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);

  @$pb.TagNumber(9)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(9)
  set title($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(9)
  void clearTitle() => clearField(9);

  @$pb.TagNumber(11)
  $core.String get authorId => $_getSZ(3);
  @$pb.TagNumber(11)
  set authorId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(11)
  $core.bool hasAuthorId() => $_has(3);
  @$pb.TagNumber(11)
  void clearAuthorId() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get liked => $_getIZ(4);
  @$pb.TagNumber(12)
  set liked($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(12)
  $core.bool hasLiked() => $_has(4);
  @$pb.TagNumber(12)
  void clearLiked() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get disliked => $_getIZ(5);
  @$pb.TagNumber(13)
  set disliked($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(13)
  $core.bool hasDisliked() => $_has(5);
  @$pb.TagNumber(13)
  void clearDisliked() => clearField(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get latestReplyCreatedAt => $_getI64(6);
  @$pb.TagNumber(15)
  set latestReplyCreatedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(15)
  $core.bool hasLatestReplyCreatedAt() => $_has(6);
  @$pb.TagNumber(15)
  void clearLatestReplyCreatedAt() => clearField(15);

  @$pb.TagNumber(17)
  $core.List<Paragraph> get contents => $_getList(7);

  @$pb.TagNumber(18)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(19)
  $core.int get repliesCount => $_getIZ(9);
  @$pb.TagNumber(19)
  set repliesCount($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(19)
  $core.bool hasRepliesCount() => $_has(9);
  @$pb.TagNumber(19)
  void clearRepliesCount() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get url => $_getSZ(10);
  @$pb.TagNumber(20)
  set url($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(20)
  $core.bool hasUrl() => $_has(10);
  @$pb.TagNumber(20)
  void clearUrl() => clearField(20);

  @$pb.TagNumber(21)
  ImageParagraph get image => $_getN(11);
  @$pb.TagNumber(21)
  set image(ImageParagraph v) { setField(21, v); }
  @$pb.TagNumber(21)
  $core.bool hasImage() => $_has(11);
  @$pb.TagNumber(21)
  void clearImage() => clearField(21);
  @$pb.TagNumber(21)
  ImageParagraph ensureImage() => $_ensure(11);

  @$pb.TagNumber(22)
  $core.List<Comment> get top5Comments => $_getList(12);
}

class Comment extends $pb.GeneratedMessage {
  factory Comment({
    $core.String? id,
    $core.String? postId,
    $core.String? threadId,
    $core.String? boardId,
    $core.String? authorId,
    $fixnum.Int64? createdAt,
    $core.String? authorName,
    $core.Iterable<Paragraph>? contents,
    $core.String? pkgName,
  }) {
    final result = create();
    if (id != null) {
      result.id = id;
    }
    if (postId != null) {
      result.postId = postId;
    }
    if (threadId != null) {
      result.threadId = threadId;
    }
    if (boardId != null) {
      result.boardId = boardId;
    }
    if (authorId != null) {
      result.authorId = authorId;
    }
    if (createdAt != null) {
      result.createdAt = createdAt;
    }
    if (authorName != null) {
      result.authorName = authorName;
    }
    if (contents != null) {
      result.contents.addAll(contents);
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  Comment._() : super();
  factory Comment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Comment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Comment', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'postId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOS(4, _omitFieldNames ? '' : 'boardId')
    ..aOS(6, _omitFieldNames ? '' : 'authorId')
    ..aInt64(8, _omitFieldNames ? '' : 'createdAt')
    ..aOS(10, _omitFieldNames ? '' : 'authorName')
    ..pc<Paragraph>(11, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM, subBuilder: Paragraph.create)
    ..aOS(12, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Comment clone() => Comment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Comment copyWith(void Function(Comment) updates) => super.copyWith((message) => updates(message as Comment)) as Comment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Comment create() => Comment._();
  Comment createEmptyInstance() => create();
  static $pb.PbList<Comment> createRepeated() => $pb.PbList<Comment>();
  @$core.pragma('dart2js:noInline')
  static Comment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Comment>(create);
  static Comment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get postId => $_getSZ(1);
  @$pb.TagNumber(2)
  set postId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPostId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPostId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(2);
  @$pb.TagNumber(3)
  set threadId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get boardId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boardId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoardId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoardId() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get authorId => $_getSZ(4);
  @$pb.TagNumber(6)
  set authorId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasAuthorId() => $_has(4);
  @$pb.TagNumber(6)
  void clearAuthorId() => clearField(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get createdAt => $_getI64(5);
  @$pb.TagNumber(8)
  set createdAt($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);

  @$pb.TagNumber(10)
  $core.String get authorName => $_getSZ(6);
  @$pb.TagNumber(10)
  set authorName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(10)
  $core.bool hasAuthorName() => $_has(6);
  @$pb.TagNumber(10)
  void clearAuthorName() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<Paragraph> get contents => $_getList(7);

  @$pb.TagNumber(12)
  $core.String get pkgName => $_getSZ(8);
  @$pb.TagNumber(12)
  set pkgName($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(12)
  $core.bool hasPkgName() => $_has(8);
  @$pb.TagNumber(12)
  void clearPkgName() => clearField(12);
}

class Extension extends $pb.GeneratedMessage {
  factory Extension({
    $core.String? pkgName,
    $core.String? displayName,
    $core.int? version,
    $core.int? pythonVersion,
    $core.String? lang,
    $core.bool? isNsfw,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    if (displayName != null) {
      result.displayName = displayName;
    }
    if (version != null) {
      result.version = version;
    }
    if (pythonVersion != null) {
      result.pythonVersion = pythonVersion;
    }
    if (lang != null) {
      result.lang = lang;
    }
    if (isNsfw != null) {
      result.isNsfw = isNsfw;
    }
    return result;
  }
  Extension._() : super();
  factory Extension.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Extension.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Extension', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'pkgName')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'pythonVersion', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'lang')
    ..aOB(8, _omitFieldNames ? '' : 'isNsfw')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Extension clone() => Extension()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Extension copyWith(void Function(Extension) updates) => super.copyWith((message) => updates(message as Extension)) as Extension;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Extension create() => Extension._();
  Extension createEmptyInstance() => create();
  static $pb.PbList<Extension> createRepeated() => $pb.PbList<Extension>();
  @$core.pragma('dart2js:noInline')
  static Extension getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Extension>(create);
  static Extension? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(2)
  set pkgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(2)
  void clearPkgName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  @$pb.TagNumber(5)
  $core.int get version => $_getIZ(2);
  @$pb.TagNumber(5)
  set version($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(2);
  @$pb.TagNumber(5)
  void clearVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get pythonVersion => $_getIZ(3);
  @$pb.TagNumber(6)
  set pythonVersion($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasPythonVersion() => $_has(3);
  @$pb.TagNumber(6)
  void clearPythonVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get lang => $_getSZ(4);
  @$pb.TagNumber(7)
  set lang($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(7)
  $core.bool hasLang() => $_has(4);
  @$pb.TagNumber(7)
  void clearLang() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isNsfw => $_getBF(5);
  @$pb.TagNumber(8)
  set isNsfw($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsNsfw() => $_has(5);
  @$pb.TagNumber(8)
  void clearIsNsfw() => clearField(8);
}

class RemoteExtension extends $pb.GeneratedMessage {
  factory RemoteExtension({
    Extension? base,
    $core.String? iconUrl,
    $core.String? repoUrl,
  }) {
    final result = create();
    if (base != null) {
      result.base = base;
    }
    if (iconUrl != null) {
      result.iconUrl = iconUrl;
    }
    if (repoUrl != null) {
      result.repoUrl = repoUrl;
    }
    return result;
  }
  RemoteExtension._() : super();
  factory RemoteExtension.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoteExtension.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoteExtension', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOM<Extension>(1, _omitFieldNames ? '' : 'base', subBuilder: Extension.create)
    ..aOS(2, _omitFieldNames ? '' : 'iconUrl')
    ..aOS(3, _omitFieldNames ? '' : 'repoUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoteExtension clone() => RemoteExtension()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoteExtension copyWith(void Function(RemoteExtension) updates) => super.copyWith((message) => updates(message as RemoteExtension)) as RemoteExtension;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteExtension create() => RemoteExtension._();
  RemoteExtension createEmptyInstance() => create();
  static $pb.PbList<RemoteExtension> createRepeated() => $pb.PbList<RemoteExtension>();
  @$core.pragma('dart2js:noInline')
  static RemoteExtension getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoteExtension>(create);
  static RemoteExtension? _defaultInstance;

  @$pb.TagNumber(1)
  Extension get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(Extension v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => clearField(1);
  @$pb.TagNumber(1)
  Extension ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get iconUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set iconUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasIconUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearIconUrl() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get repoUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set repoUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRepoUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearRepoUrl() => clearField(3);
}

class ExtensionRepo extends $pb.GeneratedMessage {
  factory ExtensionRepo({
    $core.String? url,
    $fixnum.Int64? addedAt,
    $core.String? displayName,
    $core.String? website,
    $core.String? signingKeyFingerprint,
    $core.String? icon,
  }) {
    final result = create();
    if (url != null) {
      result.url = url;
    }
    if (addedAt != null) {
      result.addedAt = addedAt;
    }
    if (displayName != null) {
      result.displayName = displayName;
    }
    if (website != null) {
      result.website = website;
    }
    if (signingKeyFingerprint != null) {
      result.signingKeyFingerprint = signingKeyFingerprint;
    }
    if (icon != null) {
      result.icon = icon;
    }
    return result;
  }
  ExtensionRepo._() : super();
  factory ExtensionRepo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ExtensionRepo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExtensionRepo', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aInt64(2, _omitFieldNames ? '' : 'addedAt')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..aOS(4, _omitFieldNames ? '' : 'website')
    ..aOS(5, _omitFieldNames ? '' : 'signingKeyFingerprint')
    ..aOS(6, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ExtensionRepo clone() => ExtensionRepo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ExtensionRepo copyWith(void Function(ExtensionRepo) updates) => super.copyWith((message) => updates(message as ExtensionRepo)) as ExtensionRepo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtensionRepo create() => ExtensionRepo._();
  ExtensionRepo createEmptyInstance() => create();
  static $pb.PbList<ExtensionRepo> createRepeated() => $pb.PbList<ExtensionRepo>();
  @$core.pragma('dart2js:noInline')
  static ExtensionRepo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ExtensionRepo>(create);
  static ExtensionRepo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get addedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set addedAt($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddedAt() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get website => $_getSZ(3);
  @$pb.TagNumber(4)
  set website($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasWebsite() => $_has(3);
  @$pb.TagNumber(4)
  void clearWebsite() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get signingKeyFingerprint => $_getSZ(4);
  @$pb.TagNumber(5)
  set signingKeyFingerprint($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSigningKeyFingerprint() => $_has(4);
  @$pb.TagNumber(5)
  void clearSigningKeyFingerprint() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get icon => $_getSZ(5);
  @$pb.TagNumber(6)
  set icon($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasIcon() => $_has(5);
  @$pb.TagNumber(6)
  void clearIcon() => clearField(6);
}

class LogEntry extends $pb.GeneratedMessage {
  factory LogEntry({
    $fixnum.Int64? timestamp,
    LogLevel? level,
    $core.String? loggerName,
    $core.String? message,
    $core.String? exception,
  }) {
    final result = create();
    if (timestamp != null) {
      result.timestamp = timestamp;
    }
    if (level != null) {
      result.level = level;
    }
    if (loggerName != null) {
      result.loggerName = loggerName;
    }
    if (message != null) {
      result.message = message;
    }
    if (exception != null) {
      result.exception = exception;
    }
    return result;
  }
  LogEntry._() : super();
  factory LogEntry.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LogEntry.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.domain'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..e<LogLevel>(2, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: LogLevel.DEBUG, valueOf: LogLevel.valueOf, enumValues: LogLevel.values)
    ..aOS(3, _omitFieldNames ? '' : 'loggerName')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..aOS(5, _omitFieldNames ? '' : 'exception')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LogEntry clone() => LogEntry()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LogEntry copyWith(void Function(LogEntry) updates) => super.copyWith((message) => updates(message as LogEntry)) as LogEntry;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogEntry create() => LogEntry._();
  LogEntry createEmptyInstance() => create();
  static $pb.PbList<LogEntry> createRepeated() => $pb.PbList<LogEntry>();
  @$core.pragma('dart2js:noInline')
  static LogEntry getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogEntry>(create);
  static LogEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => clearField(1);

  @$pb.TagNumber(2)
  LogLevel get level => $_getN(1);
  @$pb.TagNumber(2)
  set level(LogLevel v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get loggerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set loggerName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLoggerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLoggerName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get exception => $_getSZ(4);
  @$pb.TagNumber(5)
  set exception($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasException() => $_has(4);
  @$pb.TagNumber(5)
  void clearException() => clearField(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
