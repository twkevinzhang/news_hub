//
//  Generated code. Do not modify.
//  source: sidecar_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'sidecar_api.pbenum.dart';

export 'sidecar_api.pbenum.dart';

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

class GetSiteReq extends $pb.GeneratedMessage {
  factory GetSiteReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetSiteReq._() : super();
  factory GetSiteReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSiteReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSiteReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSiteReq clone() => GetSiteReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSiteReq copyWith(void Function(GetSiteReq) updates) => super.copyWith((message) => updates(message as GetSiteReq)) as GetSiteReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSiteReq create() => GetSiteReq._();
  GetSiteReq createEmptyInstance() => create();
  static $pb.PbList<GetSiteReq> createRepeated() => $pb.PbList<GetSiteReq>();
  @$core.pragma('dart2js:noInline')
  static GetSiteReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSiteReq>(create);
  static GetSiteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => clearField(1);
}

class GetSiteRes extends $pb.GeneratedMessage {
  factory GetSiteRes({
    Site? site,
  }) {
    final result = create();
    if (site != null) {
      result.site = site;
    }
    return result;
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
    $core.String? pkgName,
  }) {
    final result = create();
    if (name != null) {
      result.name = name;
    }
    if (description != null) {
      result.description = description;
    }
    if (url != null) {
      result.url = url;
    }
    if (id != null) {
      result.id = id;
    }
    if (icon != null) {
      result.icon = icon;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
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
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
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

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(5);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);
}

