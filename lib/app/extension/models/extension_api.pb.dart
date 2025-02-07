//
//  Generated code. Do not modify.
//  source: extension_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'extension_api.pbenum.dart';

export 'extension_api.pbenum.dart';

class PaginationReq extends $pb.GeneratedMessage {
  factory PaginationReq({
    $core.int? page,
    $core.int? limit,
    $core.int? pageSize,
    $core.String? prevCursor,
    $core.String? nextCursor,
  }) {
    final $result = create();
    if (page != null) {
      $result.page = page;
    }
    if (limit != null) {
      $result.limit = limit;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (prevCursor != null) {
      $result.prevCursor = prevCursor;
    }
    if (nextCursor != null) {
      $result.nextCursor = nextCursor;
    }
    return $result;
  }
  PaginationReq._() : super();
  factory PaginationReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaginationReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PaginationReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

  /// for offset-based pagination
  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => clearField(1);

  /// for cursor-based pagination
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
    final $result = create();
    if (totalPage != null) {
      $result.totalPage = totalPage;
    }
    if (currentPage != null) {
      $result.currentPage = currentPage;
    }
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (prevCursor != null) {
      $result.prevCursor = prevCursor;
    }
    if (nextCursor != null) {
      $result.nextCursor = nextCursor;
    }
    return $result;
  }
  PaginationRes._() : super();
  factory PaginationRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PaginationRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PaginationRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

  /// for offset-based pagination
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

