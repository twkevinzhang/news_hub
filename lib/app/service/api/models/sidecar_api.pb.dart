// This is a generated file - do not edit.
//
// Generated from sidecar_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import 'sidecar_api.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

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
    if (page != null) result.page = page;
    if (limit != null) result.limit = limit;
    if (pageSize != null) result.pageSize = pageSize;
    if (prevCursor != null) result.prevCursor = prevCursor;
    if (nextCursor != null) result.nextCursor = nextCursor;
    return result;
  }

  PaginationReq._();

  factory PaginationReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PaginationReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PaginationReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'page')
    ..aI(2, _omitFieldNames ? '' : 'limit')
    ..aI(3, _omitFieldNames ? '' : 'pageSize')
    ..aOS(4, _omitFieldNames ? '' : 'prevCursor')
    ..aOS(5, _omitFieldNames ? '' : 'nextCursor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaginationReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaginationReq copyWith(void Function(PaginationReq) updates) =>
      super.copyWith((message) => updates(message as PaginationReq))
          as PaginationReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaginationReq create() => PaginationReq._();
  @$core.override
  PaginationReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PaginationReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaginationReq>(create);
  static PaginationReq? _defaultInstance;

  /// for offset-based pagination
  @$pb.TagNumber(1)
  $core.int get page => $_getIZ(0);
  @$pb.TagNumber(1)
  set page($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearPage() => $_clearField(1);

  /// for cursor-based pagination
  @$pb.TagNumber(2)
  $core.int get limit => $_getIZ(1);
  @$pb.TagNumber(2)
  set limit($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLimit() => $_has(1);
  @$pb.TagNumber(2)
  void clearLimit() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get prevCursor => $_getSZ(3);
  @$pb.TagNumber(4)
  set prevCursor($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrevCursor() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrevCursor() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nextCursor => $_getSZ(4);
  @$pb.TagNumber(5)
  set nextCursor($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNextCursor() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextCursor() => $_clearField(5);
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
    if (totalPage != null) result.totalPage = totalPage;
    if (currentPage != null) result.currentPage = currentPage;
    if (pageSize != null) result.pageSize = pageSize;
    if (prevCursor != null) result.prevCursor = prevCursor;
    if (nextCursor != null) result.nextCursor = nextCursor;
    return result;
  }

  PaginationRes._();

  factory PaginationRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PaginationRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PaginationRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'totalPage')
    ..aI(2, _omitFieldNames ? '' : 'currentPage')
    ..aI(3, _omitFieldNames ? '' : 'pageSize')
    ..aOS(4, _omitFieldNames ? '' : 'prevCursor')
    ..aOS(5, _omitFieldNames ? '' : 'nextCursor')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaginationRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaginationRes copyWith(void Function(PaginationRes) updates) =>
      super.copyWith((message) => updates(message as PaginationRes))
          as PaginationRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaginationRes create() => PaginationRes._();
  @$core.override
  PaginationRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static PaginationRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaginationRes>(create);
  static PaginationRes? _defaultInstance;

  /// for offset-based pagination
  @$pb.TagNumber(1)
  $core.int get totalPage => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalPage($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalPage() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalPage() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get currentPage => $_getIZ(1);
  @$pb.TagNumber(2)
  set currentPage($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCurrentPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearCurrentPage() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(3)
  set pageSize($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(3)
  void clearPageSize() => $_clearField(3);

  /// for cursor-based pagination
  @$pb.TagNumber(4)
  $core.String get prevCursor => $_getSZ(3);
  @$pb.TagNumber(4)
  set prevCursor($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPrevCursor() => $_has(3);
  @$pb.TagNumber(4)
  void clearPrevCursor() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get nextCursor => $_getSZ(4);
  @$pb.TagNumber(5)
  set nextCursor($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasNextCursor() => $_has(4);
  @$pb.TagNumber(5)
  void clearNextCursor() => $_clearField(5);
}

class Empty extends $pb.GeneratedMessage {
  factory Empty() => create();

  Empty._();

  factory Empty.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Empty.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Empty',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Empty copyWith(void Function(Empty) updates) =>
      super.copyWith((message) => updates(message as Empty)) as Empty;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  @$core.override
  Empty createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class GetSiteReq extends $pb.GeneratedMessage {
  factory GetSiteReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetSiteReq._();

  factory GetSiteReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSiteReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSiteReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteReq copyWith(void Function(GetSiteReq) updates) =>
      super.copyWith((message) => updates(message as GetSiteReq)) as GetSiteReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSiteReq create() => GetSiteReq._();
  @$core.override
  GetSiteReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSiteReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSiteReq>(create);
  static GetSiteReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => $_clearField(1);
}

class GetSiteRes extends $pb.GeneratedMessage {
  factory GetSiteRes({
    Site? site,
  }) {
    final result = create();
    if (site != null) result.site = site;
    return result;
  }

  GetSiteRes._();

  factory GetSiteRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSiteRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSiteRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOM<Site>(1, _omitFieldNames ? '' : 'site', subBuilder: Site.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSiteRes copyWith(void Function(GetSiteRes) updates) =>
      super.copyWith((message) => updates(message as GetSiteRes)) as GetSiteRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSiteRes create() => GetSiteRes._();
  @$core.override
  GetSiteRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetSiteRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSiteRes>(create);
  static GetSiteRes? _defaultInstance;

  @$pb.TagNumber(1)
  Site get site => $_getN(0);
  @$pb.TagNumber(1)
  set site(Site value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSite() => $_has(0);
  @$pb.TagNumber(1)
  void clearSite() => $_clearField(1);
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
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (url != null) result.url = url;
    if (id != null) result.id = id;
    if (icon != null) result.icon = icon;
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  Site._();

  factory Site.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Site.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Site',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'name')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..aOS(3, _omitFieldNames ? '' : 'url')
    ..aOS(4, _omitFieldNames ? '' : 'id')
    ..aOS(5, _omitFieldNames ? '' : 'icon')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Site clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Site copyWith(void Function(Site) updates) =>
      super.copyWith((message) => updates(message as Site)) as Site;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Site create() => Site._();
  @$core.override
  Site createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Site getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Site>(create);
  static Site? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get name => $_getSZ(0);
  @$pb.TagNumber(1)
  set name($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasName() => $_has(0);
  @$pb.TagNumber(1)
  void clearName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get url => $_getSZ(2);
  @$pb.TagNumber(3)
  set url($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearUrl() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get id => $_getSZ(3);
  @$pb.TagNumber(4)
  set id($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasId() => $_has(3);
  @$pb.TagNumber(4)
  void clearId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get icon => $_getSZ(4);
  @$pb.TagNumber(5)
  set icon($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasIcon() => $_has(4);
  @$pb.TagNumber(5)
  void clearIcon() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(5);
  @$pb.TagNumber(6)
  set pkgName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPkgName() => $_clearField(6);
}

class GetBoardsReq extends $pb.GeneratedMessage {
  factory GetBoardsReq({
    $core.String? siteId,
    PaginationReq? page,
    $core.String? pkgName,
  }) {
    final result = create();
    if (siteId != null) result.siteId = siteId;
    if (page != null) result.page = page;
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetBoardsReq._();

  factory GetBoardsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBoardsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBoardsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..aOM<PaginationReq>(2, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationReq.create)
    ..aOS(3, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBoardsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBoardsReq copyWith(void Function(GetBoardsReq) updates) =>
      super.copyWith((message) => updates(message as GetBoardsReq))
          as GetBoardsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBoardsReq create() => GetBoardsReq._();
  @$core.override
  GetBoardsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBoardsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBoardsReq>(create);
  static GetBoardsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => $_clearField(1);

  @$pb.TagNumber(2)
  PaginationReq get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationReq value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
  @$pb.TagNumber(2)
  PaginationReq ensurePage() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get pkgName => $_getSZ(2);
  @$pb.TagNumber(3)
  set pkgName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPkgName() => $_has(2);
  @$pb.TagNumber(3)
  void clearPkgName() => $_clearField(3);
}

class GetBoardsRes extends $pb.GeneratedMessage {
  factory GetBoardsRes({
    $core.Iterable<Board>? boards,
    PaginationRes? page,
  }) {
    final result = create();
    if (boards != null) result.boards.addAll(boards);
    if (page != null) result.page = page;
    return result;
  }

  GetBoardsRes._();

  factory GetBoardsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBoardsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBoardsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<Board>(1, _omitFieldNames ? '' : 'boards', subBuilder: Board.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationRes.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBoardsRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBoardsRes copyWith(void Function(GetBoardsRes) updates) =>
      super.copyWith((message) => updates(message as GetBoardsRes))
          as GetBoardsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBoardsRes create() => GetBoardsRes._();
  @$core.override
  GetBoardsRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetBoardsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBoardsRes>(create);
  static GetBoardsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Board> get boards => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
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
    if (id != null) result.id = id;
    if (siteId != null) result.siteId = siteId;
    if (name != null) result.name = name;
    if (icon != null) result.icon = icon;
    if (largeWelcomeImage != null) result.largeWelcomeImage = largeWelcomeImage;
    if (url != null) result.url = url;
    if (supportedThreadsSorting != null)
      result.supportedThreadsSorting.addAll(supportedThreadsSorting);
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  Board._();

  factory Board.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Board.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Board',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'siteId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'icon')
    ..aOS(5, _omitFieldNames ? '' : 'largeWelcomeImage')
    ..aOS(6, _omitFieldNames ? '' : 'url')
    ..pPS(7, _omitFieldNames ? '' : 'supportedThreadsSorting')
    ..aOS(8, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Board clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Board copyWith(void Function(Board) updates) =>
      super.copyWith((message) => updates(message as Board)) as Board;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Board create() => Board._();
  @$core.override
  Board createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Board getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Board>(create);
  static Board? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get siteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set siteId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSiteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSiteId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get icon => $_getSZ(3);
  @$pb.TagNumber(4)
  set icon($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIcon() => $_has(3);
  @$pb.TagNumber(4)
  void clearIcon() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get largeWelcomeImage => $_getSZ(4);
  @$pb.TagNumber(5)
  set largeWelcomeImage($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLargeWelcomeImage() => $_has(4);
  @$pb.TagNumber(5)
  void clearLargeWelcomeImage() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get url => $_getSZ(5);
  @$pb.TagNumber(6)
  set url($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasUrl() => $_has(5);
  @$pb.TagNumber(6)
  void clearUrl() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$core.String> get supportedThreadsSorting => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get pkgName => $_getSZ(7);
  @$pb.TagNumber(8)
  set pkgName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPkgName() => $_has(7);
  @$pb.TagNumber(8)
  void clearPkgName() => $_clearField(8);
}

class GetThreadInfosReq extends $pb.GeneratedMessage {
  factory GetThreadInfosReq({
    $core.String? siteId,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? boardsSorting,
    PaginationReq? page,
    $core.String? keywords,
    $core.String? pkgName,
  }) {
    final result = create();
    if (siteId != null) result.siteId = siteId;
    if (boardsSorting != null) result.boardsSorting.addEntries(boardsSorting);
    if (page != null) result.page = page;
    if (keywords != null) result.keywords = keywords;
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetThreadInfosReq._();

  factory GetThreadInfosReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetThreadInfosReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetThreadInfosReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..m<$core.String, $core.String>(2, _omitFieldNames ? '' : 'boardsSorting',
        entryClassName: 'GetThreadInfosReq.BoardsSortingEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('pb'))
    ..aOM<PaginationReq>(3, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationReq.create)
    ..aOS(5, _omitFieldNames ? '' : 'keywords')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadInfosReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadInfosReq copyWith(void Function(GetThreadInfosReq) updates) =>
      super.copyWith((message) => updates(message as GetThreadInfosReq))
          as GetThreadInfosReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadInfosReq create() => GetThreadInfosReq._();
  @$core.override
  GetThreadInfosReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetThreadInfosReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetThreadInfosReq>(create);
  static GetThreadInfosReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => $_clearField(1);

  @$pb.TagNumber(2)
  $pb.PbMap<$core.String, $core.String> get boardsSorting => $_getMap(1);

  @$pb.TagNumber(3)
  PaginationReq get page => $_getN(2);
  @$pb.TagNumber(3)
  set page(PaginationReq value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(3)
  void clearPage() => $_clearField(3);
  @$pb.TagNumber(3)
  PaginationReq ensurePage() => $_ensure(2);

  @$pb.TagNumber(5)
  $core.String get keywords => $_getSZ(3);
  @$pb.TagNumber(5)
  set keywords($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasKeywords() => $_has(3);
  @$pb.TagNumber(5)
  void clearKeywords() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(6)
  set pkgName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(6)
  void clearPkgName() => $_clearField(6);
}

class GetThreadInfosRes extends $pb.GeneratedMessage {
  factory GetThreadInfosRes({
    $core.Iterable<Post>? threadInfos,
    PaginationRes? page,
  }) {
    final result = create();
    if (threadInfos != null) result.threadInfos.addAll(threadInfos);
    if (page != null) result.page = page;
    return result;
  }

  GetThreadInfosRes._();

  factory GetThreadInfosRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetThreadInfosRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetThreadInfosRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<Post>(1, _omitFieldNames ? '' : 'threadInfos',
        subBuilder: Post.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationRes.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadInfosRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadInfosRes copyWith(void Function(GetThreadInfosRes) updates) =>
      super.copyWith((message) => updates(message as GetThreadInfosRes))
          as GetThreadInfosRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadInfosRes create() => GetThreadInfosRes._();
  @$core.override
  GetThreadInfosRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetThreadInfosRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetThreadInfosRes>(create);
  static GetThreadInfosRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Post> get threadInfos => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
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
    if (threadId != null) result.threadId = threadId;
    if (siteId != null) result.siteId = siteId;
    if (boardId != null) result.boardId = boardId;
    if (postId != null) result.postId = postId;
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetThreadPostReq._();

  factory GetThreadPostReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetThreadPostReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetThreadPostReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'threadId')
    ..aOS(2, _omitFieldNames ? '' : 'siteId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aOS(4, _omitFieldNames ? '' : 'postId')
    ..aOS(5, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadPostReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadPostReq copyWith(void Function(GetThreadPostReq) updates) =>
      super.copyWith((message) => updates(message as GetThreadPostReq))
          as GetThreadPostReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadPostReq create() => GetThreadPostReq._();
  @$core.override
  GetThreadPostReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetThreadPostReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetThreadPostReq>(create);
  static GetThreadPostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get threadId => $_getSZ(0);
  @$pb.TagNumber(1)
  set threadId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get siteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set siteId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSiteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSiteId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boardId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boardId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBoardId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoardId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get postId => $_getSZ(3);
  @$pb.TagNumber(4)
  set postId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPostId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPostId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(5)
  set pkgName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(5)
  void clearPkgName() => $_clearField(5);
}

class GetThreadPostRes extends $pb.GeneratedMessage {
  factory GetThreadPostRes({
    Post? threadPost,
  }) {
    final result = create();
    if (threadPost != null) result.threadPost = threadPost;
    return result;
  }

  GetThreadPostRes._();

  factory GetThreadPostRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetThreadPostRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetThreadPostRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOM<Post>(1, _omitFieldNames ? '' : 'threadPost', subBuilder: Post.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadPostRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetThreadPostRes copyWith(void Function(GetThreadPostRes) updates) =>
      super.copyWith((message) => updates(message as GetThreadPostRes))
          as GetThreadPostRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadPostRes create() => GetThreadPostRes._();
  @$core.override
  GetThreadPostRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetThreadPostRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetThreadPostRes>(create);
  static GetThreadPostRes? _defaultInstance;

  @$pb.TagNumber(1)
  Post get threadPost => $_getN(0);
  @$pb.TagNumber(1)
  set threadPost(Post value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasThreadPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadPost() => $_clearField(1);
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
    if (siteId != null) result.siteId = siteId;
    if (boardId != null) result.boardId = boardId;
    if (threadId != null) result.threadId = threadId;
    if (page != null) result.page = page;
    if (replyToId != null) result.replyToId = replyToId;
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetRegardingPostsReq._();

  factory GetRegardingPostsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRegardingPostsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRegardingPostsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..aOS(2, _omitFieldNames ? '' : 'boardId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOM<PaginationReq>(4, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationReq.create)
    ..aOS(5, _omitFieldNames ? '' : 'replyToId')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRegardingPostsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRegardingPostsReq copyWith(void Function(GetRegardingPostsReq) updates) =>
      super.copyWith((message) => updates(message as GetRegardingPostsReq))
          as GetRegardingPostsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsReq create() => GetRegardingPostsReq._();
  @$core.override
  GetRegardingPostsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRegardingPostsReq>(create);
  static GetRegardingPostsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get boardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boardId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(2);
  @$pb.TagNumber(3)
  set threadId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => $_clearField(3);

  @$pb.TagNumber(4)
  PaginationReq get page => $_getN(3);
  @$pb.TagNumber(4)
  set page(PaginationReq value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(4)
  void clearPage() => $_clearField(4);
  @$pb.TagNumber(4)
  PaginationReq ensurePage() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get replyToId => $_getSZ(4);
  @$pb.TagNumber(5)
  set replyToId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReplyToId() => $_has(4);
  @$pb.TagNumber(5)
  void clearReplyToId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(5);
  @$pb.TagNumber(6)
  set pkgName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPkgName() => $_clearField(6);
}

class GetRegardingPostsRes extends $pb.GeneratedMessage {
  factory GetRegardingPostsRes({
    $core.Iterable<Post>? regardingPosts,
    PaginationRes? page,
  }) {
    final result = create();
    if (regardingPosts != null) result.regardingPosts.addAll(regardingPosts);
    if (page != null) result.page = page;
    return result;
  }

  GetRegardingPostsRes._();

  factory GetRegardingPostsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetRegardingPostsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetRegardingPostsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<Post>(1, _omitFieldNames ? '' : 'regardingPosts',
        subBuilder: Post.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationRes.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRegardingPostsRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetRegardingPostsRes copyWith(void Function(GetRegardingPostsRes) updates) =>
      super.copyWith((message) => updates(message as GetRegardingPostsRes))
          as GetRegardingPostsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsRes create() => GetRegardingPostsRes._();
  @$core.override
  GetRegardingPostsRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetRegardingPostsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetRegardingPostsRes>(create);
  static GetRegardingPostsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Post> get regardingPosts => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
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
    if (type != null) result.type = type;
    if (image != null) result.image = image;
    if (video != null) result.video = video;
    if (text != null) result.text = text;
    if (quote != null) result.quote = quote;
    if (replyTo != null) result.replyTo = replyTo;
    if (link != null) result.link = link;
    if (newLine != null) result.newLine = newLine;
    return result;
  }

  Paragraph._();

  factory Paragraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Paragraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Paragraph_Content> _Paragraph_ContentByTag =
      {
    2: Paragraph_Content.image,
    3: Paragraph_Content.video,
    4: Paragraph_Content.text,
    5: Paragraph_Content.quote,
    6: Paragraph_Content.replyTo,
    7: Paragraph_Content.link,
    8: Paragraph_Content.newLine,
    0: Paragraph_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Paragraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [2, 3, 4, 5, 6, 7, 8])
    ..aE<ParagraphType>(1, _omitFieldNames ? '' : 'type',
        enumValues: ParagraphType.values)
    ..aOM<ImageParagraph>(2, _omitFieldNames ? '' : 'image',
        subBuilder: ImageParagraph.create)
    ..aOM<VideoParagraph>(3, _omitFieldNames ? '' : 'video',
        subBuilder: VideoParagraph.create)
    ..aOM<TextParagraph>(4, _omitFieldNames ? '' : 'text',
        subBuilder: TextParagraph.create)
    ..aOM<QuoteParagraph>(5, _omitFieldNames ? '' : 'quote',
        subBuilder: QuoteParagraph.create)
    ..aOM<ReplyToParagraph>(6, _omitFieldNames ? '' : 'replyTo',
        subBuilder: ReplyToParagraph.create)
    ..aOM<LinkParagraph>(7, _omitFieldNames ? '' : 'link',
        subBuilder: LinkParagraph.create)
    ..aOM<NewLineParagraph>(8, _omitFieldNames ? '' : 'newLine',
        subBuilder: NewLineParagraph.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Paragraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Paragraph copyWith(void Function(Paragraph) updates) =>
      super.copyWith((message) => updates(message as Paragraph)) as Paragraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Paragraph create() => Paragraph._();
  @$core.override
  Paragraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Paragraph getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Paragraph>(create);
  static Paragraph? _defaultInstance;

  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  Paragraph_Content whichContent() => _Paragraph_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(2)
  @$pb.TagNumber(3)
  @$pb.TagNumber(4)
  @$pb.TagNumber(5)
  @$pb.TagNumber(6)
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  ParagraphType get type => $_getN(0);
  @$pb.TagNumber(1)
  set type(ParagraphType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasType() => $_has(0);
  @$pb.TagNumber(1)
  void clearType() => $_clearField(1);

  @$pb.TagNumber(2)
  ImageParagraph get image => $_getN(1);
  @$pb.TagNumber(2)
  set image(ImageParagraph value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearImage() => $_clearField(2);
  @$pb.TagNumber(2)
  ImageParagraph ensureImage() => $_ensure(1);

  @$pb.TagNumber(3)
  VideoParagraph get video => $_getN(2);
  @$pb.TagNumber(3)
  set video(VideoParagraph value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasVideo() => $_has(2);
  @$pb.TagNumber(3)
  void clearVideo() => $_clearField(3);
  @$pb.TagNumber(3)
  VideoParagraph ensureVideo() => $_ensure(2);

  @$pb.TagNumber(4)
  TextParagraph get text => $_getN(3);
  @$pb.TagNumber(4)
  set text(TextParagraph value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasText() => $_has(3);
  @$pb.TagNumber(4)
  void clearText() => $_clearField(4);
  @$pb.TagNumber(4)
  TextParagraph ensureText() => $_ensure(3);

  @$pb.TagNumber(5)
  QuoteParagraph get quote => $_getN(4);
  @$pb.TagNumber(5)
  set quote(QuoteParagraph value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasQuote() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuote() => $_clearField(5);
  @$pb.TagNumber(5)
  QuoteParagraph ensureQuote() => $_ensure(4);

  @$pb.TagNumber(6)
  ReplyToParagraph get replyTo => $_getN(5);
  @$pb.TagNumber(6)
  set replyTo(ReplyToParagraph value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasReplyTo() => $_has(5);
  @$pb.TagNumber(6)
  void clearReplyTo() => $_clearField(6);
  @$pb.TagNumber(6)
  ReplyToParagraph ensureReplyTo() => $_ensure(5);

  @$pb.TagNumber(7)
  LinkParagraph get link => $_getN(6);
  @$pb.TagNumber(7)
  set link(LinkParagraph value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasLink() => $_has(6);
  @$pb.TagNumber(7)
  void clearLink() => $_clearField(7);
  @$pb.TagNumber(7)
  LinkParagraph ensureLink() => $_ensure(6);

  @$pb.TagNumber(8)
  NewLineParagraph get newLine => $_getN(7);
  @$pb.TagNumber(8)
  set newLine(NewLineParagraph value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasNewLine() => $_has(7);
  @$pb.TagNumber(8)
  void clearNewLine() => $_clearField(8);
  @$pb.TagNumber(8)
  NewLineParagraph ensureNewLine() => $_ensure(7);
}

class ImageParagraph extends $pb.GeneratedMessage {
  factory ImageParagraph({
    $core.String? thumb,
    $core.String? raw,
  }) {
    final result = create();
    if (thumb != null) result.thumb = thumb;
    if (raw != null) result.raw = raw;
    return result;
  }

  ImageParagraph._();

  factory ImageParagraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ImageParagraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ImageParagraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'thumb')
    ..aOS(2, _omitFieldNames ? '' : 'raw')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageParagraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ImageParagraph copyWith(void Function(ImageParagraph) updates) =>
      super.copyWith((message) => updates(message as ImageParagraph))
          as ImageParagraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ImageParagraph create() => ImageParagraph._();
  @$core.override
  ImageParagraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ImageParagraph getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ImageParagraph>(create);
  static ImageParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get thumb => $_getSZ(0);
  @$pb.TagNumber(1)
  set thumb($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThumb() => $_has(0);
  @$pb.TagNumber(1)
  void clearThumb() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get raw => $_getSZ(1);
  @$pb.TagNumber(2)
  set raw($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRaw() => $_has(1);
  @$pb.TagNumber(2)
  void clearRaw() => $_clearField(2);
}

class VideoParagraph extends $pb.GeneratedMessage {
  factory VideoParagraph({
    $core.String? thumb,
    $core.String? url,
  }) {
    final result = create();
    if (thumb != null) result.thumb = thumb;
    if (url != null) result.url = url;
    return result;
  }

  VideoParagraph._();

  factory VideoParagraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VideoParagraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VideoParagraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'thumb')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VideoParagraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VideoParagraph copyWith(void Function(VideoParagraph) updates) =>
      super.copyWith((message) => updates(message as VideoParagraph))
          as VideoParagraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VideoParagraph create() => VideoParagraph._();
  @$core.override
  VideoParagraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static VideoParagraph getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VideoParagraph>(create);
  static VideoParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get thumb => $_getSZ(0);
  @$pb.TagNumber(1)
  set thumb($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasThumb() => $_has(0);
  @$pb.TagNumber(1)
  void clearThumb() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);
}

class TextParagraph extends $pb.GeneratedMessage {
  factory TextParagraph({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  TextParagraph._();

  factory TextParagraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory TextParagraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'TextParagraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextParagraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  TextParagraph copyWith(void Function(TextParagraph) updates) =>
      super.copyWith((message) => updates(message as TextParagraph))
          as TextParagraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TextParagraph create() => TextParagraph._();
  @$core.override
  TextParagraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static TextParagraph getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<TextParagraph>(create);
  static TextParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

class NewLineParagraph extends $pb.GeneratedMessage {
  factory NewLineParagraph({
    $core.String? symbol,
  }) {
    final result = create();
    if (symbol != null) result.symbol = symbol;
    return result;
  }

  NewLineParagraph._();

  factory NewLineParagraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory NewLineParagraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'NewLineParagraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'symbol')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewLineParagraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  NewLineParagraph copyWith(void Function(NewLineParagraph) updates) =>
      super.copyWith((message) => updates(message as NewLineParagraph))
          as NewLineParagraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static NewLineParagraph create() => NewLineParagraph._();
  @$core.override
  NewLineParagraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static NewLineParagraph getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<NewLineParagraph>(create);
  static NewLineParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get symbol => $_getSZ(0);
  @$pb.TagNumber(1)
  set symbol($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSymbol() => $_has(0);
  @$pb.TagNumber(1)
  void clearSymbol() => $_clearField(1);
}

class QuoteParagraph extends $pb.GeneratedMessage {
  factory QuoteParagraph({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  QuoteParagraph._();

  factory QuoteParagraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory QuoteParagraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'QuoteParagraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuoteParagraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  QuoteParagraph copyWith(void Function(QuoteParagraph) updates) =>
      super.copyWith((message) => updates(message as QuoteParagraph))
          as QuoteParagraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static QuoteParagraph create() => QuoteParagraph._();
  @$core.override
  QuoteParagraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static QuoteParagraph getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<QuoteParagraph>(create);
  static QuoteParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

class ReplyToParagraph extends $pb.GeneratedMessage {
  factory ReplyToParagraph({
    $core.String? id,
    $core.String? preview,
    $core.String? authorName,
  }) {
    final result = create();
    if (id != null) result.id = id;
    if (preview != null) result.preview = preview;
    if (authorName != null) result.authorName = authorName;
    return result;
  }

  ReplyToParagraph._();

  factory ReplyToParagraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReplyToParagraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReplyToParagraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'preview')
    ..aOS(3, _omitFieldNames ? '' : 'authorName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReplyToParagraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReplyToParagraph copyWith(void Function(ReplyToParagraph) updates) =>
      super.copyWith((message) => updates(message as ReplyToParagraph))
          as ReplyToParagraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReplyToParagraph create() => ReplyToParagraph._();
  @$core.override
  ReplyToParagraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ReplyToParagraph getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReplyToParagraph>(create);
  static ReplyToParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get preview => $_getSZ(1);
  @$pb.TagNumber(2)
  set preview($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreview() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreview() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get authorName => $_getSZ(2);
  @$pb.TagNumber(3)
  set authorName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAuthorName() => $_has(2);
  @$pb.TagNumber(3)
  void clearAuthorName() => $_clearField(3);
}

class LinkParagraph extends $pb.GeneratedMessage {
  factory LinkParagraph({
    $core.String? content,
  }) {
    final result = create();
    if (content != null) result.content = content;
    return result;
  }

  LinkParagraph._();

  factory LinkParagraph.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LinkParagraph.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LinkParagraph',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'content')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LinkParagraph clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LinkParagraph copyWith(void Function(LinkParagraph) updates) =>
      super.copyWith((message) => updates(message as LinkParagraph))
          as LinkParagraph;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LinkParagraph create() => LinkParagraph._();
  @$core.override
  LinkParagraph createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LinkParagraph getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<LinkParagraph>(create);
  static LinkParagraph? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get content => $_getSZ(0);
  @$pb.TagNumber(1)
  set content($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasContent() => $_has(0);
  @$pb.TagNumber(1)
  void clearContent() => $_clearField(1);
}

enum Post_Content { articlePost, singleImagePost, notSet }

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
    if (id != null) result.id = id;
    if (threadId != null) result.threadId = threadId;
    if (boardId != null) result.boardId = boardId;
    if (siteId != null) result.siteId = siteId;
    if (pkgName != null) result.pkgName = pkgName;
    if (articlePost != null) result.articlePost = articlePost;
    if (singleImagePost != null) result.singleImagePost = singleImagePost;
    return result;
  }

  Post._();

  factory Post.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Post.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Post_Content> _Post_ContentByTag = {
    7: Post_Content.articlePost,
    8: Post_Content.singleImagePost,
    0: Post_Content.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Post',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..oo(0, [7, 8])
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'threadId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aOS(4, _omitFieldNames ? '' : 'siteId')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..aOM<ArticlePost>(7, _omitFieldNames ? '' : 'articlePost',
        subBuilder: ArticlePost.create)
    ..aOM<SingleImagePost>(8, _omitFieldNames ? '' : 'singleImagePost',
        subBuilder: SingleImagePost.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Post clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Post copyWith(void Function(Post) updates) =>
      super.copyWith((message) => updates(message as Post)) as Post;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Post create() => Post._();
  @$core.override
  Post createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Post getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Post>(create);
  static Post? _defaultInstance;

  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  Post_Content whichContent() => _Post_ContentByTag[$_whichOneof(0)]!;
  @$pb.TagNumber(7)
  @$pb.TagNumber(8)
  void clearContent() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get threadId => $_getSZ(1);
  @$pb.TagNumber(2)
  set threadId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThreadId() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreadId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get boardId => $_getSZ(2);
  @$pb.TagNumber(3)
  set boardId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBoardId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBoardId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get siteId => $_getSZ(3);
  @$pb.TagNumber(4)
  set siteId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSiteId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSiteId() => $_clearField(4);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(6)
  set pkgName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(6)
  void clearPkgName() => $_clearField(6);

  @$pb.TagNumber(7)
  ArticlePost get articlePost => $_getN(5);
  @$pb.TagNumber(7)
  set articlePost(ArticlePost value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasArticlePost() => $_has(5);
  @$pb.TagNumber(7)
  void clearArticlePost() => $_clearField(7);
  @$pb.TagNumber(7)
  ArticlePost ensureArticlePost() => $_ensure(5);

  @$pb.TagNumber(8)
  SingleImagePost get singleImagePost => $_getN(6);
  @$pb.TagNumber(8)
  set singleImagePost(SingleImagePost value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasSingleImagePost() => $_has(6);
  @$pb.TagNumber(8)
  void clearSingleImagePost() => $_clearField(8);
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
    if (authorName != null) result.authorName = authorName;
    if (createdAt != null) result.createdAt = createdAt;
    if (title != null) result.title = title;
    if (authorId != null) result.authorId = authorId;
    if (liked != null) result.liked = liked;
    if (disliked != null) result.disliked = disliked;
    if (latestRegardingPostCreatedAt != null)
      result.latestRegardingPostCreatedAt = latestRegardingPostCreatedAt;
    if (contents != null) result.contents.addAll(contents);
    if (tags != null) result.tags.addAll(tags);
    if (regardingPostsCount != null)
      result.regardingPostsCount = regardingPostsCount;
    if (url != null) result.url = url;
    return result;
  }

  ArticlePost._();

  factory ArticlePost.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ArticlePost.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ArticlePost',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'authorName')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'title')
    ..aOS(11, _omitFieldNames ? '' : 'authorId')
    ..aI(12, _omitFieldNames ? '' : 'liked')
    ..aI(13, _omitFieldNames ? '' : 'disliked')
    ..aInt64(15, _omitFieldNames ? '' : 'latestRegardingPostCreatedAt')
    ..pPM<Paragraph>(17, _omitFieldNames ? '' : 'contents',
        subBuilder: Paragraph.create)
    ..pPS(18, _omitFieldNames ? '' : 'tags')
    ..aI(19, _omitFieldNames ? '' : 'regardingPostsCount')
    ..aOS(20, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticlePost clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ArticlePost copyWith(void Function(ArticlePost) updates) =>
      super.copyWith((message) => updates(message as ArticlePost))
          as ArticlePost;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ArticlePost create() => ArticlePost._();
  @$core.override
  ArticlePost createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ArticlePost getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ArticlePost>(create);
  static ArticlePost? _defaultInstance;

  @$pb.TagNumber(5)
  $core.String get authorName => $_getSZ(0);
  @$pb.TagNumber(5)
  set authorName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(5)
  $core.bool hasAuthorName() => $_has(0);
  @$pb.TagNumber(5)
  void clearAuthorName() => $_clearField(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);

  @$pb.TagNumber(9)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(9)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(9)
  void clearTitle() => $_clearField(9);

  @$pb.TagNumber(11)
  $core.String get authorId => $_getSZ(3);
  @$pb.TagNumber(11)
  set authorId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(11)
  $core.bool hasAuthorId() => $_has(3);
  @$pb.TagNumber(11)
  void clearAuthorId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get liked => $_getIZ(4);
  @$pb.TagNumber(12)
  set liked($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(12)
  $core.bool hasLiked() => $_has(4);
  @$pb.TagNumber(12)
  void clearLiked() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get disliked => $_getIZ(5);
  @$pb.TagNumber(13)
  set disliked($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(13)
  $core.bool hasDisliked() => $_has(5);
  @$pb.TagNumber(13)
  void clearDisliked() => $_clearField(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get latestRegardingPostCreatedAt => $_getI64(6);
  @$pb.TagNumber(15)
  set latestRegardingPostCreatedAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(15)
  $core.bool hasLatestRegardingPostCreatedAt() => $_has(6);
  @$pb.TagNumber(15)
  void clearLatestRegardingPostCreatedAt() => $_clearField(15);

  @$pb.TagNumber(17)
  $pb.PbList<Paragraph> get contents => $_getList(7);

  @$pb.TagNumber(18)
  $pb.PbList<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(19)
  $core.int get regardingPostsCount => $_getIZ(9);
  @$pb.TagNumber(19)
  set regardingPostsCount($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(19)
  $core.bool hasRegardingPostsCount() => $_has(9);
  @$pb.TagNumber(19)
  void clearRegardingPostsCount() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get url => $_getSZ(10);
  @$pb.TagNumber(20)
  set url($core.String value) => $_setString(10, value);
  @$pb.TagNumber(20)
  $core.bool hasUrl() => $_has(10);
  @$pb.TagNumber(20)
  void clearUrl() => $_clearField(20);
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
    if (authorName != null) result.authorName = authorName;
    if (createdAt != null) result.createdAt = createdAt;
    if (title != null) result.title = title;
    if (authorId != null) result.authorId = authorId;
    if (liked != null) result.liked = liked;
    if (disliked != null) result.disliked = disliked;
    if (latestRegardingPostCreatedAt != null)
      result.latestRegardingPostCreatedAt = latestRegardingPostCreatedAt;
    if (contents != null) result.contents.addAll(contents);
    if (tags != null) result.tags.addAll(tags);
    if (regardingPostsCount != null)
      result.regardingPostsCount = regardingPostsCount;
    if (url != null) result.url = url;
    if (image != null) result.image = image;
    return result;
  }

  SingleImagePost._();

  factory SingleImagePost.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SingleImagePost.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SingleImagePost',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(5, _omitFieldNames ? '' : 'authorName')
    ..aInt64(7, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'title')
    ..aOS(11, _omitFieldNames ? '' : 'authorId')
    ..aI(12, _omitFieldNames ? '' : 'liked')
    ..aI(13, _omitFieldNames ? '' : 'disliked')
    ..aInt64(15, _omitFieldNames ? '' : 'latestRegardingPostCreatedAt')
    ..pPM<Paragraph>(17, _omitFieldNames ? '' : 'contents',
        subBuilder: Paragraph.create)
    ..pPS(18, _omitFieldNames ? '' : 'tags')
    ..aI(19, _omitFieldNames ? '' : 'regardingPostsCount')
    ..aOS(20, _omitFieldNames ? '' : 'url')
    ..aOM<ImageParagraph>(21, _omitFieldNames ? '' : 'image',
        subBuilder: ImageParagraph.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SingleImagePost clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SingleImagePost copyWith(void Function(SingleImagePost) updates) =>
      super.copyWith((message) => updates(message as SingleImagePost))
          as SingleImagePost;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SingleImagePost create() => SingleImagePost._();
  @$core.override
  SingleImagePost createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SingleImagePost getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SingleImagePost>(create);
  static SingleImagePost? _defaultInstance;

  @$pb.TagNumber(5)
  $core.String get authorName => $_getSZ(0);
  @$pb.TagNumber(5)
  set authorName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(5)
  $core.bool hasAuthorName() => $_has(0);
  @$pb.TagNumber(5)
  void clearAuthorName() => $_clearField(5);

  @$pb.TagNumber(7)
  $fixnum.Int64 get createdAt => $_getI64(1);
  @$pb.TagNumber(7)
  set createdAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);

  @$pb.TagNumber(9)
  $core.String get title => $_getSZ(2);
  @$pb.TagNumber(9)
  set title($core.String value) => $_setString(2, value);
  @$pb.TagNumber(9)
  $core.bool hasTitle() => $_has(2);
  @$pb.TagNumber(9)
  void clearTitle() => $_clearField(9);

  @$pb.TagNumber(11)
  $core.String get authorId => $_getSZ(3);
  @$pb.TagNumber(11)
  set authorId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(11)
  $core.bool hasAuthorId() => $_has(3);
  @$pb.TagNumber(11)
  void clearAuthorId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.int get liked => $_getIZ(4);
  @$pb.TagNumber(12)
  set liked($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(12)
  $core.bool hasLiked() => $_has(4);
  @$pb.TagNumber(12)
  void clearLiked() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.int get disliked => $_getIZ(5);
  @$pb.TagNumber(13)
  set disliked($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(13)
  $core.bool hasDisliked() => $_has(5);
  @$pb.TagNumber(13)
  void clearDisliked() => $_clearField(13);

  @$pb.TagNumber(15)
  $fixnum.Int64 get latestRegardingPostCreatedAt => $_getI64(6);
  @$pb.TagNumber(15)
  set latestRegardingPostCreatedAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(15)
  $core.bool hasLatestRegardingPostCreatedAt() => $_has(6);
  @$pb.TagNumber(15)
  void clearLatestRegardingPostCreatedAt() => $_clearField(15);

  @$pb.TagNumber(17)
  $pb.PbList<Paragraph> get contents => $_getList(7);

  @$pb.TagNumber(18)
  $pb.PbList<$core.String> get tags => $_getList(8);

  @$pb.TagNumber(19)
  $core.int get regardingPostsCount => $_getIZ(9);
  @$pb.TagNumber(19)
  set regardingPostsCount($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(19)
  $core.bool hasRegardingPostsCount() => $_has(9);
  @$pb.TagNumber(19)
  void clearRegardingPostsCount() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get url => $_getSZ(10);
  @$pb.TagNumber(20)
  set url($core.String value) => $_setString(10, value);
  @$pb.TagNumber(20)
  $core.bool hasUrl() => $_has(10);
  @$pb.TagNumber(20)
  void clearUrl() => $_clearField(20);

  @$pb.TagNumber(21)
  ImageParagraph get image => $_getN(11);
  @$pb.TagNumber(21)
  set image(ImageParagraph value) => $_setField(21, value);
  @$pb.TagNumber(21)
  $core.bool hasImage() => $_has(11);
  @$pb.TagNumber(21)
  void clearImage() => $_clearField(21);
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
    if (siteId != null) result.siteId = siteId;
    if (boardId != null) result.boardId = boardId;
    if (threadId != null) result.threadId = threadId;
    if (postId != null) result.postId = postId;
    if (page != null) result.page = page;
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetCommentsReq._();

  factory GetCommentsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCommentsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCommentsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'siteId')
    ..aOS(2, _omitFieldNames ? '' : 'boardId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOS(4, _omitFieldNames ? '' : 'postId')
    ..aOM<PaginationReq>(5, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationReq.create)
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCommentsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCommentsReq copyWith(void Function(GetCommentsReq) updates) =>
      super.copyWith((message) => updates(message as GetCommentsReq))
          as GetCommentsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommentsReq create() => GetCommentsReq._();
  @$core.override
  GetCommentsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCommentsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCommentsReq>(create);
  static GetCommentsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get siteId => $_getSZ(0);
  @$pb.TagNumber(1)
  set siteId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSiteId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSiteId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get boardId => $_getSZ(1);
  @$pb.TagNumber(2)
  set boardId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBoardId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBoardId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(2);
  @$pb.TagNumber(3)
  set threadId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get postId => $_getSZ(3);
  @$pb.TagNumber(4)
  set postId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPostId() => $_has(3);
  @$pb.TagNumber(4)
  void clearPostId() => $_clearField(4);

  @$pb.TagNumber(5)
  PaginationReq get page => $_getN(4);
  @$pb.TagNumber(5)
  set page(PaginationReq value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPage() => $_has(4);
  @$pb.TagNumber(5)
  void clearPage() => $_clearField(5);
  @$pb.TagNumber(5)
  PaginationReq ensurePage() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(5);
  @$pb.TagNumber(6)
  set pkgName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPkgName() => $_clearField(6);
}

class GetCommentsRes extends $pb.GeneratedMessage {
  factory GetCommentsRes({
    $core.Iterable<Comment>? comments,
    PaginationRes? page,
  }) {
    final result = create();
    if (comments != null) result.comments.addAll(comments);
    if (page != null) result.page = page;
    return result;
  }

  GetCommentsRes._();

  factory GetCommentsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCommentsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCommentsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<Comment>(1, _omitFieldNames ? '' : 'comments',
        subBuilder: Comment.create)
    ..aOM<PaginationRes>(2, _omitFieldNames ? '' : 'page',
        subBuilder: PaginationRes.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCommentsRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCommentsRes copyWith(void Function(GetCommentsRes) updates) =>
      super.copyWith((message) => updates(message as GetCommentsRes))
          as GetCommentsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCommentsRes create() => GetCommentsRes._();
  @$core.override
  GetCommentsRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetCommentsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCommentsRes>(create);
  static GetCommentsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Comment> get comments => $_getList(0);

  @$pb.TagNumber(2)
  PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page(PaginationRes value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => $_clearField(2);
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
    if (id != null) result.id = id;
    if (postId != null) result.postId = postId;
    if (threadId != null) result.threadId = threadId;
    if (boardId != null) result.boardId = boardId;
    if (siteId != null) result.siteId = siteId;
    if (authorId != null) result.authorId = authorId;
    if (createdAt != null) result.createdAt = createdAt;
    if (authorName != null) result.authorName = authorName;
    if (contents != null) result.contents.addAll(contents);
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  Comment._();

  factory Comment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Comment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Comment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'id')
    ..aOS(2, _omitFieldNames ? '' : 'postId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOS(4, _omitFieldNames ? '' : 'boardId')
    ..aOS(5, _omitFieldNames ? '' : 'siteId')
    ..aOS(6, _omitFieldNames ? '' : 'authorId')
    ..aInt64(8, _omitFieldNames ? '' : 'createdAt')
    ..aOS(10, _omitFieldNames ? '' : 'authorName')
    ..pPM<Paragraph>(11, _omitFieldNames ? '' : 'contents',
        subBuilder: Paragraph.create)
    ..aOS(12, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Comment clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Comment copyWith(void Function(Comment) updates) =>
      super.copyWith((message) => updates(message as Comment)) as Comment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Comment create() => Comment._();
  @$core.override
  Comment createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Comment getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Comment>(create);
  static Comment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get postId => $_getSZ(1);
  @$pb.TagNumber(2)
  set postId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPostId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPostId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(2);
  @$pb.TagNumber(3)
  set threadId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(2);
  @$pb.TagNumber(3)
  void clearThreadId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get boardId => $_getSZ(3);
  @$pb.TagNumber(4)
  set boardId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBoardId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBoardId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get siteId => $_getSZ(4);
  @$pb.TagNumber(5)
  set siteId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSiteId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSiteId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get authorId => $_getSZ(5);
  @$pb.TagNumber(6)
  set authorId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAuthorId() => $_has(5);
  @$pb.TagNumber(6)
  void clearAuthorId() => $_clearField(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get createdAt => $_getI64(6);
  @$pb.TagNumber(8)
  set createdAt($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(8)
  void clearCreatedAt() => $_clearField(8);

  @$pb.TagNumber(10)
  $core.String get authorName => $_getSZ(7);
  @$pb.TagNumber(10)
  set authorName($core.String value) => $_setString(7, value);
  @$pb.TagNumber(10)
  $core.bool hasAuthorName() => $_has(7);
  @$pb.TagNumber(10)
  void clearAuthorName() => $_clearField(10);

  @$pb.TagNumber(11)
  $pb.PbList<Paragraph> get contents => $_getList(8);

  @$pb.TagNumber(12)
  $core.String get pkgName => $_getSZ(9);
  @$pb.TagNumber(12)
  set pkgName($core.String value) => $_setString(9, value);
  @$pb.TagNumber(12)
  $core.bool hasPkgName() => $_has(9);
  @$pb.TagNumber(12)
  void clearPkgName() => $_clearField(12);
}

class ListInstalledExtensionsRes extends $pb.GeneratedMessage {
  factory ListInstalledExtensionsRes({
    $core.Iterable<Extension>? extensions,
  }) {
    final result = create();
    if (extensions != null) result.extensions.addAll(extensions);
    return result;
  }

  ListInstalledExtensionsRes._();

  factory ListInstalledExtensionsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListInstalledExtensionsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListInstalledExtensionsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<Extension>(1, _omitFieldNames ? '' : 'extensions',
        subBuilder: Extension.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInstalledExtensionsRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListInstalledExtensionsRes copyWith(
          void Function(ListInstalledExtensionsRes) updates) =>
      super.copyWith(
              (message) => updates(message as ListInstalledExtensionsRes))
          as ListInstalledExtensionsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListInstalledExtensionsRes create() => ListInstalledExtensionsRes._();
  @$core.override
  ListInstalledExtensionsRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListInstalledExtensionsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListInstalledExtensionsRes>(create);
  static ListInstalledExtensionsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Extension> get extensions => $_getList(0);
}

class GetInstalledExtensionReq extends $pb.GeneratedMessage {
  factory GetInstalledExtensionReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetInstalledExtensionReq._();

  factory GetInstalledExtensionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInstalledExtensionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInstalledExtensionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstalledExtensionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstalledExtensionReq copyWith(
          void Function(GetInstalledExtensionReq) updates) =>
      super.copyWith((message) => updates(message as GetInstalledExtensionReq))
          as GetInstalledExtensionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionReq create() => GetInstalledExtensionReq._();
  @$core.override
  GetInstalledExtensionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInstalledExtensionReq>(create);
  static GetInstalledExtensionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => $_clearField(1);
}

class GetInstalledExtensionRes extends $pb.GeneratedMessage {
  factory GetInstalledExtensionRes({
    Extension? extension_1,
  }) {
    final result = create();
    if (extension_1 != null) result.extension_1 = extension_1;
    return result;
  }

  GetInstalledExtensionRes._();

  factory GetInstalledExtensionRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInstalledExtensionRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInstalledExtensionRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOM<Extension>(1, _omitFieldNames ? '' : 'extension',
        subBuilder: Extension.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstalledExtensionRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstalledExtensionRes copyWith(
          void Function(GetInstalledExtensionRes) updates) =>
      super.copyWith((message) => updates(message as GetInstalledExtensionRes))
          as GetInstalledExtensionRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionRes create() => GetInstalledExtensionRes._();
  @$core.override
  GetInstalledExtensionRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInstalledExtensionRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInstalledExtensionRes>(create);
  static GetInstalledExtensionRes? _defaultInstance;

  @$pb.TagNumber(1)
  Extension get extension_1 => $_getN(0);
  @$pb.TagNumber(1)
  set extension_1(Extension value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasExtension_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearExtension_1() => $_clearField(1);
  @$pb.TagNumber(1)
  Extension ensureExtension_1() => $_ensure(0);
}

class InstallExtensionReq extends $pb.GeneratedMessage {
  factory InstallExtensionReq({
    $core.String? pkgName,
    $core.String? zipName,
    $core.String? repoBaseUrl,
  }) {
    final result = create();
    if (pkgName != null) result.pkgName = pkgName;
    if (zipName != null) result.zipName = zipName;
    if (repoBaseUrl != null) result.repoBaseUrl = repoBaseUrl;
    return result;
  }

  InstallExtensionReq._();

  factory InstallExtensionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InstallExtensionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InstallExtensionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..aOS(2, _omitFieldNames ? '' : 'zipName')
    ..aOS(3, _omitFieldNames ? '' : 'repoBaseUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstallExtensionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InstallExtensionReq copyWith(void Function(InstallExtensionReq) updates) =>
      super.copyWith((message) => updates(message as InstallExtensionReq))
          as InstallExtensionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InstallExtensionReq create() => InstallExtensionReq._();
  @$core.override
  InstallExtensionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static InstallExtensionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InstallExtensionReq>(create);
  static InstallExtensionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get zipName => $_getSZ(1);
  @$pb.TagNumber(2)
  set zipName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasZipName() => $_has(1);
  @$pb.TagNumber(2)
  void clearZipName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get repoBaseUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set repoBaseUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRepoBaseUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearRepoBaseUrl() => $_clearField(3);
}

class UninstallExtensionReq extends $pb.GeneratedMessage {
  factory UninstallExtensionReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  UninstallExtensionReq._();

  factory UninstallExtensionReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UninstallExtensionReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UninstallExtensionReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UninstallExtensionReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UninstallExtensionReq copyWith(
          void Function(UninstallExtensionReq) updates) =>
      super.copyWith((message) => updates(message as UninstallExtensionReq))
          as UninstallExtensionReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UninstallExtensionReq create() => UninstallExtensionReq._();
  @$core.override
  UninstallExtensionReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static UninstallExtensionReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UninstallExtensionReq>(create);
  static UninstallExtensionReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => $_clearField(1);
}

class GetInstallProgressReq extends $pb.GeneratedMessage {
  factory GetInstallProgressReq({
    $core.String? pkgName,
  }) {
    final result = create();
    if (pkgName != null) result.pkgName = pkgName;
    return result;
  }

  GetInstallProgressReq._();

  factory GetInstallProgressReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInstallProgressReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInstallProgressReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstallProgressReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstallProgressReq copyWith(
          void Function(GetInstallProgressReq) updates) =>
      super.copyWith((message) => updates(message as GetInstallProgressReq))
          as GetInstallProgressReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstallProgressReq create() => GetInstallProgressReq._();
  @$core.override
  GetInstallProgressReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInstallProgressReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInstallProgressReq>(create);
  static GetInstallProgressReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => $_clearField(1);
}

class GetInstallProgressRes extends $pb.GeneratedMessage {
  factory GetInstallProgressRes({
    $core.Iterable<Site>? sites,
  }) {
    final result = create();
    if (sites != null) result.sites.addAll(sites);
    return result;
  }

  GetInstallProgressRes._();

  factory GetInstallProgressRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInstallProgressRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInstallProgressRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<Site>(1, _omitFieldNames ? '' : 'sites', subBuilder: Site.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstallProgressRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInstallProgressRes copyWith(
          void Function(GetInstallProgressRes) updates) =>
      super.copyWith((message) => updates(message as GetInstallProgressRes))
          as GetInstallProgressRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInstallProgressRes create() => GetInstallProgressRes._();
  @$core.override
  GetInstallProgressRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetInstallProgressRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetInstallProgressRes>(create);
  static GetInstallProgressRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Site> get sites => $_getList(0);
}

class ListRemoteExtensionsReq extends $pb.GeneratedMessage {
  factory ListRemoteExtensionsReq({
    $core.String? repoBaseUrl,
  }) {
    final result = create();
    if (repoBaseUrl != null) result.repoBaseUrl = repoBaseUrl;
    return result;
  }

  ListRemoteExtensionsReq._();

  factory ListRemoteExtensionsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListRemoteExtensionsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListRemoteExtensionsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'repoBaseUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRemoteExtensionsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRemoteExtensionsReq copyWith(
          void Function(ListRemoteExtensionsReq) updates) =>
      super.copyWith((message) => updates(message as ListRemoteExtensionsReq))
          as ListRemoteExtensionsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsReq create() => ListRemoteExtensionsReq._();
  @$core.override
  ListRemoteExtensionsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListRemoteExtensionsReq>(create);
  static ListRemoteExtensionsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get repoBaseUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set repoBaseUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRepoBaseUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepoBaseUrl() => $_clearField(1);
}

class ListRemoteExtensionsRes extends $pb.GeneratedMessage {
  factory ListRemoteExtensionsRes({
    $core.Iterable<RemoteExtension>? extensions,
  }) {
    final result = create();
    if (extensions != null) result.extensions.addAll(extensions);
    return result;
  }

  ListRemoteExtensionsRes._();

  factory ListRemoteExtensionsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListRemoteExtensionsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListRemoteExtensionsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<RemoteExtension>(1, _omitFieldNames ? '' : 'extensions',
        subBuilder: RemoteExtension.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRemoteExtensionsRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListRemoteExtensionsRes copyWith(
          void Function(ListRemoteExtensionsRes) updates) =>
      super.copyWith((message) => updates(message as ListRemoteExtensionsRes))
          as ListRemoteExtensionsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsRes create() => ListRemoteExtensionsRes._();
  @$core.override
  ListRemoteExtensionsRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListRemoteExtensionsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListRemoteExtensionsRes>(create);
  static ListRemoteExtensionsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<RemoteExtension> get extensions => $_getList(0);
}

class RemoteExtension extends $pb.GeneratedMessage {
  factory RemoteExtension({
    Extension? base,
    $core.String? iconUrl,
    $core.String? repoUrl,
  }) {
    final result = create();
    if (base != null) result.base = base;
    if (iconUrl != null) result.iconUrl = iconUrl;
    if (repoUrl != null) result.repoUrl = repoUrl;
    return result;
  }

  RemoteExtension._();

  factory RemoteExtension.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoteExtension.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoteExtension',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOM<Extension>(1, _omitFieldNames ? '' : 'base',
        subBuilder: Extension.create)
    ..aOS(2, _omitFieldNames ? '' : 'iconUrl')
    ..aOS(3, _omitFieldNames ? '' : 'repoUrl')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteExtension clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoteExtension copyWith(void Function(RemoteExtension) updates) =>
      super.copyWith((message) => updates(message as RemoteExtension))
          as RemoteExtension;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoteExtension create() => RemoteExtension._();
  @$core.override
  RemoteExtension createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoteExtension getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoteExtension>(create);
  static RemoteExtension? _defaultInstance;

  @$pb.TagNumber(1)
  Extension get base => $_getN(0);
  @$pb.TagNumber(1)
  set base(Extension value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBase() => $_has(0);
  @$pb.TagNumber(1)
  void clearBase() => $_clearField(1);
  @$pb.TagNumber(1)
  Extension ensureBase() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get iconUrl => $_getSZ(1);
  @$pb.TagNumber(2)
  set iconUrl($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasIconUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearIconUrl() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get repoUrl => $_getSZ(2);
  @$pb.TagNumber(3)
  set repoUrl($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRepoUrl() => $_has(2);
  @$pb.TagNumber(3)
  void clearRepoUrl() => $_clearField(3);
}

class Extension extends $pb.GeneratedMessage {
  factory Extension({
    $core.String? repoBaseUrl,
    $core.String? pkgName,
    $core.String? displayName,
    $core.String? zipName,
    $core.int? version,
    $core.int? pythonVersion,
    $core.String? lang,
    $core.bool? isNsfw,
  }) {
    final result = create();
    if (repoBaseUrl != null) result.repoBaseUrl = repoBaseUrl;
    if (pkgName != null) result.pkgName = pkgName;
    if (displayName != null) result.displayName = displayName;
    if (zipName != null) result.zipName = zipName;
    if (version != null) result.version = version;
    if (pythonVersion != null) result.pythonVersion = pythonVersion;
    if (lang != null) result.lang = lang;
    if (isNsfw != null) result.isNsfw = isNsfw;
    return result;
  }

  Extension._();

  factory Extension.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Extension.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Extension',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'repoBaseUrl')
    ..aOS(2, _omitFieldNames ? '' : 'pkgName')
    ..aOS(3, _omitFieldNames ? '' : 'displayName')
    ..aOS(4, _omitFieldNames ? '' : 'zipName')
    ..aI(5, _omitFieldNames ? '' : 'version')
    ..aI(6, _omitFieldNames ? '' : 'pythonVersion')
    ..aOS(7, _omitFieldNames ? '' : 'lang')
    ..aOB(8, _omitFieldNames ? '' : 'isNsfw')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Extension clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Extension copyWith(void Function(Extension) updates) =>
      super.copyWith((message) => updates(message as Extension)) as Extension;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Extension create() => Extension._();
  @$core.override
  Extension createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Extension getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Extension>(create);
  static Extension? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get repoBaseUrl => $_getSZ(0);
  @$pb.TagNumber(1)
  set repoBaseUrl($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRepoBaseUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearRepoBaseUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get pkgName => $_getSZ(1);
  @$pb.TagNumber(2)
  set pkgName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPkgName() => $_has(1);
  @$pb.TagNumber(2)
  void clearPkgName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get displayName => $_getSZ(2);
  @$pb.TagNumber(3)
  set displayName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDisplayName() => $_has(2);
  @$pb.TagNumber(3)
  void clearDisplayName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get zipName => $_getSZ(3);
  @$pb.TagNumber(4)
  set zipName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasZipName() => $_has(3);
  @$pb.TagNumber(4)
  void clearZipName() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get version => $_getIZ(4);
  @$pb.TagNumber(5)
  set version($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVersion() => $_has(4);
  @$pb.TagNumber(5)
  void clearVersion() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get pythonVersion => $_getIZ(5);
  @$pb.TagNumber(6)
  set pythonVersion($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPythonVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearPythonVersion() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get lang => $_getSZ(6);
  @$pb.TagNumber(7)
  set lang($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLang() => $_has(6);
  @$pb.TagNumber(7)
  void clearLang() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.bool get isNsfw => $_getBF(7);
  @$pb.TagNumber(8)
  set isNsfw($core.bool value) => $_setBool(7, value);
  @$pb.TagNumber(8)
  $core.bool hasIsNsfw() => $_has(7);
  @$pb.TagNumber(8)
  void clearIsNsfw() => $_clearField(8);
}

/// Extension Repo messages
class ExtensionRepo extends $pb.GeneratedMessage {
  factory ExtensionRepo({
    $core.String? url,
    $fixnum.Int64? addedAt,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (addedAt != null) result.addedAt = addedAt;
    return result;
  }

  ExtensionRepo._();

  factory ExtensionRepo.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ExtensionRepo.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ExtensionRepo',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aInt64(2, _omitFieldNames ? '' : 'addedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtensionRepo clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ExtensionRepo copyWith(void Function(ExtensionRepo) updates) =>
      super.copyWith((message) => updates(message as ExtensionRepo))
          as ExtensionRepo;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ExtensionRepo create() => ExtensionRepo._();
  @$core.override
  ExtensionRepo createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ExtensionRepo getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ExtensionRepo>(create);
  static ExtensionRepo? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get addedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set addedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddedAt() => $_clearField(2);
}

class AddExtensionRepoReq extends $pb.GeneratedMessage {
  factory AddExtensionRepoReq({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) result.url = url;
    return result;
  }

  AddExtensionRepoReq._();

  factory AddExtensionRepoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddExtensionRepoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddExtensionRepoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddExtensionRepoReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddExtensionRepoReq copyWith(void Function(AddExtensionRepoReq) updates) =>
      super.copyWith((message) => updates(message as AddExtensionRepoReq))
          as AddExtensionRepoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoReq create() => AddExtensionRepoReq._();
  @$core.override
  AddExtensionRepoReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddExtensionRepoReq>(create);
  static AddExtensionRepoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);
}

class AddExtensionRepoRes extends $pb.GeneratedMessage {
  factory AddExtensionRepoRes({
    $core.String? url,
    $fixnum.Int64? addedAt,
  }) {
    final result = create();
    if (url != null) result.url = url;
    if (addedAt != null) result.addedAt = addedAt;
    return result;
  }

  AddExtensionRepoRes._();

  factory AddExtensionRepoRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddExtensionRepoRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddExtensionRepoRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..aInt64(2, _omitFieldNames ? '' : 'addedAt')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddExtensionRepoRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddExtensionRepoRes copyWith(void Function(AddExtensionRepoRes) updates) =>
      super.copyWith((message) => updates(message as AddExtensionRepoRes))
          as AddExtensionRepoRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoRes create() => AddExtensionRepoRes._();
  @$core.override
  AddExtensionRepoRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static AddExtensionRepoRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddExtensionRepoRes>(create);
  static AddExtensionRepoRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get addedAt => $_getI64(1);
  @$pb.TagNumber(2)
  set addedAt($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAddedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddedAt() => $_clearField(2);
}

class RemoveExtensionRepoReq extends $pb.GeneratedMessage {
  factory RemoveExtensionRepoReq({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) result.url = url;
    return result;
  }

  RemoveExtensionRepoReq._();

  factory RemoveExtensionRepoReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RemoveExtensionRepoReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RemoveExtensionRepoReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveExtensionRepoReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RemoveExtensionRepoReq copyWith(
          void Function(RemoveExtensionRepoReq) updates) =>
      super.copyWith((message) => updates(message as RemoveExtensionRepoReq))
          as RemoveExtensionRepoReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveExtensionRepoReq create() => RemoveExtensionRepoReq._();
  @$core.override
  RemoveExtensionRepoReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static RemoveExtensionRepoReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RemoveExtensionRepoReq>(create);
  static RemoveExtensionRepoReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get url => $_getSZ(0);
  @$pb.TagNumber(1)
  set url($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUrl() => $_has(0);
  @$pb.TagNumber(1)
  void clearUrl() => $_clearField(1);
}

class ListExtensionReposRes extends $pb.GeneratedMessage {
  factory ListExtensionReposRes({
    $core.Iterable<ExtensionRepo>? repos,
  }) {
    final result = create();
    if (repos != null) result.repos.addAll(repos);
    return result;
  }

  ListExtensionReposRes._();

  factory ListExtensionReposRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListExtensionReposRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListExtensionReposRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<ExtensionRepo>(1, _omitFieldNames ? '' : 'repos',
        subBuilder: ExtensionRepo.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListExtensionReposRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListExtensionReposRes copyWith(
          void Function(ListExtensionReposRes) updates) =>
      super.copyWith((message) => updates(message as ListExtensionReposRes))
          as ListExtensionReposRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListExtensionReposRes create() => ListExtensionReposRes._();
  @$core.override
  ListExtensionReposRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static ListExtensionReposRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListExtensionReposRes>(create);
  static ListExtensionReposRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ExtensionRepo> get repos => $_getList(0);
}

/// Health Check messages
class HealthCheckReq extends $pb.GeneratedMessage {
  factory HealthCheckReq({
    $core.String? service,
  }) {
    final result = create();
    if (service != null) result.service = service;
    return result;
  }

  HealthCheckReq._();

  factory HealthCheckReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HealthCheckReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HealthCheckReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'service')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HealthCheckReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HealthCheckReq copyWith(void Function(HealthCheckReq) updates) =>
      super.copyWith((message) => updates(message as HealthCheckReq))
          as HealthCheckReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HealthCheckReq create() => HealthCheckReq._();
  @$core.override
  HealthCheckReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HealthCheckReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HealthCheckReq>(create);
  static HealthCheckReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get service => $_getSZ(0);
  @$pb.TagNumber(1)
  set service($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasService() => $_has(0);
  @$pb.TagNumber(1)
  void clearService() => $_clearField(1);
}

class HealthCheckRes extends $pb.GeneratedMessage {
  factory HealthCheckRes({
    HealthCheckRes_ServingStatus? status,
    $core.String? message,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (message != null) result.message = message;
    return result;
  }

  HealthCheckRes._();

  factory HealthCheckRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory HealthCheckRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'HealthCheckRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aE<HealthCheckRes_ServingStatus>(1, _omitFieldNames ? '' : 'status',
        enumValues: HealthCheckRes_ServingStatus.values)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HealthCheckRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  HealthCheckRes copyWith(void Function(HealthCheckRes) updates) =>
      super.copyWith((message) => updates(message as HealthCheckRes))
          as HealthCheckRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static HealthCheckRes create() => HealthCheckRes._();
  @$core.override
  HealthCheckRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static HealthCheckRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<HealthCheckRes>(create);
  static HealthCheckRes? _defaultInstance;

  @$pb.TagNumber(1)
  HealthCheckRes_ServingStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(HealthCheckRes_ServingStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
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
    if (timestamp != null) result.timestamp = timestamp;
    if (level != null) result.level = level;
    if (loggerName != null) result.loggerName = loggerName;
    if (message != null) result.message = message;
    if (exception != null) result.exception = exception;
    return result;
  }

  LogEntry._();

  factory LogEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory LogEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'LogEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'timestamp')
    ..aE<LogLevel>(2, _omitFieldNames ? '' : 'level',
        enumValues: LogLevel.values)
    ..aOS(3, _omitFieldNames ? '' : 'loggerName')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..aOS(5, _omitFieldNames ? '' : 'exception')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogEntry clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  LogEntry copyWith(void Function(LogEntry) updates) =>
      super.copyWith((message) => updates(message as LogEntry)) as LogEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LogEntry create() => LogEntry._();
  @$core.override
  LogEntry createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static LogEntry getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LogEntry>(create);
  static LogEntry? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get timestamp => $_getI64(0);
  @$pb.TagNumber(1)
  set timestamp($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTimestamp() => $_has(0);
  @$pb.TagNumber(1)
  void clearTimestamp() => $_clearField(1);

  @$pb.TagNumber(2)
  LogLevel get level => $_getN(1);
  @$pb.TagNumber(2)
  set level(LogLevel value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasLevel() => $_has(1);
  @$pb.TagNumber(2)
  void clearLevel() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get loggerName => $_getSZ(2);
  @$pb.TagNumber(3)
  set loggerName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasLoggerName() => $_has(2);
  @$pb.TagNumber(3)
  void clearLoggerName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get exception => $_getSZ(4);
  @$pb.TagNumber(5)
  set exception($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasException() => $_has(4);
  @$pb.TagNumber(5)
  void clearException() => $_clearField(5);
}

class WatchLogsReq extends $pb.GeneratedMessage {
  factory WatchLogsReq({
    LogLevel? minLevel,
    $core.String? loggerFilter,
  }) {
    final result = create();
    if (minLevel != null) result.minLevel = minLevel;
    if (loggerFilter != null) result.loggerFilter = loggerFilter;
    return result;
  }

  WatchLogsReq._();

  factory WatchLogsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory WatchLogsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'WatchLogsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aE<LogLevel>(1, _omitFieldNames ? '' : 'minLevel',
        enumValues: LogLevel.values)
    ..aOS(2, _omitFieldNames ? '' : 'loggerFilter')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchLogsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  WatchLogsReq copyWith(void Function(WatchLogsReq) updates) =>
      super.copyWith((message) => updates(message as WatchLogsReq))
          as WatchLogsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static WatchLogsReq create() => WatchLogsReq._();
  @$core.override
  WatchLogsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static WatchLogsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<WatchLogsReq>(create);
  static WatchLogsReq? _defaultInstance;

  @$pb.TagNumber(1)
  LogLevel get minLevel => $_getN(0);
  @$pb.TagNumber(1)
  set minLevel(LogLevel value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMinLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearMinLevel() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get loggerFilter => $_getSZ(1);
  @$pb.TagNumber(2)
  set loggerFilter($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLoggerFilter() => $_has(1);
  @$pb.TagNumber(2)
  void clearLoggerFilter() => $_clearField(2);
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
    if (startTime != null) result.startTime = startTime;
    if (endTime != null) result.endTime = endTime;
    if (minLevel != null) result.minLevel = minLevel;
    if (loggerFilter != null) result.loggerFilter = loggerFilter;
    if (limit != null) result.limit = limit;
    return result;
  }

  GetLogsReq._();

  factory GetLogsReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLogsReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLogsReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startTime')
    ..aInt64(2, _omitFieldNames ? '' : 'endTime')
    ..aE<LogLevel>(3, _omitFieldNames ? '' : 'minLevel',
        enumValues: LogLevel.values)
    ..aOS(4, _omitFieldNames ? '' : 'loggerFilter')
    ..aI(5, _omitFieldNames ? '' : 'limit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLogsReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLogsReq copyWith(void Function(GetLogsReq) updates) =>
      super.copyWith((message) => updates(message as GetLogsReq)) as GetLogsReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLogsReq create() => GetLogsReq._();
  @$core.override
  GetLogsReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetLogsReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLogsReq>(create);
  static GetLogsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $fixnum.Int64 get startTime => $_getI64(0);
  @$pb.TagNumber(1)
  set startTime($fixnum.Int64 value) => $_setInt64(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStartTime() => $_has(0);
  @$pb.TagNumber(1)
  void clearStartTime() => $_clearField(1);

  @$pb.TagNumber(2)
  $fixnum.Int64 get endTime => $_getI64(1);
  @$pb.TagNumber(2)
  set endTime($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEndTime() => $_has(1);
  @$pb.TagNumber(2)
  void clearEndTime() => $_clearField(2);

  @$pb.TagNumber(3)
  LogLevel get minLevel => $_getN(2);
  @$pb.TagNumber(3)
  set minLevel(LogLevel value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasMinLevel() => $_has(2);
  @$pb.TagNumber(3)
  void clearMinLevel() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get loggerFilter => $_getSZ(3);
  @$pb.TagNumber(4)
  set loggerFilter($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLoggerFilter() => $_has(3);
  @$pb.TagNumber(4)
  void clearLoggerFilter() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get limit => $_getIZ(4);
  @$pb.TagNumber(5)
  set limit($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLimit() => $_has(4);
  @$pb.TagNumber(5)
  void clearLimit() => $_clearField(5);
}

class GetLogsRes extends $pb.GeneratedMessage {
  factory GetLogsRes({
    $core.Iterable<LogEntry>? entries,
  }) {
    final result = create();
    if (entries != null) result.entries.addAll(entries);
    return result;
  }

  GetLogsRes._();

  factory GetLogsRes.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLogsRes.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLogsRes',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..pPM<LogEntry>(1, _omitFieldNames ? '' : 'entries',
        subBuilder: LogEntry.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLogsRes clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLogsRes copyWith(void Function(GetLogsRes) updates) =>
      super.copyWith((message) => updates(message as GetLogsRes)) as GetLogsRes;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLogsRes create() => GetLogsRes._();
  @$core.override
  GetLogsRes createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static GetLogsRes getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLogsRes>(create);
  static GetLogsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<LogEntry> get entries => $_getList(0);
}

class SetLogLevelReq extends $pb.GeneratedMessage {
  factory SetLogLevelReq({
    LogLevel? level,
  }) {
    final result = create();
    if (level != null) result.level = level;
    return result;
  }

  SetLogLevelReq._();

  factory SetLogLevelReq.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SetLogLevelReq.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SetLogLevelReq',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'),
      createEmptyInstance: create)
    ..aE<LogLevel>(1, _omitFieldNames ? '' : 'level',
        enumValues: LogLevel.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLogLevelReq clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SetLogLevelReq copyWith(void Function(SetLogLevelReq) updates) =>
      super.copyWith((message) => updates(message as SetLogLevelReq))
          as SetLogLevelReq;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetLogLevelReq create() => SetLogLevelReq._();
  @$core.override
  SetLogLevelReq createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static SetLogLevelReq getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SetLogLevelReq>(create);
  static SetLogLevelReq? _defaultInstance;

  @$pb.TagNumber(1)
  LogLevel get level => $_getN(0);
  @$pb.TagNumber(1)
  set level(LogLevel value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