class GetBoardsReq extends $pb.GeneratedMessage {
  factory GetBoardsReq({
    $core.String? siteId,
    PaginationReq? page,
    $core.String? pkgName,
  }) {
    final result = create();
    if (siteId != null) {
      result.siteId = siteId;
    }
    if (page != null) {
      result.page = page;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetBoardsReq._() : super();
  factory GetBoardsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBoardsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBoardsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..aOM<PaginationReq>(2, _omitFieldNames ? '' : 'page', subBuilder: PaginationReq.create)
    ..aOS(3, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBoardsReq clone() => GetBoardsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBoardsReq copyWith(void Function(GetBoardsReq) updates) => super.copyWith((message) => updates(message as GetBoardsReq)) as GetBoardsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBoardsReq create() => GetBoardsReq._();
  GetBoardsReq createEmptyInstance() => create();
  static $pb.PbList<GetBoardsReq> createRepeated() => $pb.PbList<GetBoardsReq>();
  @$core.pragma('dart2js:noInline')
  static GetBoardsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBoardsReq>(create);
  static GetBoardsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => clearField(1);

  @$pb.TagNumber(2)
  PaginationReq get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationReq v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  PaginationReq ensurePage() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get pkgName => $_getSZ(2);
  @$pb.TagNumber(3)
  set pkgName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPkgName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPkgName() => clearField(3);
}

class GetBoardsRes extends $pb.GeneratedMessage {
  factory GetBoardsRes({
    $core.Iterable<Board>? boards,
    PaginationRes? page,
  }) {
    final result = create();
    if (boards != null) {
      result.boards.addAll(boards);
    }
    if (page != null) {
      result.page = page;
    }
    return result;
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
    $core.String? pkgName,
  }) {
    final result = create();
    if (id != null) {
      result.id = id;
    }
    if (siteId != null) {
      result.siteId = siteId;
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Board', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'siteId')
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

  @$pb.TagNumber(8)
  $core.String get pkgName => $_getSZ(7);
  @$pb.TagNumber(8)
  set pkgName($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasPkgName() => $_has(7);
  @$pb.TagNumber(8)
  void clearPkgName() => clearField(8);
}

class GetThreadInfosReq extends $pb.GeneratedMessage {
  factory GetThreadInfosReq({
    $core.String? siteId,
    $core.Map<$core.String, $core.String>? boardsSorting,
    PaginationReq? page,
    $core.String? keywords,
    $core.String? pkgName,
  }) {
    final result = create();
    if (siteId != null) {
      result.siteId = siteId;
    }
    if (boardsSorting != null) {
      result.boardsSorting.addAll(boardsSorting);
    }
    if (page != null) {
      result.page = page;
    }
    if (keywords != null) {
      result.keywords = keywords;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetThreadInfosReq._() : super();
  factory GetThreadInfosReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadInfosReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadInfosReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'boardsSorting', entryClassName: 'GetThreadInfosReq.BoardsSortingEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OS, packageName: const $pb.PackageName('pb'))
    ..aOM<PaginationReq>(3, _omitFieldNames ? '' : 'page', subBuilder: PaginationReq.create)
    ..aOS(5, _omitFieldNames ? '' : 'keywords')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadInfosReq clone() => GetThreadInfosReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadInfosReq copyWith(void Function(GetThreadInfosReq) updates) => super.copyWith((message) => updates(message as GetThreadInfosReq)) as GetThreadInfosReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadInfosReq create() => GetThreadInfosReq._();
  GetThreadInfosReq createEmptyInstance() => create();
  static $pb.PbList<GetThreadInfosReq> createRepeated() => $pb.PbList<GetThreadInfosReq>();
  @$core.pragma('dart2js:noInline')
  static GetThreadInfosReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadInfosReq>(create);
  static GetThreadInfosReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.Map<$core.String, $core.String> get boardsSorting => $_getMap(1);

  @$pb.TagNumber(3)
  PaginationReq get page => $_getN(2);
  @$pb.TagNumber(3)
  set page(PaginationReq v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);
  @$pb.TagNumber(3)
  PaginationReq ensurePage() => $_ensure(2);

  @$pb.TagNumber(5)
  $core.String get keywords => $_getSZ(3);
  @$pb.TagNumber(5)
  set keywords($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasKeywords() => $_has(3);
  @$pb.TagNumber(5)
  void clearKeywords() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);
}

class GetThreadInfosRes extends $pb.GeneratedMessage {
  factory GetThreadInfosRes({
    $core.Iterable<Post>? threadInfos,
    PaginationRes? page,
  }) {
    final result = create();
    if (threadInfos != null) {
      result.threadInfos.addAll(threadInfos);
    }
    if (page != null) {
      result.page = page;
    }
    return result;
  }
  GetThreadInfosRes._() : super();
  factory GetThreadInfosRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadInfosRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadInfosRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<Post>(1, _omitFieldNames ? '' : 'threadInfos', $pb.PbFieldType.PM, subBuilder: Post.create)
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
  $core.List<Post> get threadInfos => $_getList(0);

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

class GetThreadPostReq extends $pb.GeneratedMessage {
  factory GetThreadPostReq({
    $core.String? threadId,
    $core.String? siteId,
    $core.String? boardId,
    $core.String? postId,
    $core.String? pkgName,
  }) {
    final result = create();
    if (threadId != null) {
      result.threadId = threadId;
    }
    if (siteId != null) {
      result.siteId = siteId;
    }
    if (boardId != null) {
      result.boardId = boardId;
    }
    if (postId != null) {
      result.postId = postId;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetThreadPostReq._() : super();
  factory GetThreadPostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadPostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadPostReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'threadId')
    ..aOS(2, _omitFieldNames ? '' : 'siteId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aOS(4, _omitFieldNames ? '' : 'postId')
    ..aOS(5, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadPostReq clone() => GetThreadPostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadPostReq copyWith(void Function(GetThreadPostReq) updates) => super.copyWith((message) => updates(message as GetThreadPostReq)) as GetThreadPostReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadPostReq create() => GetThreadPostReq._();
  GetThreadPostReq createEmptyInstance() => create();
  static $pb.PbList<GetThreadPostReq> createRepeated() => $pb.PbList<GetThreadPostReq>();
  @$core.pragma('dart2js:noInline')
  static GetThreadPostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadPostReq>(create);
  static GetThreadPostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get threadId => $_getSZ(0);
  @$pb.TagNumber(1)
  set threadId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);

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
  $core.String get postId => $_getSZ(3);
  @$pb.TagNumber(4)
  set postId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPostId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPostId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(5)
  set pkgName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkgName() => clearField(5);
}

class GetThreadPostRes extends $pb.GeneratedMessage {
  factory GetThreadPostRes({
    Post? threadPost,
  }) {
    final result = create();
    if (threadPost != null) {
      result.threadPost = threadPost;
    }
    return result;
  }
  GetThreadPostRes._() : super();
  factory GetThreadPostRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadPostRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadPostRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<Post>(1, _omitFieldNames ? '' : 'threadPost', subBuilder: Post.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadPostRes clone() => GetThreadPostRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadPostRes copyWith(void Function(GetThreadPostRes) updates) => super.copyWith((message) => updates(message as GetThreadPostRes)) as GetThreadPostRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadPostRes create() => GetThreadPostRes._();
  GetThreadPostRes createEmptyInstance() => create();
  static $pb.PbList<GetThreadPostRes> createRepeated() => $pb.PbList<GetThreadPostRes>();
  @$core.pragma('dart2js:noInline')
  static GetThreadPostRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadPostRes>(create);
  static GetThreadPostRes? _defaultInstance;

  @$pb.TagNumber(1)
  Post get threadPost => $_getN(0);
  @$pb.TagNumber(1)
  set threadPost(Post v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadPost() => clearField(1);
  @$pb.TagNumber(1)
  Post ensureThreadPost() => $_ensure(0);
}

class GetRegardingPostsReq extends $pb.GeneratedMessage {
  factory GetRegardingPostsReq({
    $core.String? siteId,
    $core.String? boardId,
    $core.String? threadId,
    PaginationReq? page,
    $core.String? replyToId,
    $core.String? pkgName,
  }) {
    final result = create();
    if (siteId != null) {
      result.siteId = siteId;
    }
    if (boardId != null) {
      result.boardId = boardId;
    }
    if (threadId != null) {
      result.threadId = threadId;
    }
    if (page != null) {
      result.page = page;
    }
    if (replyToId != null) {
      result.replyToId = replyToId;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetRegardingPostsReq._() : super();
  factory GetRegardingPostsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRegardingPostsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRegardingPostsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..aOS(2, _omitFieldNames ? '' : 'boardId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOM<PaginationReq>(4, _omitFieldNames ? '' : 'page', subBuilder: PaginationReq.create)
    ..aOS(5, _omitFieldNames ? '' : 'replyToId')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRegardingPostsReq clone() => GetRegardingPostsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRegardingPostsReq copyWith(void Function(GetRegardingPostsReq) updates) => super.copyWith((message) => updates(message as GetRegardingPostsReq)) as GetRegardingPostsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsReq create() => GetRegardingPostsReq._();
  GetRegardingPostsReq createEmptyInstance() => create();
  static $pb.PbList<GetRegardingPostsReq> createRepeated() => $pb.PbList<GetRegardingPostsReq>();
  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRegardingPostsReq>(create);
  static GetRegardingPostsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get boardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boardId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(2);
  @$pb.TagNumber(3)
  set threadId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => clearField(3);

  @$pb.TagNumber(4)
  PaginationReq get page => $_getN(3);
  @$pb.TagNumber(4)
  set page(PaginationReq v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => clearField(4);
  @$pb.TagNumber(4)
  PaginationReq ensurePage() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get replyToId => $_getSZ(4);
  @$pb.TagNumber(5)
  set replyToId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReplyToId() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplyToId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(5);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);
}

class GetRegardingPostsRes extends $pb.GeneratedMessage {
  factory GetRegardingPostsRes({
    $core.Iterable<Post>? regardingPosts,
    PaginationRes? page,
  }) {
    final result = create();
    if (regardingPosts != null) {
      result.regardingPosts.addAll(regardingPosts);
    }
    if (page != null) {
      result.page = page;
    }
    return result;
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Paragraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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
    final result = create();
    if (content != null) {
      result.content = content;
    }
    return result;
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'NewLineParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ReplyToParagraph', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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
    $core.String? siteId,
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
    if (siteId != null) {
      result.siteId = siteId;
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
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Post', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..oo(0, [7, 8])
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'threadId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aOS(4, _omitFieldNames ? '' : 'siteId')
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

  @$pb.TagNumber(4)
  $core.String get siteId => $_getSZ(3);
  @$pb.TagNumber(4)
  set siteId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSiteId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSiteId() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);

  @$pb.TagNumber(7)
  ArticlePost get articlePost => $_getN(5);
  @$pb.TagNumber(7)
  set articlePost(ArticlePost v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasArticlePost() => $_has(5);
  @$pb.TagNumber(7)
  void clearArticlePost() => clearField(7);
  @$pb.TagNumber(7)
  ArticlePost ensureArticlePost() => $_ensure(5);

  @$pb.TagNumber(8)
  SingleImagePost get singleImagePost => $_getN(6);
  @$pb.TagNumber(8)
  set singleImagePost(SingleImagePost v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSingleImagePost() => $_has(6);
  @$pb.TagNumber(8)
  void clearSingleImagePost() => clearField(8);
  @$pb.TagNumber(8)
  SingleImagePost ensureSingleImagePost() => $_ensure(6);
}

class ArticlePost extends $pb.GeneratedMessage {
  factory ArticlePost({
    $core.String? authorName,
    $fixnum.Int64? createdAt,
    $core.String? title,
    $core.String? authorId,
    $core.int? liked,
    $core.int? disliked,
    $fixnum.Int64? latestRegardingPostCreatedAt,
    $core.Iterable<Paragraph>? contents,
    $core.Iterable<$core.String>? tags,
    $core.int? regardingPostsCount,
    $core.String? url,
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
    if (latestRegardingPostCreatedAt != null) {
      result.latestRegardingPostCreatedAt = latestRegardingPostCreatedAt;
    }
    if (contents != null) {
      result.contents.addAll(contents);
    }
    if (tags != null) {
      result.tags.addAll(tags);
    }
    if (regardingPostsCount != null) {
      result.regardingPostsCount = regardingPostsCount;
    }
    if (url != null) {
      result.url = url;
    }
    return result;
  }
  ArticlePost._() : super();
  factory ArticlePost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ArticlePost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ArticlePost', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'authorName')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'title')
    ..aOS(11, _omitFieldNames ? '' : 'authorId')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'liked', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'disliked', $pb.PbFieldType.O3)
    ..aInt64(15, _omitFieldNames ? '' : 'latestRegardingPostCreatedAt')
    ..pc<Paragraph>(17, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM, subBuilder: Paragraph.create)
    ..pPS(18, _omitFieldNames ? '' : 'tags')
    ..a<$core.int>(19, _omitFieldNames ? '' : 'regardingPostsCount', $pb.PbFieldType.O3)
    ..aOS(20, _omitFieldNames ? '' : 'url')
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
  $fixnum.Int64 get latestRegardingPostCreatedAt => $_getI64(6);
  @$pb.TagNumber(15)
  set latestRegardingPostCreatedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(15)
  $core.bool hasLatestRegardingPostCreatedAt() => $_has(6);
  @$pb.TagNumber(15)
  void clearLatestRegardingPostCreatedAt() => clearField(15);

  @$pb.TagNumber(17)
  $core.List<Paragraph> get contents => $_getList(7);

  @$pb.TagNumber(18)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(19)
  $core.int get regardingPostsCount => $_getIZ(9);
  @$pb.TagNumber(19)
  set regardingPostsCount($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(19)
  $core.bool hasRegardingPostsCount() => $_has(9);
  @$pb.TagNumber(19)
  void clearRegardingPostsCount() => clearField(19);

  @$pb.TagNumber(20)
  $core.String get url => $_getSZ(10);
  @$pb.TagNumber(20)
  set url($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(20)
  $core.bool hasUrl() => $_has(10);
  @$pb.TagNumber(20)
  void clearUrl() => clearField(20);
}

class SingleImagePost extends $pb.GeneratedMessage {
  factory SingleImagePost({
    $core.String? authorName,
    $fixnum.Int64? createdAt,
    $core.String? title,
    $core.String? authorId,
    $core.int? liked,
    $core.int? disliked,
    $fixnum.Int64? latestRegardingPostCreatedAt,
    $core.Iterable<Paragraph>? contents,
    $core.Iterable<$core.String>? tags,
    $core.int? regardingPostsCount,
    $core.String? url,
    ImageParagraph? image,
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
    if (latestRegardingPostCreatedAt != null) {
      result.latestRegardingPostCreatedAt = latestRegardingPostCreatedAt;
    }
    if (contents != null) {
      result.contents.addAll(contents);
    }
    if (tags != null) {
      result.tags.addAll(tags);
    }
    if (regardingPostsCount != null) {
      result.regardingPostsCount = regardingPostsCount;
    }
    if (url != null) {
      result.url = url;
    }
    if (image != null) {
      result.image = image;
    }
    return result;
  }
  SingleImagePost._() : super();
  factory SingleImagePost.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SingleImagePost.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SingleImagePost', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'authorName')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'title')
    ..aOS(11, _omitFieldNames ? '' : 'authorId')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'liked', $pb.PbFieldType.O3)
    ..a<$core.int>(13, _omitFieldNames ? '' : 'disliked', $pb.PbFieldType.O3)
    ..aInt64(15, _omitFieldNames ? '' : 'latestRegardingPostCreatedAt')
    ..pc<Paragraph>(17, _omitFieldNames ? '' : 'contents', $pb.PbFieldType.PM, subBuilder: Paragraph.create)
    ..pPS(18, _omitFieldNames ? '' : 'tags')
    ..a<$core.int>(19, _omitFieldNames ? '' : 'regardingPostsCount', $pb.PbFieldType.O3)
    ..aOS(20, _omitFieldNames ? '' : 'url')
    ..aOM<ImageParagraph>(21, _omitFieldNames ? '' : 'image', subBuilder: ImageParagraph.create)
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
  $fixnum.Int64 get latestRegardingPostCreatedAt => $_getI64(6);
  @$pb.TagNumber(15)
  set latestRegardingPostCreatedAt($fixnum.Int64 v) { $_setInt64(6, v); }
  @$pb.TagNumber(15)
  $core.bool hasLatestRegardingPostCreatedAt() => $_has(6);
  @$pb.TagNumber(15)
  void clearLatestRegardingPostCreatedAt() => clearField(15);

  @$pb.TagNumber(17)
  $core.List<Paragraph> get contents => $_getList(7);

  @$pb.TagNumber(18)
  $core.List<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(19)
  $core.int get regardingPostsCount => $_getIZ(9);
  @$pb.TagNumber(19)
  set regardingPostsCount($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(19)
  $core.bool hasRegardingPostsCount() => $_has(9);
  @$pb.TagNumber(19)
  void clearRegardingPostsCount() => clearField(19);

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
}

class GetCommentsReq extends $pb.GeneratedMessage {
  factory GetCommentsReq({
    $core.String? siteId,
    $core.String? boardId,
    $core.String? threadId,
    $core.String? postId,
    PaginationReq? page,
    $core.String? pkgName,
  }) {
    final result = create();
    if (siteId != null) {
      result.siteId = siteId;
    }
    if (boardId != null) {
      result.boardId = boardId;
    }
    if (threadId != null) {
      result.threadId = threadId;
    }
    if (postId != null) {
      result.postId = postId;
    }
    if (page != null) {
      result.page = page;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetCommentsReq._() : super();
  factory GetCommentsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCommentsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCommentsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..aOS(2, _omitFieldNames ? '' : 'boardId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOS(4, _omitFieldNames ? '' : 'postId')
    ..aOM<PaginationReq>(5, _omitFieldNames ? '' : 'page', subBuilder: PaginationReq.create)
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCommentsReq clone() => GetCommentsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCommentsReq copyWith(void Function(GetCommentsReq) updates) => super.copyWith((message) => updates(message as GetCommentsReq)) as GetCommentsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommentsReq create() => GetCommentsReq._();
  GetCommentsReq createEmptyInstance() => create();
  static $pb.PbList<GetCommentsReq> createRepeated() => $pb.PbList<GetCommentsReq>();
  @$core.pragma('dart2js:noInline')
  static GetCommentsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCommentsReq>(create);
  static GetCommentsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get boardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boardId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(2);
  @$pb.TagNumber(3)
  set threadId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get postId => $_getSZ(3);
  @$pb.TagNumber(4)
  set postId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPostId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPostId() => clearField(4);

  @$pb.TagNumber(5)
  PaginationReq get page => $_getN(4);
  @$pb.TagNumber(5)
  set page(PaginationReq v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPage() => $_has(4);
  @$pb.TagNumber(5)
  void clearPage() => clearField(5);
  @$pb.TagNumber(5)
  PaginationReq ensurePage() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(5);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);
}

class GetCommentsRes extends $pb.GeneratedMessage {
  factory GetCommentsRes({
    $core.Iterable<Comment>? comments,
    PaginationRes? page,
  }) {
    final result = create();
    if (comments != null) {
      result.comments.addAll(comments);
    }
    if (page != null) {
      result.page = page;
    }
    return result;
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
    if (siteId != null) {
      result.siteId = siteId;
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

  @$pb.TagNumber(12)
  $core.String get pkgName => $_getSZ(9);
  @$pb.TagNumber(12)
  set pkgName($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(12)
  $core.bool hasPkgName() => $_has(9);
  @$pb.TagNumber(12)
  void clearPkgName() => clearField(12);
}

class ListInstalledExtensionsRes extends $pb.GeneratedMessage {
  factory ListInstalledExtensionsRes({
    $core.Iterable<Extension>? extensions,
  }) {
    final result = create();
    if (extensions != null) {
      result.extensions.addAll(extensions);
    }
    return result;
  }
  ListInstalledExtensionsRes._() : super();
  factory ListInstalledExtensionsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListInstalledExtensionsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInstalledExtensionsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<Extension>(1, _omitFieldNames ? '' : 'extensions', $pb.PbFieldType.PM, subBuilder: Extension.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListInstalledExtensionsRes clone() => ListInstalledExtensionsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListInstalledExtensionsRes copyWith(void Function(ListInstalledExtensionsRes) updates) => super.copyWith((message) => updates(message as ListInstalledExtensionsRes)) as ListInstalledExtensionsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInstalledExtensionsRes create() => ListInstalledExtensionsRes._();
  ListInstalledExtensionsRes createEmptyInstance() => create();
  static $pb.PbList<ListInstalledExtensionsRes> createRepeated() => $pb.PbList<ListInstalledExtensionsRes>();
  @$core.pragma('dart2js:noInline')
  static ListInstalledExtensionsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListInstalledExtensionsRes>(create);
  static ListInstalledExtensionsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Extension> get extensions => $_getList(0);
}

class GetInstalledExtensionReq extends $pb.GeneratedMessage {
  factory GetInstalledExtensionReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetInstalledExtensionReq._() : super();
  factory GetInstalledExtensionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInstalledExtensionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstalledExtensionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInstalledExtensionReq clone() => GetInstalledExtensionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInstalledExtensionReq copyWith(void Function(GetInstalledExtensionReq) updates) => super.copyWith((message) => updates(message as GetInstalledExtensionReq)) as GetInstalledExtensionReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionReq create() => GetInstalledExtensionReq._();
  GetInstalledExtensionReq createEmptyInstance() => create();
  static $pb.PbList<GetInstalledExtensionReq> createRepeated() => $pb.PbList<GetInstalledExtensionReq>();
  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInstalledExtensionReq>(create);
  static GetInstalledExtensionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => clearField(1);
}

class GetInstalledExtensionRes extends $pb.GeneratedMessage {
  factory GetInstalledExtensionRes({
    Extension? extension_1,
  }) {
    final result = create();
    if (extension_1 != null) {
      result.extension_1 = extension_1;
    }
    return result;
  }
  GetInstalledExtensionRes._() : super();
  factory GetInstalledExtensionRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInstalledExtensionRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstalledExtensionRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<Extension>(1, _omitFieldNames ? '' : 'extension', subBuilder: Extension.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInstalledExtensionRes clone() => GetInstalledExtensionRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInstalledExtensionRes copyWith(void Function(GetInstalledExtensionRes) updates) => super.copyWith((message) => updates(message as GetInstalledExtensionRes)) as GetInstalledExtensionRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionRes create() => GetInstalledExtensionRes._();
  GetInstalledExtensionRes createEmptyInstance() => create();
  static $pb.PbList<GetInstalledExtensionRes> createRepeated() => $pb.PbList<GetInstalledExtensionRes>();
  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInstalledExtensionRes>(create);
  static GetInstalledExtensionRes? _defaultInstance;

  @$pb.TagNumber(1)
  Extension get extension_1 => $_getN(0);
  @$pb.TagNumber(1)
  set extension_1(Extension v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExtension_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearExtension_1() => clearField(1);
  @$pb.TagNumber(1)
  Extension ensureExtension_1() => $_ensure(0);
}

class InstallExtensionReq extends $pb.GeneratedMessage {
  factory InstallExtensionReq({
    $core.String? pkgName,
    $core.String? zipName,
    $core.String? repoUrl,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    if (zipName != null) {
      result.zipName = zipName;
    }
    if (repoUrl != null) {
      result.repoUrl = repoUrl;
    }
    return result;
  }
  InstallExtensionReq._() : super();
  factory InstallExtensionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InstallExtensionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InstallExtensionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..aOS(2, _omitFieldNames ? '' : 'zipName')
    ..aOS(4, _omitFieldNames ? '' : 'repoUrl')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InstallExtensionReq clone() => InstallExtensionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InstallExtensionReq copyWith(void Function(InstallExtensionReq) updates) => super.copyWith((message) => updates(message as InstallExtensionReq)) as InstallExtensionReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InstallExtensionReq create() => InstallExtensionReq._();
  InstallExtensionReq createEmptyInstance() => create();
  static $pb.PbList<InstallExtensionReq> createRepeated() => $pb.PbList<InstallExtensionReq>();
  @$core.pragma('dart2js:noInline')
  static InstallExtensionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InstallExtensionReq>(create);
  static InstallExtensionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get zipName => $_getSZ(1);
  @$pb.TagNumber(2)
  set zipName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasZipName() => $_has(1);
  @$pb.TagNumber(2)
  void clearZipName() => clearField(2);

  @$pb.TagNumber(4)
  $core.String get repoUrl => $_getSZ(2);
  @$pb.TagNumber(4)
  set repoUrl($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasRepoUrl() => $_has(2);
  @$pb.TagNumber(4)
  void clearRepoUrl() => clearField(4);
}

class UninstallExtensionReq extends $pb.GeneratedMessage {
  factory UninstallExtensionReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  UninstallExtensionReq._() : super();
  factory UninstallExtensionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UninstallExtensionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UninstallExtensionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UninstallExtensionReq clone() => UninstallExtensionReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UninstallExtensionReq copyWith(void Function(UninstallExtensionReq) updates) => super.copyWith((message) => updates(message as UninstallExtensionReq)) as UninstallExtensionReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UninstallExtensionReq create() => UninstallExtensionReq._();
  UninstallExtensionReq createEmptyInstance() => create();
  static $pb.PbList<UninstallExtensionReq> createRepeated() => $pb.PbList<UninstallExtensionReq>();
  @$core.pragma('dart2js:noInline')
  static UninstallExtensionReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UninstallExtensionReq>(create);
  static UninstallExtensionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => clearField(1);
}

class GetInstallProgressReq extends $pb.GeneratedMessage {
  factory GetInstallProgressReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    return result;
  }
  GetInstallProgressReq._() : super();
  factory GetInstallProgressReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInstallProgressReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstallProgressReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInstallProgressReq clone() => GetInstallProgressReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInstallProgressReq copyWith(void Function(GetInstallProgressReq) updates) => super.copyWith((message) => updates(message as GetInstallProgressReq)) as GetInstallProgressReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstallProgressReq create() => GetInstallProgressReq._();
  GetInstallProgressReq createEmptyInstance() => create();
  static $pb.PbList<GetInstallProgressReq> createRepeated() => $pb.PbList<GetInstallProgressReq>();
  @$core.pragma('dart2js:noInline')
  static GetInstallProgressReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInstallProgressReq>(create);
  static GetInstallProgressReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => clearField(1);
}

class GetInstallProgressRes extends $pb.GeneratedMessage {
  factory GetInstallProgressRes({
    $core.Iterable<Site>? sites,
  }) {
    final result = create();
    if (sites != null) {
      result.sites.addAll(sites);
    }
    return result;
  }
  GetInstallProgressRes._() : super();
  factory GetInstallProgressRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInstallProgressRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstallProgressRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<Site>(1, _omitFieldNames ? '' : 'sites', $pb.PbFieldType.PM, subBuilder: Site.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetInstallProgressRes clone() => GetInstallProgressRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetInstallProgressRes copyWith(void Function(GetInstallProgressRes) updates) => super.copyWith((message) => updates(message as GetInstallProgressRes)) as GetInstallProgressRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstallProgressRes create() => GetInstallProgressRes._();
  GetInstallProgressRes createEmptyInstance() => create();
  static $pb.PbList<GetInstallProgressRes> createRepeated() => $pb.PbList<GetInstallProgressRes>();
  @$core.pragma('dart2js:noInline')
  static GetInstallProgressRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetInstallProgressRes>(create);
  static GetInstallProgressRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<Site> get sites => $_getList(0);
}

class ListRemoteExtensionsReq extends $pb.GeneratedMessage {
  factory ListRemoteExtensionsReq({
    $core.String? keyword,
  }) {
    final result = create();
    if (keyword != null) {
      result.keyword = keyword;
    }
    return result;
  }
  ListRemoteExtensionsReq._() : super();
  factory ListRemoteExtensionsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRemoteExtensionsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRemoteExtensionsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'keyword')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRemoteExtensionsReq clone() => ListRemoteExtensionsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRemoteExtensionsReq copyWith(void Function(ListRemoteExtensionsReq) updates) => super.copyWith((message) => updates(message as ListRemoteExtensionsReq)) as ListRemoteExtensionsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsReq create() => ListRemoteExtensionsReq._();
  ListRemoteExtensionsReq createEmptyInstance() => create();
  static $pb.PbList<ListRemoteExtensionsReq> createRepeated() => $pb.PbList<ListRemoteExtensionsReq>();
  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRemoteExtensionsReq>(create);
  static ListRemoteExtensionsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get keyword => $_getSZ(0);
  @$pb.TagNumber(1)
  set keyword($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasKeyword() => $_has(0);
  @$pb.TagNumber(1)
  void clearKeyword() => clearField(1);
}

class ListRemoteExtensionsRes extends $pb.GeneratedMessage {
  factory ListRemoteExtensionsRes({
    $core.Iterable<RemoteExtension>? extensions,
  }) {
    final result = create();
    if (extensions != null) {
      result.extensions.addAll(extensions);
    }
    return result;
  }
  ListRemoteExtensionsRes._() : super();
  factory ListRemoteExtensionsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListRemoteExtensionsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRemoteExtensionsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<RemoteExtension>(1, _omitFieldNames ? '' : 'extensions', $pb.PbFieldType.PM, subBuilder: RemoteExtension.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListRemoteExtensionsRes clone() => ListRemoteExtensionsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListRemoteExtensionsRes copyWith(void Function(ListRemoteExtensionsRes) updates) => super.copyWith((message) => updates(message as ListRemoteExtensionsRes)) as ListRemoteExtensionsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsRes create() => ListRemoteExtensionsRes._();
  ListRemoteExtensionsRes createEmptyInstance() => create();
  static $pb.PbList<ListRemoteExtensionsRes> createRepeated() => $pb.PbList<ListRemoteExtensionsRes>();
  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListRemoteExtensionsRes>(create);
  static ListRemoteExtensionsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<RemoteExtension> get extensions => $_getList(0);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoteExtension', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

class Extension extends $pb.GeneratedMessage {
  factory Extension({
    $core.String? pkgName,
    $core.String? displayName,
    $core.String? zipName,
    $core.int? version,
    $core.int? pythonVersion,
    $core.String? lang,
    $core.bool? isNsfw,
    $core.String? repoUrl,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    if (displayName != null) {
      result.displayName = displayName;
    }
    if (zipName != null) {
      result.zipName = zipName;
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
    if (repoUrl != null) {
      result.repoUrl = repoUrl;
    }
    return result;
  }
  Extension._() : super();
  factory Extension.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Extension.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Extension', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'pkgName')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..aOS(4, _omitFieldNames ? '' : 'zipName')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'pythonVersion', $pb.PbFieldType.O3)
    ..aOS(7, _omitFieldNames ? '' : 'lang')
    ..aOB(8, _omitFieldNames ? '' : 'isNsfw')
    ..aOS(9, _omitFieldNames ? '' : 'repoUrl')
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

  @$pb.TagNumber(4)
  $core.String get zipName => $_getSZ(2);
  @$pb.TagNumber(4)
  set zipName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasZipName() => $_has(2);
  @$pb.TagNumber(4)
  void clearZipName() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get version => $_getIZ(3);
  @$pb.TagNumber(5)
  set version($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(3);
  @$pb.TagNumber(5)
  void clearVersion() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get pythonVersion => $_getIZ(4);
  @$pb.TagNumber(6)
  set pythonVersion($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPythonVersion() => $_has(4);
  @$pb.TagNumber(6)
  void clearPythonVersion() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get lang => $_getSZ(5);
  @$pb.TagNumber(7)
  set lang($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasLang() => $_has(5);
  @$pb.TagNumber(7)
  void clearLang() => clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isNsfw => $_getBF(6);
  @$pb.TagNumber(8)
  set isNsfw($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasIsNsfw() => $_has(6);
  @$pb.TagNumber(8)
  void clearIsNsfw() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get repoUrl => $_getSZ(7);
  @$pb.TagNumber(9)
  set repoUrl($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasRepoUrl() => $_has(7);
  @$pb.TagNumber(9)
  void clearRepoUrl() => clearField(9);
}

/// Extension Repo messages
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ExtensionRepo', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

class AddExtensionRepoReq extends $pb.GeneratedMessage {
  factory AddExtensionRepoReq({
    $core.String? url,
    $core.String? displayName,
  }) {
    final result = create();
    if (url != null) {
      result.url = url;
    }
    if (displayName != null) {
      result.displayName = displayName;
    }
    return result;
  }
  AddExtensionRepoReq._() : super();
  factory AddExtensionRepoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddExtensionRepoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddExtensionRepoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aOS(2, _omitFieldNames ? '' : 'displayName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddExtensionRepoReq clone() => AddExtensionRepoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddExtensionRepoReq copyWith(void Function(AddExtensionRepoReq) updates) => super.copyWith((message) => updates(message as AddExtensionRepoReq)) as AddExtensionRepoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoReq create() => AddExtensionRepoReq._();
  AddExtensionRepoReq createEmptyInstance() => create();
  static $pb.PbList<AddExtensionRepoReq> createRepeated() => $pb.PbList<AddExtensionRepoReq>();
  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddExtensionRepoReq>(create);
  static AddExtensionRepoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get displayName => $_getSZ(1);
  @$pb.TagNumber(2)
  set displayName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasDisplayName() => $_has(1);
  @$pb.TagNumber(2)
  void clearDisplayName() => clearField(2);
}

class AddExtensionRepoRes extends $pb.GeneratedMessage {
  factory AddExtensionRepoRes({
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
  AddExtensionRepoRes._() : super();
  factory AddExtensionRepoRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddExtensionRepoRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddExtensionRepoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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
  AddExtensionRepoRes clone() => AddExtensionRepoRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddExtensionRepoRes copyWith(void Function(AddExtensionRepoRes) updates) => super.copyWith((message) => updates(message as AddExtensionRepoRes)) as AddExtensionRepoRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoRes create() => AddExtensionRepoRes._();
  AddExtensionRepoRes createEmptyInstance() => create();
  static $pb.PbList<AddExtensionRepoRes> createRepeated() => $pb.PbList<AddExtensionRepoRes>();
  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddExtensionRepoRes>(create);
  static AddExtensionRepoRes? _defaultInstance;

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

class RemoveExtensionRepoReq extends $pb.GeneratedMessage {
  factory RemoveExtensionRepoReq({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) {
      result.url = url;
    }
    return result;
  }
  RemoveExtensionRepoReq._() : super();
  factory RemoveExtensionRepoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveExtensionRepoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveExtensionRepoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveExtensionRepoReq clone() => RemoveExtensionRepoReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveExtensionRepoReq copyWith(void Function(RemoveExtensionRepoReq) updates) => super.copyWith((message) => updates(message as RemoveExtensionRepoReq)) as RemoveExtensionRepoReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveExtensionRepoReq create() => RemoveExtensionRepoReq._();
  RemoveExtensionRepoReq createEmptyInstance() => create();
  static $pb.PbList<RemoveExtensionRepoReq> createRepeated() => $pb.PbList<RemoveExtensionRepoReq>();
  @$core.pragma('dart2js:noInline')
  static RemoveExtensionRepoReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveExtensionRepoReq>(create);
  static RemoveExtensionRepoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => clearField(1);
}

class ListExtensionReposRes extends $pb.GeneratedMessage {
  factory ListExtensionReposRes({
    $core.Iterable<ExtensionRepo>? repos,
  }) {
    final result = create();
    if (repos != null) {
      result.repos.addAll(repos);
    }
    return result;
  }
  ListExtensionReposRes._() : super();
  factory ListExtensionReposRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListExtensionReposRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListExtensionReposRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<ExtensionRepo>(1, _omitFieldNames ? '' : 'repos', $pb.PbFieldType.PM, subBuilder: ExtensionRepo.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListExtensionReposRes clone() => ListExtensionReposRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListExtensionReposRes copyWith(void Function(ListExtensionReposRes) updates) => super.copyWith((message) => updates(message as ListExtensionReposRes)) as ListExtensionReposRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListExtensionReposRes create() => ListExtensionReposRes._();
  ListExtensionReposRes createEmptyInstance() => create();
  static $pb.PbList<ListExtensionReposRes> createRepeated() => $pb.PbList<ListExtensionReposRes>();
  @$core.pragma('dart2js:noInline')
  static ListExtensionReposRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListExtensionReposRes>(create);
  static ListExtensionReposRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<ExtensionRepo> get repos => $_getList(0);
}

/// Health Check messages
class HealthCheckReq extends $pb.GeneratedMessage {
  factory HealthCheckReq({
    $core.String? service,
  }) {
    final result = create();
    if (service != null) {
      result.service = service;
    }
    return result;
  }
  HealthCheckReq._() : super();
  factory HealthCheckReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HealthCheckReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HealthCheckReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'service')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HealthCheckReq clone() => HealthCheckReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HealthCheckReq copyWith(void Function(HealthCheckReq) updates) => super.copyWith((message) => updates(message as HealthCheckReq)) as HealthCheckReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HealthCheckReq create() => HealthCheckReq._();
  HealthCheckReq createEmptyInstance() => create();
  static $pb.PbList<HealthCheckReq> createRepeated() => $pb.PbList<HealthCheckReq>();
  @$core.pragma('dart2js:noInline')
  static HealthCheckReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HealthCheckReq>(create);
  static HealthCheckReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get service => $_getSZ(0);
  @$pb.TagNumber(1)
  set service($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasService() => $_has(0);
  @$pb.TagNumber(1)
  void clearService() => clearField(1);
}

class HealthCheckRes extends $pb.GeneratedMessage {
  factory HealthCheckRes({
    HealthCheckRes_ServingStatus? status,
    $core.String? message,
  }) {
    final result = create();
    if (status != null) {
      result.status = status;
    }
    if (message != null) {
      result.message = message;
    }
    return result;
  }
  HealthCheckRes._() : super();
  factory HealthCheckRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory HealthCheckRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HealthCheckRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..e<HealthCheckRes_ServingStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE, defaultOrMaker: HealthCheckRes_ServingStatus.UNKNOWN, valueOf: HealthCheckRes_ServingStatus.valueOf, enumValues: HealthCheckRes_ServingStatus.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  HealthCheckRes clone() => HealthCheckRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  HealthCheckRes copyWith(void Function(HealthCheckRes) updates) => super.copyWith((message) => updates(message as HealthCheckRes)) as HealthCheckRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HealthCheckRes create() => HealthCheckRes._();
  HealthCheckRes createEmptyInstance() => create();
  static $pb.PbList<HealthCheckRes> createRepeated() => $pb.PbList<HealthCheckRes>();
  @$core.pragma('dart2js:noInline')
  static HealthCheckRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<HealthCheckRes>(create);
  static HealthCheckRes? _defaultInstance;

  @$pb.TagNumber(1)
  HealthCheckRes_ServingStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(HealthCheckRes_ServingStatus v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => clearField(2);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LogEntry', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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

class WatchLogsReq extends $pb.GeneratedMessage {
  factory WatchLogsReq({
    LogLevel? minLevel,
    $core.String? loggerFilter,
  }) {
    final result = create();
    if (minLevel != null) {
      result.minLevel = minLevel;
    }
    if (loggerFilter != null) {
      result.loggerFilter = loggerFilter;
    }
    return result;
  }
  WatchLogsReq._() : super();
  factory WatchLogsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory WatchLogsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WatchLogsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..e<LogLevel>(1, _omitFieldNames ? '' : 'minLevel', $pb.PbFieldType.OE, defaultOrMaker: LogLevel.DEBUG, valueOf: LogLevel.valueOf, enumValues: LogLevel.values)
    ..aOS(2, _omitFieldNames ? '' : 'loggerFilter')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  WatchLogsReq clone() => WatchLogsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  WatchLogsReq copyWith(void Function(WatchLogsReq) updates) => super.copyWith((message) => updates(message as WatchLogsReq)) as WatchLogsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchLogsReq create() => WatchLogsReq._();
  WatchLogsReq createEmptyInstance() => create();
  static $pb.PbList<WatchLogsReq> createRepeated() => $pb.PbList<WatchLogsReq>();
  @$core.pragma('dart2js:noInline')
  static WatchLogsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<WatchLogsReq>(create);
  static WatchLogsReq? _defaultInstance;

  @$pb.TagNumber(1)
  LogLevel get minLevel => $_getN(0);
  @$pb.TagNumber(1)
  set minLevel(LogLevel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasMinLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinLevel() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get loggerFilter => $_getSZ(1);
  @$pb.TagNumber(2)
  set loggerFilter($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLoggerFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoggerFilter() => clearField(2);
}

class GetLogsReq extends $pb.GeneratedMessage {
  factory GetLogsReq({
    $fixnum.Int64? startTime,
    $fixnum.Int64? endTime,
    LogLevel? minLevel,
    $core.String? loggerFilter,
    $core.int? limit,
  }) {
    final result = create();
    if (startTime != null) {
      result.startTime = startTime;
    }
    if (endTime != null) {
      result.endTime = endTime;
    }
    if (minLevel != null) {
      result.minLevel = minLevel;
    }
    if (loggerFilter != null) {
      result.loggerFilter = loggerFilter;
    }
    if (limit != null) {
      result.limit = limit;
    }
    return result;
  }
  GetLogsReq._() : super();
  factory GetLogsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLogsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLogsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startTime')
    ..aInt64(2, _omitFieldNames ? '' : 'endTime')
    ..e<LogLevel>(3, _omitFieldNames ? '' : 'minLevel', $pb.PbFieldType.OE, defaultOrMaker: LogLevel.DEBUG, valueOf: LogLevel.valueOf, enumValues: LogLevel.values)
    ..aOS(4, _omitFieldNames ? '' : 'loggerFilter')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLogsReq clone() => GetLogsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLogsReq copyWith(void Function(GetLogsReq) updates) => super.copyWith((message) => updates(message as GetLogsReq)) as GetLogsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLogsReq create() => GetLogsReq._();
  GetLogsReq createEmptyInstance() => create();
  static $pb.PbList<GetLogsReq> createRepeated() => $pb.PbList<GetLogsReq>();
  @$core.pragma('dart2js:noInline')
  static GetLogsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLogsReq>(create);
  static GetLogsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startTime => $_getI64(0);
  @$pb.TagNumber(1)
  set startTime($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasStartTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartTime() => clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endTime => $_getI64(1);
  @$pb.TagNumber(2)
  set endTime($fixnum.Int64 v) { $_setInt64(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => clearField(2);

  @$pb.TagNumber(3)
  LogLevel get minLevel => $_getN(2);
  @$pb.TagNumber(3)
  set minLevel(LogLevel v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasMinLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinLevel() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get loggerFilter => $_getSZ(3);
  @$pb.TagNumber(4)
  set loggerFilter($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLoggerFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearLoggerFilter() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get limit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limit($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => clearField(5);
}

class GetLogsRes extends $pb.GeneratedMessage {
  factory GetLogsRes({
    $core.Iterable<LogEntry>? entries,
  }) {
    final result = create();
    if (entries != null) {
      result.entries.addAll(entries);
    }
    return result;
  }
  GetLogsRes._() : super();
  factory GetLogsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLogsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLogsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<LogEntry>(1, _omitFieldNames ? '' : 'entries', $pb.PbFieldType.PM, subBuilder: LogEntry.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLogsRes clone() => GetLogsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLogsRes copyWith(void Function(GetLogsRes) updates) => super.copyWith((message) => updates(message as GetLogsRes)) as GetLogsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLogsRes create() => GetLogsRes._();
  GetLogsRes createEmptyInstance() => create();
  static $pb.PbList<GetLogsRes> createRepeated() => $pb.PbList<GetLogsRes>();
  @$core.pragma('dart2js:noInline')
  static GetLogsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLogsRes>(create);
  static GetLogsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<LogEntry> get entries => $_getList(0);
}

class SetLogLevelReq extends $pb.GeneratedMessage {
  factory SetLogLevelReq({
    LogLevel? level,
  }) {
    final result = create();
    if (level != null) {
      result.level = level;
    }
    return result;
  }
  SetLogLevelReq._() : super();
  factory SetLogLevelReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetLogLevelReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetLogLevelReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..e<LogLevel>(1, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: LogLevel.DEBUG, valueOf: LogLevel.valueOf, enumValues: LogLevel.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetLogLevelReq clone() => SetLogLevelReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetLogLevelReq copyWith(void Function(SetLogLevelReq) updates) => super.copyWith((message) => updates(message as SetLogLevelReq)) as SetLogLevelReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetLogLevelReq create() => SetLogLevelReq._();
  SetLogLevelReq createEmptyInstance() => create();
  static $pb.PbList<SetLogLevelReq> createRepeated() => $pb.PbList<SetLogLevelReq>();
  @$core.pragma('dart2js:noInline')
  static SetLogLevelReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetLogLevelReq>(create);
  static SetLogLevelReq? _defaultInstance;

  @$pb.TagNumber(1)
  LogLevel get level => $_getN(0);
  @$pb.TagNumber(1)
  set level(LogLevel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
