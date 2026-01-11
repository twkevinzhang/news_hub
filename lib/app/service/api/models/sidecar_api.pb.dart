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

import 'domain_models.pb.dart' as $1;
import 'domain_models.pbenum.dart' as $1;
import 'sidecar_api.pbenum.dart';

export 'sidecar_api.pbenum.dart';

class GetBoardsReq extends $pb.GeneratedMessage {
  factory GetBoardsReq({
    $1.PaginationReq? page,
    $core.String? pkgName,
  }) {
    final result = create();
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBoardsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOM<$1.PaginationReq>(2, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationReq.create)
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

  @$pb.TagNumber(2)
  $1.PaginationReq get page => $_getN(0);
  @$pb.TagNumber(2)
  set page($1.PaginationReq v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  $1.PaginationReq ensurePage() => $_ensure(0);

  @$pb.TagNumber(3)
  $core.String get pkgName => $_getSZ(1);
  @$pb.TagNumber(3)
  set pkgName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasPkgName() => $_has(1);
  @$pb.TagNumber(3)
  void clearPkgName() => clearField(3);
}

class GetBoardsRes extends $pb.GeneratedMessage {
  factory GetBoardsRes({
    $core.Iterable<$1.Board>? boards,
    $1.PaginationRes? page,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBoardsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.Board>(1, _omitFieldNames ? '' : 'boards', $pb.PbFieldType.PM, subBuilder: $1.Board.create)
    ..aOM<$1.PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationRes.create)
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
  $core.List<$1.Board> get boards => $_getList(0);

  @$pb.TagNumber(2)
  $1.PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($1.PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  $1.PaginationRes ensurePage() => $_ensure(1);
}

class GetThreadsReq extends $pb.GeneratedMessage {
  factory GetThreadsReq({
    $1.PaginationReq? page,
    $core.String? keywords,
    $core.String? pkgName,
    $core.String? sort,
    $core.String? boardId,
  }) {
    final result = create();
    if (page != null) {
      result.page = page;
    }
    if (keywords != null) {
      result.keywords = keywords;
    }
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    if (sort != null) {
      result.sort = sort;
    }
    if (boardId != null) {
      result.boardId = boardId;
    }
    return result;
  }
  GetThreadsReq._() : super();
  factory GetThreadsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOM<$1.PaginationReq>(3, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationReq.create)
    ..aOS(5, _omitFieldNames ? '' : 'keywords')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..aOS(7, _omitFieldNames ? '' : 'sort')
    ..aOS(8, _omitFieldNames ? '' : 'boardId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadsReq clone() => GetThreadsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadsReq copyWith(void Function(GetThreadsReq) updates) => super.copyWith((message) => updates(message as GetThreadsReq)) as GetThreadsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadsReq create() => GetThreadsReq._();
  GetThreadsReq createEmptyInstance() => create();
  static $pb.PbList<GetThreadsReq> createRepeated() => $pb.PbList<GetThreadsReq>();
  @$core.pragma('dart2js:noInline')
  static GetThreadsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadsReq>(create);
  static GetThreadsReq? _defaultInstance;

  @$pb.TagNumber(3)
  $1.PaginationReq get page => $_getN(0);
  @$pb.TagNumber(3)
  set page($1.PaginationReq v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPage() => $_has(0);
  @$pb.TagNumber(3)
  void clearPage() => clearField(3);
  @$pb.TagNumber(3)
  $1.PaginationReq ensurePage() => $_ensure(0);

  @$pb.TagNumber(5)
  $core.String get keywords => $_getSZ(1);
  @$pb.TagNumber(5)
  set keywords($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(5)
  $core.bool hasKeywords() => $_has(1);
  @$pb.TagNumber(5)
  void clearKeywords() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(2);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(2);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sort => $_getSZ(3);
  @$pb.TagNumber(7)
  set sort($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(7)
  $core.bool hasSort() => $_has(3);
  @$pb.TagNumber(7)
  void clearSort() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get boardId => $_getSZ(4);
  @$pb.TagNumber(8)
  set boardId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(8)
  $core.bool hasBoardId() => $_has(4);
  @$pb.TagNumber(8)
  void clearBoardId() => clearField(8);
}

class GetThreadsRes extends $pb.GeneratedMessage {
  factory GetThreadsRes({
    $core.Iterable<$1.Post>? threads,
    $1.PaginationRes? page,
  }) {
    final result = create();
    if (threads != null) {
      result.threads.addAll(threads);
    }
    if (page != null) {
      result.page = page;
    }
    return result;
  }
  GetThreadsRes._() : super();
  factory GetThreadsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetThreadsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetThreadsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.Post>(1, _omitFieldNames ? '' : 'threads', $pb.PbFieldType.PM, subBuilder: $1.Post.create)
    ..aOM<$1.PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationRes.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetThreadsRes clone() => GetThreadsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetThreadsRes copyWith(void Function(GetThreadsRes) updates) => super.copyWith((message) => updates(message as GetThreadsRes)) as GetThreadsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetThreadsRes create() => GetThreadsRes._();
  GetThreadsRes createEmptyInstance() => create();
  static $pb.PbList<GetThreadsRes> createRepeated() => $pb.PbList<GetThreadsRes>();
  @$core.pragma('dart2js:noInline')
  static GetThreadsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetThreadsRes>(create);
  static GetThreadsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Post> get threads => $_getList(0);

  @$pb.TagNumber(2)
  $1.PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($1.PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  $1.PaginationRes ensurePage() => $_ensure(1);
}

class GetOriginalPostReq extends $pb.GeneratedMessage {
  factory GetOriginalPostReq({
    $core.String? threadId,
    $core.String? boardId,
    $core.String? postId,
    $core.String? pkgName,
  }) {
    final result = create();
    if (threadId != null) {
      result.threadId = threadId;
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
  GetOriginalPostReq._() : super();
  factory GetOriginalPostReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOriginalPostReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOriginalPostReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'threadId')
    ..aOS(3, _omitFieldNames ? '' : 'boardId')
    ..aOS(4, _omitFieldNames ? '' : 'postId')
    ..aOS(5, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOriginalPostReq clone() => GetOriginalPostReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOriginalPostReq copyWith(void Function(GetOriginalPostReq) updates) => super.copyWith((message) => updates(message as GetOriginalPostReq)) as GetOriginalPostReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOriginalPostReq create() => GetOriginalPostReq._();
  GetOriginalPostReq createEmptyInstance() => create();
  static $pb.PbList<GetOriginalPostReq> createRepeated() => $pb.PbList<GetOriginalPostReq>();
  @$core.pragma('dart2js:noInline')
  static GetOriginalPostReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOriginalPostReq>(create);
  static GetOriginalPostReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get threadId => $_getSZ(0);
  @$pb.TagNumber(1)
  set threadId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasThreadId() => $_has(0);
  @$pb.TagNumber(1)
  void clearThreadId() => clearField(1);

  @$pb.TagNumber(3)
  $core.String get boardId => $_getSZ(1);
  @$pb.TagNumber(3)
  set boardId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasBoardId() => $_has(1);
  @$pb.TagNumber(3)
  void clearBoardId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get postId => $_getSZ(2);
  @$pb.TagNumber(4)
  set postId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasPostId() => $_has(2);
  @$pb.TagNumber(4)
  void clearPostId() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get pkgName => $_getSZ(3);
  @$pb.TagNumber(5)
  set pkgName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasPkgName() => $_has(3);
  @$pb.TagNumber(5)
  void clearPkgName() => clearField(5);
}

class GetOriginalPostRes extends $pb.GeneratedMessage {
  factory GetOriginalPostRes({
    $1.Post? originalPost,
  }) {
    final result = create();
    if (originalPost != null) {
      result.originalPost = originalPost;
    }
    return result;
  }
  GetOriginalPostRes._() : super();
  factory GetOriginalPostRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetOriginalPostRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetOriginalPostRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOM<$1.Post>(1, _omitFieldNames ? '' : 'originalPost', subBuilder: $1.Post.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetOriginalPostRes clone() => GetOriginalPostRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetOriginalPostRes copyWith(void Function(GetOriginalPostRes) updates) => super.copyWith((message) => updates(message as GetOriginalPostRes)) as GetOriginalPostRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOriginalPostRes create() => GetOriginalPostRes._();
  GetOriginalPostRes createEmptyInstance() => create();
  static $pb.PbList<GetOriginalPostRes> createRepeated() => $pb.PbList<GetOriginalPostRes>();
  @$core.pragma('dart2js:noInline')
  static GetOriginalPostRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetOriginalPostRes>(create);
  static GetOriginalPostRes? _defaultInstance;

  @$pb.TagNumber(1)
  $1.Post get originalPost => $_getN(0);
  @$pb.TagNumber(1)
  set originalPost($1.Post v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOriginalPost() => $_has(0);
  @$pb.TagNumber(1)
  void clearOriginalPost() => clearField(1);
  @$pb.TagNumber(1)
  $1.Post ensureOriginalPost() => $_ensure(0);
}

class GetRepliesReq extends $pb.GeneratedMessage {
  factory GetRepliesReq({
    $core.String? boardId,
    $core.String? threadId,
    $1.PaginationReq? page,
    $core.String? replyToId,
    $core.String? pkgName,
  }) {
    final result = create();
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
  GetRepliesReq._() : super();
  factory GetRepliesReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRepliesReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRepliesReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'boardId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOM<$1.PaginationReq>(4, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationReq.create)
    ..aOS(5, _omitFieldNames ? '' : 'replyToId')
    ..aOS(6, _omitFieldNames ? '' : 'pkgName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRepliesReq clone() => GetRepliesReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRepliesReq copyWith(void Function(GetRepliesReq) updates) => super.copyWith((message) => updates(message as GetRepliesReq)) as GetRepliesReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRepliesReq create() => GetRepliesReq._();
  GetRepliesReq createEmptyInstance() => create();
  static $pb.PbList<GetRepliesReq> createRepeated() => $pb.PbList<GetRepliesReq>();
  @$core.pragma('dart2js:noInline')
  static GetRepliesReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRepliesReq>(create);
  static GetRepliesReq? _defaultInstance;

  @$pb.TagNumber(2)
  $core.String get boardId => $_getSZ(0);
  @$pb.TagNumber(2)
  set boardId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoardId() => $_has(0);
  @$pb.TagNumber(2)
  void clearBoardId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(1);
  @$pb.TagNumber(3)
  set threadId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(1);
  @$pb.TagNumber(3)
  void clearThreadId() => clearField(3);

  @$pb.TagNumber(4)
  $1.PaginationReq get page => $_getN(2);
  @$pb.TagNumber(4)
  set page($1.PaginationReq v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPage() => $_has(2);
  @$pb.TagNumber(4)
  void clearPage() => clearField(4);
  @$pb.TagNumber(4)
  $1.PaginationReq ensurePage() => $_ensure(2);

  @$pb.TagNumber(5)
  $core.String get replyToId => $_getSZ(3);
  @$pb.TagNumber(5)
  set replyToId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasReplyToId() => $_has(3);
  @$pb.TagNumber(5)
  void clearReplyToId() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);
}

class GetRepliesRes extends $pb.GeneratedMessage {
  factory GetRepliesRes({
    $core.Iterable<$1.Post>? replies,
    $1.PaginationRes? page,
  }) {
    final result = create();
    if (replies != null) {
      result.replies.addAll(replies);
    }
    if (page != null) {
      result.page = page;
    }
    return result;
  }
  GetRepliesRes._() : super();
  factory GetRepliesRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetRepliesRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetRepliesRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.Post>(1, _omitFieldNames ? '' : 'replies', $pb.PbFieldType.PM, subBuilder: $1.Post.create)
    ..aOM<$1.PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationRes.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetRepliesRes clone() => GetRepliesRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetRepliesRes copyWith(void Function(GetRepliesRes) updates) => super.copyWith((message) => updates(message as GetRepliesRes)) as GetRepliesRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetRepliesRes create() => GetRepliesRes._();
  GetRepliesRes createEmptyInstance() => create();
  static $pb.PbList<GetRepliesRes> createRepeated() => $pb.PbList<GetRepliesRes>();
  @$core.pragma('dart2js:noInline')
  static GetRepliesRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetRepliesRes>(create);
  static GetRepliesRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$1.Post> get replies => $_getList(0);

  @$pb.TagNumber(2)
  $1.PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($1.PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  $1.PaginationRes ensurePage() => $_ensure(1);
}

class GetCommentsReq extends $pb.GeneratedMessage {
  factory GetCommentsReq({
    $core.String? boardId,
    $core.String? threadId,
    $core.String? postId,
    $1.PaginationReq? page,
    $core.String? pkgName,
  }) {
    final result = create();
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCommentsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOS(2, _omitFieldNames ? '' : 'boardId')
    ..aOS(3, _omitFieldNames ? '' : 'threadId')
    ..aOS(4, _omitFieldNames ? '' : 'postId')
    ..aOM<$1.PaginationReq>(5, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationReq.create)
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

  @$pb.TagNumber(2)
  $core.String get boardId => $_getSZ(0);
  @$pb.TagNumber(2)
  set boardId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasBoardId() => $_has(0);
  @$pb.TagNumber(2)
  void clearBoardId() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get threadId => $_getSZ(1);
  @$pb.TagNumber(3)
  set threadId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasThreadId() => $_has(1);
  @$pb.TagNumber(3)
  void clearThreadId() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get postId => $_getSZ(2);
  @$pb.TagNumber(4)
  set postId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasPostId() => $_has(2);
  @$pb.TagNumber(4)
  void clearPostId() => clearField(4);

  @$pb.TagNumber(5)
  $1.PaginationReq get page => $_getN(3);
  @$pb.TagNumber(5)
  set page($1.PaginationReq v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasPage() => $_has(3);
  @$pb.TagNumber(5)
  void clearPage() => clearField(5);
  @$pb.TagNumber(5)
  $1.PaginationReq ensurePage() => $_ensure(3);

  @$pb.TagNumber(6)
  $core.String get pkgName => $_getSZ(4);
  @$pb.TagNumber(6)
  set pkgName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasPkgName() => $_has(4);
  @$pb.TagNumber(6)
  void clearPkgName() => clearField(6);
}

class GetCommentsRes extends $pb.GeneratedMessage {
  factory GetCommentsRes({
    $core.Iterable<$1.Comment>? comments,
    $1.PaginationRes? page,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCommentsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.Comment>(1, _omitFieldNames ? '' : 'comments', $pb.PbFieldType.PM, subBuilder: $1.Comment.create)
    ..aOM<$1.PaginationRes>(2, _omitFieldNames ? '' : 'page', subBuilder: $1.PaginationRes.create)
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
  $core.List<$1.Comment> get comments => $_getList(0);

  @$pb.TagNumber(2)
  $1.PaginationRes get page => $_getN(1);
  @$pb.TagNumber(2)
  set page($1.PaginationRes v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasPage() => $_has(1);
  @$pb.TagNumber(2)
  void clearPage() => clearField(2);
  @$pb.TagNumber(2)
  $1.PaginationRes ensurePage() => $_ensure(1);
}

class ListInstalledExtensionsRes extends $pb.GeneratedMessage {
  factory ListInstalledExtensionsRes({
    $core.Iterable<$1.Extension>? extensions,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListInstalledExtensionsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.Extension>(1, _omitFieldNames ? '' : 'extensions', $pb.PbFieldType.PM, subBuilder: $1.Extension.create)
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
  $core.List<$1.Extension> get extensions => $_getList(0);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstalledExtensionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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
    $1.Extension? extension_1,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstalledExtensionRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOM<$1.Extension>(1, _omitFieldNames ? '' : 'extension', subBuilder: $1.Extension.create)
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
  $1.Extension get extension_1 => $_getN(0);
  @$pb.TagNumber(1)
  set extension_1($1.Extension v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasExtension_1() => $_has(0);
  @$pb.TagNumber(1)
  void clearExtension_1() => clearField(1);
  @$pb.TagNumber(1)
  $1.Extension ensureExtension_1() => $_ensure(0);
}

class InstallExtensionReq extends $pb.GeneratedMessage {
  factory InstallExtensionReq({
    $core.String? pkgName,
    $core.String? repoUrl,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    if (repoUrl != null) {
      result.repoUrl = repoUrl;
    }
    return result;
  }
  InstallExtensionReq._() : super();
  factory InstallExtensionReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InstallExtensionReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InstallExtensionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
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

  @$pb.TagNumber(4)
  $core.String get repoUrl => $_getSZ(1);
  @$pb.TagNumber(4)
  set repoUrl($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(4)
  $core.bool hasRepoUrl() => $_has(1);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UninstallExtensionReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstallProgressReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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
    $fixnum.Int64? progress,
  }) {
    final result = create();
    if (progress != null) {
      result.progress = progress;
    }
    return result;
  }
  GetInstallProgressRes._() : super();
  factory GetInstallProgressRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetInstallProgressRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetInstallProgressRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aInt64(2, _omitFieldNames ? '' : 'progress')
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

  @$pb.TagNumber(2)
  $fixnum.Int64 get progress => $_getI64(0);
  @$pb.TagNumber(2)
  set progress($fixnum.Int64 v) { $_setInt64(0, v); }
  @$pb.TagNumber(2)
  $core.bool hasProgress() => $_has(0);
  @$pb.TagNumber(2)
  void clearProgress() => clearField(2);
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRemoteExtensionsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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
    $core.Iterable<$1.RemoteExtension>? extensions,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListRemoteExtensionsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.RemoteExtension>(1, _omitFieldNames ? '' : 'extensions', $pb.PbFieldType.PM, subBuilder: $1.RemoteExtension.create)
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
  $core.List<$1.RemoteExtension> get extensions => $_getList(0);
}

class ListExtensionReposRes extends $pb.GeneratedMessage {
  factory ListExtensionReposRes({
    $core.Iterable<$1.ExtensionRepo>? repos,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListExtensionReposRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.ExtensionRepo>(1, _omitFieldNames ? '' : 'repos', $pb.PbFieldType.PM, subBuilder: $1.ExtensionRepo.create)
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
  $core.List<$1.ExtensionRepo> get repos => $_getList(0);
}

class AddExtensionRepoReq extends $pb.GeneratedMessage {
  factory AddExtensionRepoReq({
    $core.String? url,
  }) {
    final result = create();
    if (url != null) {
      result.url = url;
    }
    return result;
  }
  AddExtensionRepoReq._() : super();
  factory AddExtensionRepoReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddExtensionRepoReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddExtensionRepoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'url')
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddExtensionRepoRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveExtensionRepoReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HealthCheckReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'HealthCheckRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
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

class WatchLogsReq extends $pb.GeneratedMessage {
  factory WatchLogsReq({
    $1.LogLevel? minLevel,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'WatchLogsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..e<$1.LogLevel>(1, _omitFieldNames ? '' : 'minLevel', $pb.PbFieldType.OE, defaultOrMaker: $1.LogLevel.DEBUG, valueOf: $1.LogLevel.valueOf, enumValues: $1.LogLevel.values)
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
  $1.LogLevel get minLevel => $_getN(0);
  @$pb.TagNumber(1)
  set minLevel($1.LogLevel v) { setField(1, v); }
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
    $1.LogLevel? minLevel,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLogsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aInt64(1, _omitFieldNames ? '' : 'startTime')
    ..aInt64(2, _omitFieldNames ? '' : 'endTime')
    ..e<$1.LogLevel>(3, _omitFieldNames ? '' : 'minLevel', $pb.PbFieldType.OE, defaultOrMaker: $1.LogLevel.DEBUG, valueOf: $1.LogLevel.valueOf, enumValues: $1.LogLevel.values)
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
  $1.LogLevel get minLevel => $_getN(2);
  @$pb.TagNumber(3)
  set minLevel($1.LogLevel v) { setField(3, v); }
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
    $core.Iterable<$1.LogEntry>? entries,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLogsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<$1.LogEntry>(1, _omitFieldNames ? '' : 'entries', $pb.PbFieldType.PM, subBuilder: $1.LogEntry.create)
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
  $core.List<$1.LogEntry> get entries => $_getList(0);
}

class SetLogLevelReq extends $pb.GeneratedMessage {
  factory SetLogLevelReq({
    $1.LogLevel? level,
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

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetLogLevelReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..e<$1.LogLevel>(1, _omitFieldNames ? '' : 'level', $pb.PbFieldType.OE, defaultOrMaker: $1.LogLevel.DEBUG, valueOf: $1.LogLevel.valueOf, enumValues: $1.LogLevel.values)
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
  $1.LogLevel get level => $_getN(0);
  @$pb.TagNumber(1)
  set level($1.LogLevel v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => clearField(1);
}

class BoardSortOption extends $pb.GeneratedMessage {
  factory BoardSortOption({
    $core.String? boardId,
    $core.Iterable<$core.String>? options,
  }) {
    final result = create();
    if (boardId != null) {
      result.boardId = boardId;
    }
    if (options != null) {
      result.options.addAll(options);
    }
    return result;
  }
  BoardSortOption._() : super();
  factory BoardSortOption.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BoardSortOption.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BoardSortOption', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'boardId')
    ..pPS(2, _omitFieldNames ? '' : 'options')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BoardSortOption clone() => BoardSortOption()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BoardSortOption copyWith(void Function(BoardSortOption) updates) => super.copyWith((message) => updates(message as BoardSortOption)) as BoardSortOption;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BoardSortOption create() => BoardSortOption._();
  BoardSortOption createEmptyInstance() => create();
  static $pb.PbList<BoardSortOption> createRepeated() => $pb.PbList<BoardSortOption>();
  @$core.pragma('dart2js:noInline')
  static BoardSortOption getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BoardSortOption>(create);
  static BoardSortOption? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get boardId => $_getSZ(0);
  @$pb.TagNumber(1)
  set boardId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBoardId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBoardId() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get options => $_getList(1);
}

class GetBoardSortOptionsReq extends $pb.GeneratedMessage {
  factory GetBoardSortOptionsReq({
    $core.String? pkgName,
    $core.Iterable<$core.String>? boardIds,
  }) {
    final result = create();
    if (pkgName != null) {
      result.pkgName = pkgName;
    }
    if (boardIds != null) {
      result.boardIds.addAll(boardIds);
    }
    return result;
  }
  GetBoardSortOptionsReq._() : super();
  factory GetBoardSortOptionsReq.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBoardSortOptionsReq.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBoardSortOptionsReq', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'pkgName')
    ..pPS(2, _omitFieldNames ? '' : 'boardIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBoardSortOptionsReq clone() => GetBoardSortOptionsReq()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBoardSortOptionsReq copyWith(void Function(GetBoardSortOptionsReq) updates) => super.copyWith((message) => updates(message as GetBoardSortOptionsReq)) as GetBoardSortOptionsReq;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBoardSortOptionsReq create() => GetBoardSortOptionsReq._();
  GetBoardSortOptionsReq createEmptyInstance() => create();
  static $pb.PbList<GetBoardSortOptionsReq> createRepeated() => $pb.PbList<GetBoardSortOptionsReq>();
  @$core.pragma('dart2js:noInline')
  static GetBoardSortOptionsReq getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBoardSortOptionsReq>(create);
  static GetBoardSortOptionsReq? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get pkgName => $_getSZ(0);
  @$pb.TagNumber(1)
  set pkgName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPkgName() => $_has(0);
  @$pb.TagNumber(1)
  void clearPkgName() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.String> get boardIds => $_getList(1);
}

class GetBoardSortOptionsRes extends $pb.GeneratedMessage {
  factory GetBoardSortOptionsRes({
    $core.Iterable<BoardSortOption>? options,
  }) {
    final result = create();
    if (options != null) {
      result.options.addAll(options);
    }
    return result;
  }
  GetBoardSortOptionsRes._() : super();
  factory GetBoardSortOptionsRes.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBoardSortOptionsRes.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBoardSortOptionsRes', package: const $pb.PackageName(_omitMessageNames ? '' : 'news_hub.sidecar'), createEmptyInstance: create)
    ..pc<BoardSortOption>(1, _omitFieldNames ? '' : 'options', $pb.PbFieldType.PM, subBuilder: BoardSortOption.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBoardSortOptionsRes clone() => GetBoardSortOptionsRes()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBoardSortOptionsRes copyWith(void Function(GetBoardSortOptionsRes) updates) => super.copyWith((message) => updates(message as GetBoardSortOptionsRes)) as GetBoardSortOptionsRes;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBoardSortOptionsRes create() => GetBoardSortOptionsRes._();
  GetBoardSortOptionsRes createEmptyInstance() => create();
  static $pb.PbList<GetBoardSortOptionsRes> createRepeated() => $pb.PbList<GetBoardSortOptionsRes>();
  @$core.pragma('dart2js:noInline')
  static GetBoardSortOptionsRes getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBoardSortOptionsRes>(create);
  static GetBoardSortOptionsRes? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<BoardSortOption> get options => $_getList(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