  /// for cursor-based pagination
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Empty', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

class GetSiteRes extends $pb.GeneratedMessage {
  factory GetSiteRes({
    Site? site,
  }) {
    final $result = create();
    if (site != null) {
      $result.site = site;
    }
    return $result;
  }
  GetSiteRes._() : super();
  factory GetSiteRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSiteRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSiteRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<Site>(1, _omitFieldNames ? '' : 'site', subBuilder: Site.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSiteRes clone() => GetSiteRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSiteRes copyWith(void Function(GetSiteRes) updates) => super.copyWith((message) => updates(message as GetSiteRes)) as GetSiteRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSiteRes create() => GetSiteRes._();
  GetSiteRes createEmptyInstance() => create();
  static $pb.PbList<GetSiteRes> createRepeated() => $pb.PbList<GetSiteRes>();
  @$core.pragma('dart2js:noInline')
  static GetSiteRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSiteRes>(create);
  static GetSiteRes? _defaultInstance;

  @$pb.TagNumber(1)
  Site get site => $_getN(0);
  @$pb.TagNumber(1)
  set site(Site v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSite() => $_has(0);
  @$pb.TagNumber(1)
  void clearSite() => clearField(1);
  @$pb.TagNumber(1)
  Site ensureSite() => $_ensure(0);
}

class Site extends $pb.GeneratedMessage {
  factory Site({
    $core.String? name,
    $core.String? description,
    $core.String? url,
    $core.String? id,
    $core.String? icon,
  }) {
    final $result = create();
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (url != null) {
      $result.url = url;
    }
    if (id != null) {
      $result.id = id;
    }
    if (icon != null) {
      $result.icon = icon;
    }
    return $result;
  }
  Site._() : super();
  factory Site.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Site.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Site', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'id')
    ..aOS(5, _omitFieldNames ? '' : 'icon')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Site clone() => Site()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Site copyWith(void Function(Site) updates) => super.copyWith((message) => updates(message as Site)) as Site;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Site create() => Site._();
  Site createEmptyInstance() => create();
  static $pb.PbList<Site> createRepeated() => $pb.PbList<Site>();
  @$core.pragma('dart2js:noInline')
  static Site getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Site>(create);
  static Site? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => clearField(5);
}

class GetBoardsRes extends $pb.GeneratedMessage {
  factory GetBoardsRes({
    $core.Iterable<Board>? boards,
    PaginationRes? page,
  }) {
    final $result = create();
    if (boards != null) {
      $result.boards.addAll(boards);
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  GetBoardsRes._() : super();
  factory GetBoardsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBoardsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBoardsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<Board>(1, _omitFieldNames ? '' : 'boards', $pb.PbFieldType.PM, subBuilder: Board.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: PaginationRes.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBoardsRes clone() => GetBoardsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBoardsRes copyWith(void Function(GetBoardsRes) updates) => super.copyWith((message) => updates(message as GetBoardsRes)) as GetBoardsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBoardsRes create() => GetBoardsRes._();
  GetBoardsRes createEmptyInstance() => create();
  static $pb.PbList<GetBoardsRes> createRepeated() => $pb.PbList<GetBoardsRes>();
  @$core.pragma('dart2js:noInline')
  static GetBoardsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBoardsRes>(create);
  static GetBoardsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Board> get boards => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  PaginationRes ensurePage() => $_ensure(1);
}

class Board extends $pb.GeneratedMessage {
  factory Board({
    $core.String? id,
    $core.String? siteId,
    $core.String? name,
    $core.String? icon,
    $core.String? largeWelcomeImage,
    $core.String? url,
    $core.Iterable<$core.String>? supportedThreadsSorting,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (siteId != null) {
      $result.siteId = siteId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (icon != null) {
      $result.icon = icon;
    }
    if (largeWelcomeImage != null) {
      $result.largeWelcomeImage = largeWelcomeImage;
    }
    if (url != null) {
      $result.url = url;
    }
    if (supportedThreadsSorting != null) {
      $result.supportedThreadsSorting.addAll(supportedThreadsSorting);
    }
    return $result;
  }
  Board._() : super();
  factory Board.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Board.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Board', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'siteId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'largeWelcomeImage')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..pPS(7, _omitFieldNames ? '' : 'supportedThreadsSorting')
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

  @$pb.TagNumber(2)
  $core.String get siteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set siteId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSiteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSiteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get largeWelcomeImage => $_getSZ(4);
  @$pb.TagNumber(5)
  set largeWelcomeImage($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLargeWelcomeImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLargeWelcomeImage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get supportedThreadsSorting => $_getList(6);
}

class GetThreadInfosRes extends $pb.GeneratedMessage {
  factory GetThreadInfosRes({
    $core.Iterable<ThreadInfo>? threadInfos,
    PaginationRes? page,
  }) {
    final $result = create();
    if (threadInfos != null) {
      $result.threadInfos.addAll(threadInfos);
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  GetThreadInfosRes._() : super();
  factory GetThreadInfosRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadInfosRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadInfosRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<ThreadInfo>(1, _omitFieldNames ? '' : 'threadInfos', $pb.PbFieldType.PM, protoName: 'threadInfos', subBuilder: ThreadInfo.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: PaginationRes.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadInfosRes clone() => GetThreadInfosRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadInfosRes copyWith(void Function(GetThreadInfosRes) updates) => super.copyWith((message) => updates(message as GetThreadInfosRes)) as GetThreadInfosRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadInfosRes create() => GetThreadInfosRes._();
  GetThreadInfosRes createEmptyInstance() => create();
  static $pb.PbList<GetThreadInfosRes> createRepeated() => $pb.PbList<GetThreadInfosRes>();
  @$core.pragma('dart2js:noInline')
  static GetThreadInfosRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadInfosRes>(create);
  static GetThreadInfosRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ThreadInfo> get threadInfos => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  PaginationRes ensurePage() => $_ensure(1);
}

class ThreadInfo extends $pb.GeneratedMessage {
  factory ThreadInfo({
    $core.String? id,
    $core.String? title,
    $core.String? authorName,
    $core.String? boardId,
    $core.String? siteId,
    $fixnum.Int64? createdAt,
    $fixnum.Int64? latestRegardingPostCreatedAt,
    $core.int? regardingPostCount,
    $core.String? previewContent,
    $core.Iterable<$core.String>? tags,
    $core.String? url,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (title != null) {
      $result.title = title;
    }
    if (authorName != null) {
      $result.authorName = authorName;
    }
    if (boardId != null) {
      $result.boardId = boardId;
    }
    if (siteId != null) {
      $result.siteId = siteId;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (latestRegardingPostCreatedAt != null) {
      $result.latestRegardingPostCreatedAt = latestRegardingPostCreatedAt;
    }
    if (regardingPostCount != null) {
      $result.regardingPostCount = regardingPostCount;
    }
    if (previewContent != null) {
      $result.previewContent = previewContent;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  ThreadInfo._() : super();
  factory ThreadInfo.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ThreadInfo.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ThreadInfo', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'title')
    ..aOS(3, _omitFieldNames ? '' : 'authorName')
    ..aOS(4, _omitFieldNames ? '' : 'boardId')
    ..aOS(5, _omitFieldNames ? '' : 'siteId')
    ..aInt64(6, _omitFieldNames ? '' : 'createdAt')
    ..aInt64(7, _omitFieldNames ? '' : 'latestRegardingPostCreatedAt')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'regardingPostCount', $pb.PbFieldType.O3)
    ..aOS(9, _omitFieldNames ? '' : 'previewContent')
    ..pPS(10, _omitFieldNames ? '' : 'tags')
    ..aOS(11, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ThreadInfo clone() => ThreadInfo()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ThreadInfo copyWith(void Function(ThreadInfo) updates) => super.copyWith((message) => updates(message as ThreadInfo)) as ThreadInfo;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ThreadInfo create() => ThreadInfo._();
  ThreadInfo createEmptyInstance() => create();
  static $pb.PbList<ThreadInfo> createRepeated() => $pb.PbList<ThreadInfo>();
  @$core.pragma('dart2js:noInline')
  static ThreadInfo getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ThreadInfo>(create);
  static ThreadInfo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get title => $_getSZ(1);
  @$pb.TagNumber(2)
  set title($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTitle() => $_has(1);
  @$pb.TagNumber(2)
  void clearTitle() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get authorName => $_getSZ(2);
  @$pb.TagNumber(3)
  set authorName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAuthorName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthorName() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get boardId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boardId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBoardId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoardId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get siteId => $_getSZ(4);
  @$pb.TagNumber(5)
  set siteId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSiteId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSiteId() => clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get createdAt => $_getI64(5);
  @$pb.TagNumber(6)
  set createdAt($fixnum.Int64 v) { $_setInt64(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get latestRegardingPostCreatedAt => $_getI64(6);
  @$pb.TagNumber(7)
  set latestRegardingPostCreatedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasLatestRegardingPostCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearLatestRegardingPostCreatedAt() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get regardingPostCount => $_getIZ(7);
  @$pb.TagNumber(8)
  set regardingPostCount($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasRegardingPostCount() => $_has(7);
  @$pb.TagNumber(8)
  void clearRegardingPostCount() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get previewContent => $_getSZ(8);
  @$pb.TagNumber(9)
  set previewContent($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasPreviewContent() => $_has(8);
  @$pb.TagNumber(9)
  void clearPreviewContent() => clearField(9);

  @$pb.TagNumber(10)
  $core.List<$core.String> get tags => $_getList(9);

  @$pb.TagNumber(11)
  $core.String get url => $_getSZ(10);
  @$pb.TagNumber(11)
  set url($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasUrl() => $_has(10);
  @$pb.TagNumber(11)
  void clearUrl() => clearField(11);
}

class GetThreadRes extends $pb.GeneratedMessage {
  factory GetThreadRes({
    Thread? thread,
  }) {
    final $result = create();
    if (thread != null) {
      $result.thread = thread;
    }
    return $result;
  }
  GetThreadRes._() : super();
  factory GetThreadRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<Thread>(1, _omitFieldNames ? '' : 'thread', subBuilder: Thread.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadRes clone() => GetThreadRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadRes copyWith(void Function(GetThreadRes) updates) => super.copyWith((message) => updates(message as GetThreadRes)) as GetThreadRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadRes create() => GetThreadRes._();
  GetThreadRes createEmptyInstance() => create();
  static $pb.PbList<GetThreadRes> createRepeated() => $pb.PbList<GetThreadRes>();
  @$core.pragma('dart2js:noInline')
  static GetThreadRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadRes>(create);
  static GetThreadRes? _defaultInstance;

  @$pb.TagNumber(1)
  Thread get thread => $_getN(0);
  @$pb.TagNumber(1)
  set thread(Thread v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasThread() => $_has(0);
  @$pb.TagNumber(1)
  void clearThread() => clearField(1);
  @$pb.TagNumber(1)
  Thread ensureThread() => $_ensure(0);
}

class Thread extends $pb.GeneratedMessage {
  factory Thread({
    $core.String? id,
    $core.String? siteId,
    $core.String? boardId,
    $fixnum.Int64? latestRegardingPostCreatedAt,
    $core.int? regardingPostCount,
    $core.Iterable<$core.String>? tags,
    Post? originalPost,
    $core.String? url,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (siteId != null) {
      $result.siteId = siteId;
    }
    if (boardId != null) {
      $result.boardId = boardId;
    }
    if (latestRegardingPostCreatedAt != null) {
      $result.latestRegardingPostCreatedAt = latestRegardingPostCreatedAt;
    }
    if (regardingPostCount != null) {
      $result.regardingPostCount = regardingPostCount;
    }
    if (tags != null) {
      $result.tags.addAll(tags);
    }
    if (originalPost != null) {
      $result.originalPost = originalPost;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  Thread._() : super();
  factory Thread.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Thread.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Thread', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'siteId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aInt64(4, _omitFieldNames ? '' : 'latestRegardingPostCreatedAt')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'regardingPostCount', $pb.PbFieldType.O3)
    ..pPS(6, _omitFieldNames ? '' : 'tags')
    ..aOM<Post>(7, _omitFieldNames ? '' : 'originalPost', subBuilder: Post.create)
    ..aOS(8, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Thread clone() => Thread()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Thread copyWith(void Function(Thread) updates) => super.copyWith((message) => updates(message as Thread)) as Thread;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Thread create() => Thread._();
  Thread createEmptyInstance() => create();
  static $pb.PbList<Thread> createRepeated() => $pb.PbList<Thread>();
  @$core.pragma('dart2js:noInline')
  static Thread getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Thread>(create);
  static Thread? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get siteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set siteId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasSiteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSiteId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get boardId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boardId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoardId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoardId() => clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get latestRegardingPostCreatedAt => $_getI64(3);
  @$pb.TagNumber(4)
  set latestRegardingPostCreatedAt($fixnum.Int64 v) { $_setInt64(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLatestRegardingPostCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearLatestRegardingPostCreatedAt() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get regardingPostCount => $_getIZ(4);
  @$pb.TagNumber(5)
  set regardingPostCount($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasRegardingPostCount() => $_has(4);
  @$pb.TagNumber(5)
  void clearRegardingPostCount() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.String> get tags => $_getList(5);

  @$pb.TagNumber(7)
  Post get originalPost => $_getN(6);
  @$pb.TagNumber(7)
  set originalPost(Post v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasOriginalPost() => $_has(6);
  @$pb.TagNumber(7)
  void clearOriginalPost() => clearField(7);
  @$pb.TagNumber(7)
  Post ensureOriginalPost() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get url => $_getSZ(7);
  @$pb.TagNumber(8)
  set url($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasUrl() => $_has(7);
  @$pb.TagNumber(8)
  void clearUrl() => clearField(8);
}

class GetRegardingPostsRes extends $pb.GeneratedMessage {
  factory GetRegardingPostsRes({
    $core.Iterable<Post>? regardingPosts,
    PaginationRes? page,
  }) {
    final $result = create();
    if (regardingPosts != null) {
      $result.regardingPosts.addAll(regardingPosts);
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  GetRegardingPostsRes._() : super();
  factory GetRegardingPostsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRegardingPostsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRegardingPostsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<Post>(1, _omitFieldNames ? '' : 'regardingPosts', $pb.PbFieldType.PM, subBuilder: Post.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: PaginationRes.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRegardingPostsRes clone() => GetRegardingPostsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRegardingPostsRes copyWith(void Function(GetRegardingPostsRes) updates) => super.copyWith((message) => updates(message as GetRegardingPostsRes)) as GetRegardingPostsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsRes create() => GetRegardingPostsRes._();
  GetRegardingPostsRes createEmptyInstance() => create();
  static $pb.PbList<GetRegardingPostsRes> createRepeated() => $pb.PbList<GetRegardingPostsRes>();
  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRegardingPostsRes>(create);
  static GetRegardingPostsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Post> get regardingPosts => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  PaginationRes ensurePage() => $_ensure(1);
}

class GetPostRes extends $pb.GeneratedMessage {
  factory GetPostRes({
    Post? post,
  }) {
    final $result = create();
    if (post != null) {
      $result.post = post;
    }
    return $result;
  }
  GetPostRes._() : super();
  factory GetPostRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPostRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPostRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<Post>(1, _omitFieldNames ? '' : 'post', subBuilder: Post.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPostRes clone() => GetPostRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPostRes copyWith(void Function(GetPostRes) updates) => super.copyWith((message) => updates(message as GetPostRes)) as GetPostRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPostRes create() => GetPostRes._();
  GetPostRes createEmptyInstance() => create();
  static $pb.PbList<GetPostRes> createRepeated() => $pb.PbList<GetPostRes>();
  @$core.pragma('dart2js:noInline')
  static GetPostRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPostRes>(create);
  static GetPostRes? _defaultInstance;

  @$pb.TagNumber(1)
  Post get post => $_getN(0);
  @$pb.TagNumber(1)
  set post(Post v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearPost() => clearField(1);
  @$pb.TagNumber(1)
  Post ensurePost() => $_ensure(0);
}

enum Paragraph_Content {
  image, 
  video, 
  text, 
  quote, 
  replyTo, 
  link, 
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
  }) {
    final $result = create();
    if (type != null) {
      $result.type = type;
    }
    if (image != null) {
      $result.image = image;
    }
    if (video != null) {
      $result.video = video;
    }
    if (text != null) {
      $result.text = text;
    }
    if (quote != null) {
      $result.quote = quote;
    }
    if (replyTo != null) {
      $result.replyTo = replyTo;
    }
    if (link != null) {
      $result.link = link;
    }
    return $result;
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
    0 : Paragraph_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Paragraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7])
    ..e<ParagraphType>(1, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: ParagraphType.PARAGRAPH_TYPE_UNSPECIFIED, valueOf: ParagraphType.valueOf, enumValues: ParagraphType.values)
    ..aOM<ImageParagraph>(2, _omitFieldNames ? '' : 'image', subBuilder: ImageParagraph.create)
    ..aOM<VideoParagraph>(3, _omitFieldNames ? '' : 'video', subBuilder: VideoParagraph.create)
    ..aOM<TextParagraph>(4, _omitFieldNames ? '' : 'text', subBuilder: TextParagraph.create)
    ..aOM<QuoteParagraph>(5, _omitFieldNames ? '' : 'quote', subBuilder: QuoteParagraph.create)
    ..aOM<ReplyToParagraph>(6, _omitFieldNames ? '' : 'replyTo', subBuilder: ReplyToParagraph.create)
    ..aOM<LinkParagraph>(7, _omitFieldNames ? '' : 'link', subBuilder: LinkParagraph.create)
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
}

class ImageParagraph extends $pb.GeneratedMessage {
  factory ImageParagraph({
    $core.String? thumb,
    $core.String? raw,
  }) {
    final $result = create();
    if (thumb != null) {
      $result.thumb = thumb;
    }
    if (raw != null) {
      $result.raw = raw;
    }
    return $result;
  }
  ImageParagraph._() : super();
  factory ImageParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ImageParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ImageParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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
    final $result = create();
    if (thumb != null) {
      $result.thumb = thumb;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  VideoParagraph._() : super();
  factory VideoParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory VideoParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'VideoParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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
    final $result = create();
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  TextParagraph._() : super();
  factory TextParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TextParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TextParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

class QuoteParagraph extends $pb.GeneratedMessage {
  factory QuoteParagraph({
    $core.String? content,
  }) {
    final $result = create();
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  QuoteParagraph._() : super();
  factory QuoteParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory QuoteParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'QuoteParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    return $result;
  }
  ReplyToParagraph._() : super();
  factory ReplyToParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ReplyToParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyToParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
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
}

class LinkParagraph extends $pb.GeneratedMessage {
  factory LinkParagraph({
    $core.String? content,
  }) {
    final $result = create();
    if (content != null) {
      $result.content = content;
    }
    return $result;
  }
  LinkParagraph._() : super();
  factory LinkParagraph.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LinkParagraph.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LinkParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

class Post extends $pb.GeneratedMessage {
  factory Post({
    $core.String? id,
    $core.String? threadId,
    $core.String? boardId,
    $core.String? siteId,
    $core.String? authorName,
    $core.String? content,
    $fixnum.Int64? createdAt,
    $core.String? title,
    $core.String? originPostId,
    $core.String? authorId,
    $core.int? like,
    $core.int? dislike,
    $core.int? comments,
    $core.Iterable<Paragraph>? contents,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (threadId != null) {
      $result.threadId = threadId;
    }
    if (boardId != null) {
      $result.boardId = boardId;
    }
    if (siteId != null) {
      $result.siteId = siteId;
    }
    if (authorName != null) {
      $result.authorName = authorName;
    }
    if (content != null) {
      $result.content = content;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (title != null) {
      $result.title = title;
    }
    if (originPostId != null) {
      $result.originPostId = originPostId;
    }
    if (authorId != null) {
      $result.authorId = authorId;
    }
    if (like != null) {
      $result.like = like;
    }
    if (dislike != null) {
      $result.dislike = dislike;
    }
    if (comments != null) {
      $result.comments = comments;
    }
    if (contents != null) {
      $result.contents.addAll(contents);
    }
    return $result;
  }
  Post._() : super();
  factory Post.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Post.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Post', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'threadId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aOS(4, _omitFieldNames ? '' : 'siteId')
    ..aOS(5, _omitFieldNames ? '' : 'authorName')
    ..aOS(6, _omitFieldNames ? '' : 'content')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'title')
    ..aOS(10, _omitFieldNames ? '' : 'originPostId')
    ..aOS(11, _omitFieldNames ? '' : 'authorId', protoName: 'authorId')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'like', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'dislike', $pb.PbFieldType.O3)
    ..a<$core.int>(14, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.O3)
    ..pc<Paragraph>(15, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM, subBuilder: Paragraph.create)
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

  @$pb.TagNumber(4)
  $core.String get siteId => $_getSZ(3);
  @$pb.TagNumber(4)
  set siteId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSiteId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSiteId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get authorName => $_getSZ(4);
  @$pb.TagNumber(5)
  set authorName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasAuthorName() => $_has(4);
  @$pb.TagNumber(5)
  void clearAuthorName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get content => $_getSZ(5);
  @$pb.TagNumber(6)
  set content($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasContent() => $_has(5);
  @$pb.TagNumber(6)
  void clearContent() => clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(6);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => clearField(7);

  @$pb.TagNumber(9)
  $core.String get title => $_getSZ(7);
  @$pb.TagNumber(9)
  set title($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(7);
  @$pb.TagNumber(9)
  void clearTitle() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get originPostId => $_getSZ(8);
  @$pb.TagNumber(10)
  set originPostId($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasOriginPostId() => $_has(8);
  @$pb.TagNumber(10)
  void clearOriginPostId() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get authorId => $_getSZ(9);
  @$pb.TagNumber(11)
  set authorId($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(11)
  $core.bool hasAuthorId() => $_has(9);
  @$pb.TagNumber(11)
  void clearAuthorId() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get like => $_getIZ(10);
  @$pb.TagNumber(12)
  set like($core.int v) { $_setSignedInt32(10, v); }
  @$pb.TagNumber(12)
  $core.bool hasLike() => $_has(10);
  @$pb.TagNumber(12)
  void clearLike() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get dislike => $_getIZ(11);
  @$pb.TagNumber(13)
  set dislike($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(13)
  $core.bool hasDislike() => $_has(11);
  @$pb.TagNumber(13)
  void clearDislike() => clearField(13);

  @$pb.TagNumber(14)
  $core.int get comments => $_getIZ(12);
  @$pb.TagNumber(14)
  set comments($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(14)
  $core.bool hasComments() => $_has(12);
  @$pb.TagNumber(14)
  void clearComments() => clearField(14);

  @$pb.TagNumber(15)
  $core.List<Paragraph> get contents => $_getList(13);
}

class GetCommentsRes extends $pb.GeneratedMessage {
  factory GetCommentsRes({
    $core.Iterable<Comment>? comments,
    PaginationRes? page,
  }) {
    final $result = create();
    if (comments != null) {
      $result.comments.addAll(comments);
    }
    if (page != null) {
      $result.page = page;
    }
    return $result;
  }
  GetCommentsRes._() : super();
  factory GetCommentsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCommentsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCommentsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<Comment>(1, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: Comment.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: PaginationRes.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCommentsRes clone() => GetCommentsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCommentsRes copyWith(void Function(GetCommentsRes) updates) => super.copyWith((message) => updates(message as GetCommentsRes)) as GetCommentsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommentsRes create() => GetCommentsRes._();
  GetCommentsRes createEmptyInstance() => create();
  static $pb.PbList<GetCommentsRes> createRepeated() => $pb.PbList<GetCommentsRes>();
  @$core.pragma('dart2js:noInline')
  static GetCommentsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCommentsRes>(create);
  static GetCommentsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Comment> get comments => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  PaginationRes ensurePage() => $_ensure(1);
}

class Comment extends $pb.GeneratedMessage {
  factory Comment({
    $core.String? id,
    $core.String? postId,
    $core.String? threadId,
    $core.String? boardId,
    $core.String? siteId,
    $core.String? authorId,
    $fixnum.Int64? createdAt,
    $core.String? authorName,
    $core.Iterable<Paragraph>? contents,
  }) {
    final $result = create();
    if (id != null) {
      $result.id = id;
    }
    if (postId != null) {
      $result.postId = postId;
    }
    if (threadId != null) {
      $result.threadId = threadId;
    }
    if (boardId != null) {
      $result.boardId = boardId;
    }
    if (siteId != null) {
      $result.siteId = siteId;
    }
    if (authorId != null) {
      $result.authorId = authorId;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (authorName != null) {
      $result.authorName = authorName;
    }
    if (contents != null) {
      $result.contents.addAll(contents);
    }
    return $result;
  }
  Comment._() : super();
  factory Comment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Comment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Comment', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'postId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOS(4, _omitFieldNames ? '' : 'boardId')
    ..aOS(5, _omitFieldNames ? '' : 'siteId')
    ..aOS(6, _omitFieldNames ? '' : 'authorId')
    ..aInt64(8, _omitFieldNames ? '' : 'createdAt')
    ..aOS(10, _omitFieldNames ? '' : 'authorName')
    ..pc<Paragraph>(11, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM, subBuilder: Paragraph.create)
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

  @$pb.TagNumber(5)
  $core.String get siteId => $_getSZ(4);
  @$pb.TagNumber(5)
  set siteId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSiteId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSiteId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get authorId => $_getSZ(5);
  @$pb.TagNumber(6)
  set authorId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAuthorId() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuthorId() => clearField(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get createdAt => $_getI64(6);
  @$pb.TagNumber(8)
  set createdAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);

  @$pb.TagNumber(10)
  $core.String get authorName => $_getSZ(7);
  @$pb.TagNumber(10)
  set authorName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(10)
  $core.bool hasAuthorName() => $_has(7);
  @$pb.TagNumber(10)
  void clearAuthorName() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<Paragraph> get contents => $_getList(8);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
