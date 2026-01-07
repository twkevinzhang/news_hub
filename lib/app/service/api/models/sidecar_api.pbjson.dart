//
//  Generated code. Do not modify.
//  source: sidecar_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use paragraphTypeDescriptor instead')
const ParagraphType$json = {
  '1': 'ParagraphType',
  '2': [
    {'1': 'PARAGRAPH_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'PARAGRAPH_TYPE_QUOTE', '2': 1},
    {'1': 'PARAGRAPH_TYPE_REPLY_TO', '2': 2},
    {'1': 'PARAGRAPH_TYPE_TEXT', '2': 3},
    {'1': 'PARAGRAPH_TYPE_NEW_LINE', '2': 7},
    {'1': 'PARAGRAPH_TYPE_IMAGE', '2': 4},
    {'1': 'PARAGRAPH_TYPE_LINK', '2': 5},
    {'1': 'PARAGRAPH_TYPE_VIDEO', '2': 6},
  ],
};

/// Descriptor for `ParagraphType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paragraphTypeDescriptor = $convert.base64Decode(
    'Cg1QYXJhZ3JhcGhUeXBlEh4KGlBBUkFHUkFQSF9UWVBFX1VOU1BFQ0lGSUVEEAASGAoUUEFSQU'
    'dSQVBIX1RZUEVfUVVPVEUQARIbChdQQVJBR1JBUEhfVFlQRV9SRVBMWV9UTxACEhcKE1BBUkFH'
    'UkFQSF9UWVBFX1RFWFQQAxIbChdQQVJBR1JBUEhfVFlQRV9ORVdfTElORRAHEhgKFFBBUkFHUk'
    'FQSF9UWVBFX0lNQUdFEAQSFwoTUEFSQUdSQVBIX1RZUEVfTElOSxAFEhgKFFBBUkFHUkFQSF9U'
    'WVBFX1ZJREVPEAY=');

@$core.Deprecated('Use logLevelDescriptor instead')
const LogLevel$json = {
  '1': 'LogLevel',
  '2': [
    {'1': 'DEBUG', '2': 0},
    {'1': 'INFO', '2': 1},
    {'1': 'WARNING', '2': 2},
    {'1': 'ERROR', '2': 3},
    {'1': 'CRITICAL', '2': 4},
  ],
};

/// Descriptor for `LogLevel`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List logLevelDescriptor = $convert.base64Decode(
    'CghMb2dMZXZlbBIJCgVERUJVRxAAEggKBElORk8QARILCgdXQVJOSU5HEAISCQoFRVJST1IQAx'
    'IMCghDUklUSUNBTBAE');

@$core.Deprecated('Use paginationReqDescriptor instead')
const PaginationReq$json = {
  '1': 'PaginationReq',
  '2': [
    {'1': 'page', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'page', '17': true},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '9': 1, '10': 'pageSize', '17': true},
    {'1': 'limit', '3': 2, '4': 1, '5': 5, '9': 2, '10': 'limit', '17': true},
    {'1': 'prev_cursor', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'prevCursor', '17': true},
    {'1': 'next_cursor', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'nextCursor', '17': true},
  ],
  '8': [
    {'1': '_page'},
    {'1': '_page_size'},
    {'1': '_limit'},
    {'1': '_prev_cursor'},
    {'1': '_next_cursor'},
  ],
};

/// Descriptor for `PaginationReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginationReqDescriptor = $convert.base64Decode(
    'Cg1QYWdpbmF0aW9uUmVxEhcKBHBhZ2UYASABKAVIAFIEcGFnZYgBARIgCglwYWdlX3NpemUYAy'
    'ABKAVIAVIIcGFnZVNpemWIAQESGQoFbGltaXQYAiABKAVIAlIFbGltaXSIAQESJAoLcHJldl9j'
    'dXJzb3IYBCABKAlIA1IKcHJldkN1cnNvcogBARIkCgtuZXh0X2N1cnNvchgFIAEoCUgEUgpuZX'
    'h0Q3Vyc29yiAEBQgcKBV9wYWdlQgwKCl9wYWdlX3NpemVCCAoGX2xpbWl0Qg4KDF9wcmV2X2N1'
    'cnNvckIOCgxfbmV4dF9jdXJzb3I=');

@$core.Deprecated('Use paginationResDescriptor instead')
const PaginationRes$json = {
  '1': 'PaginationRes',
  '2': [
    {'1': 'total_page', '3': 1, '4': 1, '5': 5, '9': 0, '10': 'totalPage', '17': true},
    {'1': 'current_page', '3': 2, '4': 1, '5': 5, '9': 1, '10': 'currentPage', '17': true},
    {'1': 'page_size', '3': 3, '4': 1, '5': 5, '9': 2, '10': 'pageSize', '17': true},
    {'1': 'prev_cursor', '3': 4, '4': 1, '5': 9, '9': 3, '10': 'prevCursor', '17': true},
    {'1': 'next_cursor', '3': 5, '4': 1, '5': 9, '9': 4, '10': 'nextCursor', '17': true},
  ],
  '8': [
    {'1': '_total_page'},
    {'1': '_current_page'},
    {'1': '_page_size'},
    {'1': '_prev_cursor'},
    {'1': '_next_cursor'},
  ],
};

/// Descriptor for `PaginationRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paginationResDescriptor = $convert.base64Decode(
    'Cg1QYWdpbmF0aW9uUmVzEiIKCnRvdGFsX3BhZ2UYASABKAVIAFIJdG90YWxQYWdliAEBEiYKDG'
    'N1cnJlbnRfcGFnZRgCIAEoBUgBUgtjdXJyZW50UGFnZYgBARIgCglwYWdlX3NpemUYAyABKAVI'
    'AlIIcGFnZVNpemWIAQESJAoLcHJldl9jdXJzb3IYBCABKAlIA1IKcHJldkN1cnNvcogBARIkCg'
    'tuZXh0X2N1cnNvchgFIAEoCUgEUgpuZXh0Q3Vyc29yiAEBQg0KC190b3RhbF9wYWdlQg8KDV9j'
    'dXJyZW50X3BhZ2VCDAoKX3BhZ2Vfc2l6ZUIOCgxfcHJldl9jdXJzb3JCDgoMX25leHRfY3Vyc2'
    '9y');

@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode(
    'CgVFbXB0eQ==');

@$core.Deprecated('Use getSiteReqDescriptor instead')
const GetSiteReq$json = {
  '1': 'GetSiteReq',
  '2': [
    {'1': 'pkg_name', '3': 1, '4': 1, '5': 9, '10': 'pkgName'},
  ],
};

/// Descriptor for `GetSiteReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSiteReqDescriptor = $convert.base64Decode(
    'CgpHZXRTaXRlUmVxEhkKCHBrZ19uYW1lGAEgASgJUgdwa2dOYW1l');

@$core.Deprecated('Use getSiteResDescriptor instead')
const GetSiteRes$json = {
  '1': 'GetSiteRes',
  '2': [
    {'1': 'site', '3': 1, '4': 1, '5': 11, '6': '.pb.Site', '10': 'site'},
  ],
};

/// Descriptor for `GetSiteRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSiteResDescriptor = $convert.base64Decode(
    'CgpHZXRTaXRlUmVzEhwKBHNpdGUYASABKAsyCC5wYi5TaXRlUgRzaXRl');

@$core.Deprecated('Use siteDescriptor instead')
const Site$json = {
  '1': 'Site',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'id', '3': 4, '4': 1, '5': 9, '10': 'id'},
    {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Site`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List siteDescriptor = $convert.base64Decode(
    'CgRTaXRlEhkKCHBrZ19uYW1lGAYgASgJUgdwa2dOYW1lEg4KAmlkGAQgASgJUgJpZBISCgRpY2'
    '9uGAUgASgJUgRpY29uEhIKBG5hbWUYASABKAlSBG5hbWUSIAoLZGVzY3JpcHRpb24YAiABKAlS'
    'C2Rlc2NyaXB0aW9uEhAKA3VybBgDIAEoCVIDdXJs');

@$core.Deprecated('Use getBoardsReqDescriptor instead')
const GetBoardsReq$json = {
  '1': 'GetBoardsReq',
  '2': [
    {'1': 'pkg_name', '3': 3, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationReq', '9': 0, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_page'},
  ],
};

/// Descriptor for `GetBoardsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBoardsReqDescriptor = $convert.base64Decode(
    'CgxHZXRCb2FyZHNSZXESGQoIcGtnX25hbWUYAyABKAlSB3BrZ05hbWUSFwoHc2l0ZV9pZBgBIA'
    'EoCVIGc2l0ZUlkEioKBHBhZ2UYAiABKAsyES5wYi5QYWdpbmF0aW9uUmVxSABSBHBhZ2WIAQFC'
    'BwoFX3BhZ2U=');

@$core.Deprecated('Use getBoardsResDescriptor instead')
const GetBoardsRes$json = {
  '1': 'GetBoardsRes',
  '2': [
    {'1': 'boards', '3': 1, '4': 3, '5': 11, '6': '.pb.Board', '10': 'boards'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetBoardsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBoardsResDescriptor = $convert.base64Decode(
    'CgxHZXRCb2FyZHNSZXMSIQoGYm9hcmRzGAEgAygLMgkucGIuQm9hcmRSBmJvYXJkcxIlCgRwYW'
    'dlGAIgASgLMhEucGIuUGFnaW5hdGlvblJlc1IEcGFnZQ==');

@$core.Deprecated('Use boardDescriptor instead')
const Board$json = {
  '1': 'Board',
  '2': [
    {'1': 'pkg_name', '3': 8, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 2, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'large_welcome_image', '3': 5, '4': 1, '5': 9, '10': 'largeWelcomeImage'},
    {'1': 'url', '3': 6, '4': 1, '5': 9, '10': 'url'},
    {'1': 'supported_threads_sorting', '3': 7, '4': 3, '5': 9, '10': 'supportedThreadsSorting'},
  ],
};

/// Descriptor for `Board`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boardDescriptor = $convert.base64Decode(
    'CgVCb2FyZBIZCghwa2dfbmFtZRgIIAEoCVIHcGtnTmFtZRIXCgdzaXRlX2lkGAIgASgJUgZzaX'
    'RlSWQSDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAyABKAlSBG5hbWUSEgoEaWNvbhgEIAEoCVIE'
    'aWNvbhIuChNsYXJnZV93ZWxjb21lX2ltYWdlGAUgASgJUhFsYXJnZVdlbGNvbWVJbWFnZRIQCg'
    'N1cmwYBiABKAlSA3VybBI6ChlzdXBwb3J0ZWRfdGhyZWFkc19zb3J0aW5nGAcgAygJUhdzdXBw'
    'b3J0ZWRUaHJlYWRzU29ydGluZw==');

@$core.Deprecated('Use getThreadInfosReqDescriptor instead')
const GetThreadInfosReq$json = {
  '1': 'GetThreadInfosReq',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'boards_sorting', '3': 2, '4': 3, '5': 11, '6': '.pb.GetThreadInfosReq.BoardsSortingEntry', '10': 'boardsSorting'},
    {'1': 'page', '3': 3, '4': 1, '5': 11, '6': '.pb.PaginationReq', '9': 0, '10': 'page', '17': true},
    {'1': 'keywords', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'keywords', '17': true},
  ],
  '3': [GetThreadInfosReq_BoardsSortingEntry$json],
  '8': [
    {'1': '_page'},
    {'1': '_keywords'},
  ],
};

@$core.Deprecated('Use getThreadInfosReqDescriptor instead')
const GetThreadInfosReq_BoardsSortingEntry$json = {
  '1': 'BoardsSortingEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GetThreadInfosReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadInfosReqDescriptor = $convert.base64Decode(
    'ChFHZXRUaHJlYWRJbmZvc1JlcRIZCghwa2dfbmFtZRgGIAEoCVIHcGtnTmFtZRIXCgdzaXRlX2'
    'lkGAEgASgJUgZzaXRlSWQSTwoOYm9hcmRzX3NvcnRpbmcYAiADKAsyKC5wYi5HZXRUaHJlYWRJ'
    'bmZvc1JlcS5Cb2FyZHNTb3J0aW5nRW50cnlSDWJvYXJkc1NvcnRpbmcSKgoEcGFnZRgDIAEoCz'
    'IRLnBiLlBhZ2luYXRpb25SZXFIAFIEcGFnZYgBARIfCghrZXl3b3JkcxgFIAEoCUgBUghrZXl3'
    'b3Jkc4gBARpAChJCb2FyZHNTb3J0aW5nRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdW'
    'UYAiABKAlSBXZhbHVlOgI4AUIHCgVfcGFnZUILCglfa2V5d29yZHM=');

@$core.Deprecated('Use getThreadInfosResDescriptor instead')
const GetThreadInfosRes$json = {
  '1': 'GetThreadInfosRes',
  '2': [
    {'1': 'thread_infos', '3': 1, '4': 3, '5': 11, '6': '.pb.Post', '10': 'threadInfos'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetThreadInfosRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadInfosResDescriptor = $convert.base64Decode(
    'ChFHZXRUaHJlYWRJbmZvc1JlcxIrCgx0aHJlYWRfaW5mb3MYASADKAsyCC5wYi5Qb3N0Ugt0aH'
    'JlYWRJbmZvcxIlCgRwYWdlGAIgASgLMhEucGIuUGFnaW5hdGlvblJlc1IEcGFnZQ==');

@$core.Deprecated('Use getThreadPostReqDescriptor instead')
const GetThreadPostReq$json = {
  '1': 'GetThreadPostReq',
  '2': [
    {'1': 'pkg_name', '3': 5, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 2, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 3, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 1, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'post_id', '3': 4, '4': 1, '5': 9, '10': 'postId'},
  ],
};

/// Descriptor for `GetThreadPostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadPostReqDescriptor = $convert.base64Decode(
    'ChBHZXRUaHJlYWRQb3N0UmVxEhkKCHBrZ19uYW1lGAUgASgJUgdwa2dOYW1lEhcKB3NpdGVfaW'
    'QYAiABKAlSBnNpdGVJZBIZCghib2FyZF9pZBgDIAEoCVIHYm9hcmRJZBIbCgl0aHJlYWRfaWQY'
    'ASABKAlSCHRocmVhZElkEhcKB3Bvc3RfaWQYBCABKAlSBnBvc3RJZA==');

@$core.Deprecated('Use getThreadPostResDescriptor instead')
const GetThreadPostRes$json = {
  '1': 'GetThreadPostRes',
  '2': [
    {'1': 'thread_post', '3': 1, '4': 1, '5': 11, '6': '.pb.Post', '10': 'threadPost'},
  ],
};

/// Descriptor for `GetThreadPostRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadPostResDescriptor = $convert.base64Decode(
    'ChBHZXRUaHJlYWRQb3N0UmVzEikKC3RocmVhZF9wb3N0GAEgASgLMggucGIuUG9zdFIKdGhyZW'
    'FkUG9zdA==');

@$core.Deprecated('Use getRegardingPostsReqDescriptor instead')
const GetRegardingPostsReq$json = {
  '1': 'GetRegardingPostsReq',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'reply_to_id', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'replyToId', '17': true},
    {'1': 'page', '3': 4, '4': 1, '5': 11, '6': '.pb.PaginationReq', '9': 1, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_reply_to_id'},
    {'1': '_page'},
  ],
};

/// Descriptor for `GetRegardingPostsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRegardingPostsReqDescriptor = $convert.base64Decode(
    'ChRHZXRSZWdhcmRpbmdQb3N0c1JlcRIZCghwa2dfbmFtZRgGIAEoCVIHcGtnTmFtZRIXCgdzaX'
    'RlX2lkGAEgASgJUgZzaXRlSWQSGQoIYm9hcmRfaWQYAiABKAlSB2JvYXJkSWQSGwoJdGhyZWFk'
    'X2lkGAMgASgJUgh0aHJlYWRJZBIjCgtyZXBseV90b19pZBgFIAEoCUgAUglyZXBseVRvSWSIAQ'
    'ESKgoEcGFnZRgEIAEoCzIRLnBiLlBhZ2luYXRpb25SZXFIAVIEcGFnZYgBAUIOCgxfcmVwbHlf'
    'dG9faWRCBwoFX3BhZ2U=');

@$core.Deprecated('Use getRegardingPostsResDescriptor instead')
const GetRegardingPostsRes$json = {
  '1': 'GetRegardingPostsRes',
  '2': [
    {'1': 'regarding_posts', '3': 1, '4': 3, '5': 11, '6': '.pb.Post', '10': 'regardingPosts'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetRegardingPostsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRegardingPostsResDescriptor = $convert.base64Decode(
    'ChRHZXRSZWdhcmRpbmdQb3N0c1JlcxIxCg9yZWdhcmRpbmdfcG9zdHMYASADKAsyCC5wYi5Qb3'
    'N0Ug5yZWdhcmRpbmdQb3N0cxIlCgRwYWdlGAIgASgLMhEucGIuUGFnaW5hdGlvblJlc1IEcGFn'
    'ZQ==');

@$core.Deprecated('Use paragraphDescriptor instead')
const Paragraph$json = {
  '1': 'Paragraph',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.pb.ParagraphType', '10': 'type'},
    {'1': 'image', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageParagraph', '9': 0, '10': 'image'},
    {'1': 'video', '3': 3, '4': 1, '5': 11, '6': '.pb.VideoParagraph', '9': 0, '10': 'video'},
    {'1': 'text', '3': 4, '4': 1, '5': 11, '6': '.pb.TextParagraph', '9': 0, '10': 'text'},
    {'1': 'new_line', '3': 8, '4': 1, '5': 11, '6': '.pb.NewLineParagraph', '9': 0, '10': 'newLine'},
    {'1': 'quote', '3': 5, '4': 1, '5': 11, '6': '.pb.QuoteParagraph', '9': 0, '10': 'quote'},
    {'1': 'reply_to', '3': 6, '4': 1, '5': 11, '6': '.pb.ReplyToParagraph', '9': 0, '10': 'replyTo'},
    {'1': 'link', '3': 7, '4': 1, '5': 11, '6': '.pb.LinkParagraph', '9': 0, '10': 'link'},
  ],
  '8': [
    {'1': 'content'},
  ],
};

/// Descriptor for `Paragraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paragraphDescriptor = $convert.base64Decode(
    'CglQYXJhZ3JhcGgSJQoEdHlwZRgBIAEoDjIRLnBiLlBhcmFncmFwaFR5cGVSBHR5cGUSKgoFaW'
    '1hZ2UYAiABKAsyEi5wYi5JbWFnZVBhcmFncmFwaEgAUgVpbWFnZRIqCgV2aWRlbxgDIAEoCzIS'
    'LnBiLlZpZGVvUGFyYWdyYXBoSABSBXZpZGVvEicKBHRleHQYBCABKAsyES5wYi5UZXh0UGFyYW'
    'dyYXBoSABSBHRleHQSMQoIbmV3X2xpbmUYCCABKAsyFC5wYi5OZXdMaW5lUGFyYWdyYXBoSABS'
    'B25ld0xpbmUSKgoFcXVvdGUYBSABKAsyEi5wYi5RdW90ZVBhcmFncmFwaEgAUgVxdW90ZRIxCg'
    'hyZXBseV90bxgGIAEoCzIULnBiLlJlcGx5VG9QYXJhZ3JhcGhIAFIHcmVwbHlUbxInCgRsaW5r'
    'GAcgASgLMhEucGIuTGlua1BhcmFncmFwaEgAUgRsaW5rQgkKB2NvbnRlbnQ=');

@$core.Deprecated('Use imageParagraphDescriptor instead')
const ImageParagraph$json = {
  '1': 'ImageParagraph',
  '2': [
    {'1': 'thumb', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'thumb', '17': true},
    {'1': 'raw', '3': 2, '4': 1, '5': 9, '10': 'raw'},
  ],
  '8': [
    {'1': '_thumb'},
  ],
};

/// Descriptor for `ImageParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List imageParagraphDescriptor = $convert.base64Decode(
    'Cg5JbWFnZVBhcmFncmFwaBIZCgV0aHVtYhgBIAEoCUgAUgV0aHVtYogBARIQCgNyYXcYAiABKA'
    'lSA3Jhd0IICgZfdGh1bWI=');

@$core.Deprecated('Use videoParagraphDescriptor instead')
const VideoParagraph$json = {
  '1': 'VideoParagraph',
  '2': [
    {'1': 'thumb', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'thumb', '17': true},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
  '8': [
    {'1': '_thumb'},
  ],
};

/// Descriptor for `VideoParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List videoParagraphDescriptor = $convert.base64Decode(
    'Cg5WaWRlb1BhcmFncmFwaBIZCgV0aHVtYhgBIAEoCUgAUgV0aHVtYogBARIQCgN1cmwYAiABKA'
    'lSA3VybEIICgZfdGh1bWI=');

@$core.Deprecated('Use textParagraphDescriptor instead')
const TextParagraph$json = {
  '1': 'TextParagraph',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `TextParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List textParagraphDescriptor = $convert.base64Decode(
    'Cg1UZXh0UGFyYWdyYXBoEhgKB2NvbnRlbnQYASABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use newLineParagraphDescriptor instead')
const NewLineParagraph$json = {
  '1': 'NewLineParagraph',
  '2': [
    {'1': 'symbol', '3': 1, '4': 1, '5': 9, '10': 'symbol'},
  ],
};

/// Descriptor for `NewLineParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List newLineParagraphDescriptor = $convert.base64Decode(
    'ChBOZXdMaW5lUGFyYWdyYXBoEhYKBnN5bWJvbBgBIAEoCVIGc3ltYm9s');

@$core.Deprecated('Use quoteParagraphDescriptor instead')
const QuoteParagraph$json = {
  '1': 'QuoteParagraph',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `QuoteParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List quoteParagraphDescriptor = $convert.base64Decode(
    'Cg5RdW90ZVBhcmFncmFwaBIYCgdjb250ZW50GAEgASgJUgdjb250ZW50');

@$core.Deprecated('Use replyToParagraphDescriptor instead')
const ReplyToParagraph$json = {
  '1': 'ReplyToParagraph',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'author_name', '3': 3, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'preview', '3': 2, '4': 1, '5': 9, '10': 'preview'},
  ],
};

/// Descriptor for `ReplyToParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyToParagraphDescriptor = $convert.base64Decode(
    'ChBSZXBseVRvUGFyYWdyYXBoEg4KAmlkGAEgASgJUgJpZBIfCgthdXRob3JfbmFtZRgDIAEoCV'
    'IKYXV0aG9yTmFtZRIYCgdwcmV2aWV3GAIgASgJUgdwcmV2aWV3');

@$core.Deprecated('Use linkParagraphDescriptor instead')
const LinkParagraph$json = {
  '1': 'LinkParagraph',
  '2': [
    {'1': 'content', '3': 1, '4': 1, '5': 9, '10': 'content'},
  ],
};

/// Descriptor for `LinkParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkParagraphDescriptor = $convert.base64Decode(
    'Cg1MaW5rUGFyYWdyYXBoEhgKB2NvbnRlbnQYASABKAlSB2NvbnRlbnQ=');

@$core.Deprecated('Use postDescriptor instead')
const Post$json = {
  '1': 'Post',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 4, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 3, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 2, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'article_post', '3': 7, '4': 1, '5': 11, '6': '.pb.ArticlePost', '9': 0, '10': 'articlePost'},
    {'1': 'single_image_post', '3': 8, '4': 1, '5': 11, '6': '.pb.SingleImagePost', '9': 0, '10': 'singleImagePost'},
  ],
  '8': [
    {'1': 'content'},
  ],
};

/// Descriptor for `Post`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDescriptor = $convert.base64Decode(
    'CgRQb3N0EhkKCHBrZ19uYW1lGAYgASgJUgdwa2dOYW1lEhcKB3NpdGVfaWQYBCABKAlSBnNpdG'
    'VJZBIZCghib2FyZF9pZBgDIAEoCVIHYm9hcmRJZBIbCgl0aHJlYWRfaWQYAiABKAlSCHRocmVh'
    'ZElkEg4KAmlkGAEgASgJUgJpZBI0CgxhcnRpY2xlX3Bvc3QYByABKAsyDy5wYi5BcnRpY2xlUG'
    '9zdEgAUgthcnRpY2xlUG9zdBJBChFzaW5nbGVfaW1hZ2VfcG9zdBgIIAEoCzITLnBiLlNpbmds'
    'ZUltYWdlUG9zdEgAUg9zaW5nbGVJbWFnZVBvc3RCCQoHY29udGVudA==');

@$core.Deprecated('Use articlePostDescriptor instead')
const ArticlePost$json = {
  '1': 'ArticlePost',
  '2': [
    {'1': 'author_id', '3': 11, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_name', '3': 5, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'title', '3': 9, '4': 1, '5': 9, '10': 'title'},
    {'1': 'liked', '3': 12, '4': 1, '5': 5, '10': 'liked'},
    {'1': 'disliked', '3': 13, '4': 1, '5': 5, '10': 'disliked'},
    {'1': 'contents', '3': 17, '4': 3, '5': 11, '6': '.pb.Paragraph', '10': 'contents'},
    {'1': 'tags', '3': 18, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'latest_regarding_post_created_at', '3': 15, '4': 1, '5': 3, '10': 'latestRegardingPostCreatedAt'},
    {'1': 'regarding_posts_count', '3': 19, '4': 1, '5': 5, '10': 'regardingPostsCount'},
    {'1': 'url', '3': 20, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `ArticlePost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articlePostDescriptor = $convert.base64Decode(
    'CgtBcnRpY2xlUG9zdBIbCglhdXRob3JfaWQYCyABKAlSCGF1dGhvcklkEh8KC2F1dGhvcl9uYW'
    '1lGAUgASgJUgphdXRob3JOYW1lEh0KCmNyZWF0ZWRfYXQYByABKANSCWNyZWF0ZWRBdBIUCgV0'
    'aXRsZRgJIAEoCVIFdGl0bGUSFAoFbGlrZWQYDCABKAVSBWxpa2VkEhoKCGRpc2xpa2VkGA0gAS'
    'gFUghkaXNsaWtlZBIpCghjb250ZW50cxgRIAMoCzINLnBiLlBhcmFncmFwaFIIY29udGVudHMS'
    'EgoEdGFncxgSIAMoCVIEdGFncxJGCiBsYXRlc3RfcmVnYXJkaW5nX3Bvc3RfY3JlYXRlZF9hdB'
    'gPIAEoA1IcbGF0ZXN0UmVnYXJkaW5nUG9zdENyZWF0ZWRBdBIyChVyZWdhcmRpbmdfcG9zdHNf'
    'Y291bnQYEyABKAVSE3JlZ2FyZGluZ1Bvc3RzQ291bnQSEAoDdXJsGBQgASgJUgN1cmw=');

@$core.Deprecated('Use singleImagePostDescriptor instead')
const SingleImagePost$json = {
  '1': 'SingleImagePost',
  '2': [
    {'1': 'author_id', '3': 11, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_name', '3': 5, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'title', '3': 9, '4': 1, '5': 9, '10': 'title'},
    {'1': 'liked', '3': 12, '4': 1, '5': 5, '10': 'liked'},
    {'1': 'disliked', '3': 13, '4': 1, '5': 5, '10': 'disliked'},
    {'1': 'image', '3': 21, '4': 1, '5': 11, '6': '.pb.ImageParagraph', '10': 'image'},
    {'1': 'contents', '3': 17, '4': 3, '5': 11, '6': '.pb.Paragraph', '10': 'contents'},
    {'1': 'tags', '3': 18, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'latest_regarding_post_created_at', '3': 15, '4': 1, '5': 3, '10': 'latestRegardingPostCreatedAt'},
    {'1': 'regarding_posts_count', '3': 19, '4': 1, '5': 5, '10': 'regardingPostsCount'},
    {'1': 'url', '3': 20, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `SingleImagePost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleImagePostDescriptor = $convert.base64Decode(
    'Cg9TaW5nbGVJbWFnZVBvc3QSGwoJYXV0aG9yX2lkGAsgASgJUghhdXRob3JJZBIfCgthdXRob3'
    'JfbmFtZRgFIAEoCVIKYXV0aG9yTmFtZRIdCgpjcmVhdGVkX2F0GAcgASgDUgljcmVhdGVkQXQS'
    'FAoFdGl0bGUYCSABKAlSBXRpdGxlEhQKBWxpa2VkGAwgASgFUgVsaWtlZBIaCghkaXNsaWtlZB'
    'gNIAEoBVIIZGlzbGlrZWQSKAoFaW1hZ2UYFSABKAsyEi5wYi5JbWFnZVBhcmFncmFwaFIFaW1h'
    'Z2USKQoIY29udGVudHMYESADKAsyDS5wYi5QYXJhZ3JhcGhSCGNvbnRlbnRzEhIKBHRhZ3MYEi'
    'ADKAlSBHRhZ3MSRgogbGF0ZXN0X3JlZ2FyZGluZ19wb3N0X2NyZWF0ZWRfYXQYDyABKANSHGxh'
    'dGVzdFJlZ2FyZGluZ1Bvc3RDcmVhdGVkQXQSMgoVcmVnYXJkaW5nX3Bvc3RzX2NvdW50GBMgAS'
    'gFUhNyZWdhcmRpbmdQb3N0c0NvdW50EhAKA3VybBgUIAEoCVIDdXJs');

@$core.Deprecated('Use getCommentsReqDescriptor instead')
const GetCommentsReq$json = {
  '1': 'GetCommentsReq',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'post_id', '3': 4, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'page', '3': 5, '4': 1, '5': 11, '6': '.pb.PaginationReq', '9': 0, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_page'},
  ],
};

/// Descriptor for `GetCommentsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentsReqDescriptor = $convert.base64Decode(
    'Cg5HZXRDb21tZW50c1JlcRIZCghwa2dfbmFtZRgGIAEoCVIHcGtnTmFtZRIXCgdzaXRlX2lkGA'
    'EgASgJUgZzaXRlSWQSGQoIYm9hcmRfaWQYAiABKAlSB2JvYXJkSWQSGwoJdGhyZWFkX2lkGAMg'
    'ASgJUgh0aHJlYWRJZBIXCgdwb3N0X2lkGAQgASgJUgZwb3N0SWQSKgoEcGFnZRgFIAEoCzIRLn'
    'BiLlBhZ2luYXRpb25SZXFIAFIEcGFnZYgBAUIHCgVfcGFnZQ==');

@$core.Deprecated('Use getCommentsResDescriptor instead')
const GetCommentsRes$json = {
  '1': 'GetCommentsRes',
  '2': [
    {'1': 'comments', '3': 1, '4': 3, '5': 11, '6': '.pb.Comment', '10': 'comments'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetCommentsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentsResDescriptor = $convert.base64Decode(
    'Cg5HZXRDb21tZW50c1JlcxInCghjb21tZW50cxgBIAMoCzILLnBiLkNvbW1lbnRSCGNvbW1lbn'
    'RzEiUKBHBhZ2UYAiABKAsyES5wYi5QYWdpbmF0aW9uUmVzUgRwYWdl');

@$core.Deprecated('Use commentDescriptor instead')
const Comment$json = {
  '1': 'Comment',
  '2': [
    {'1': 'pkg_name', '3': 12, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'site_id', '3': 5, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 4, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'author_id', '3': 6, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_name', '3': 10, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'contents', '3': 11, '4': 3, '5': 11, '6': '.pb.Paragraph', '10': 'contents'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode(
    'CgdDb21tZW50EhkKCHBrZ19uYW1lGAwgASgJUgdwa2dOYW1lEhcKB3NpdGVfaWQYBSABKAlSBn'
    'NpdGVJZBIZCghib2FyZF9pZBgEIAEoCVIHYm9hcmRJZBIbCgl0aHJlYWRfaWQYAyABKAlSCHRo'
    'cmVhZElkEhcKB3Bvc3RfaWQYAiABKAlSBnBvc3RJZBIOCgJpZBgBIAEoCVICaWQSGwoJYXV0aG'
    '9yX2lkGAYgASgJUghhdXRob3JJZBIfCgthdXRob3JfbmFtZRgKIAEoCVIKYXV0aG9yTmFtZRIp'
    'Cghjb250ZW50cxgLIAMoCzINLnBiLlBhcmFncmFwaFIIY29udGVudHMSHQoKY3JlYXRlZF9hdB'
    'gIIAEoA1IJY3JlYXRlZEF0');

@$core.Deprecated('Use listInstalledExtensionsResDescriptor instead')
const ListInstalledExtensionsRes$json = {
  '1': 'ListInstalledExtensionsRes',
  '2': [
    {'1': 'extensions', '3': 1, '4': 3, '5': 11, '6': '.pb.Extension', '10': 'extensions'},
  ],
};

/// Descriptor for `ListInstalledExtensionsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInstalledExtensionsResDescriptor = $convert.base64Decode(
    'ChpMaXN0SW5zdGFsbGVkRXh0ZW5zaW9uc1JlcxItCgpleHRlbnNpb25zGAEgAygLMg0ucGIuRX'
    'h0ZW5zaW9uUgpleHRlbnNpb25z');

@$core.Deprecated('Use getInstalledExtensionReqDescriptor instead')
const GetInstalledExtensionReq$json = {
  '1': 'GetInstalledExtensionReq',
  '2': [
    {'1': 'pkg_name', '3': 1, '4': 1, '5': 9, '10': 'pkgName'},
  ],
};

/// Descriptor for `GetInstalledExtensionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstalledExtensionReqDescriptor = $convert.base64Decode(
    'ChhHZXRJbnN0YWxsZWRFeHRlbnNpb25SZXESGQoIcGtnX25hbWUYASABKAlSB3BrZ05hbWU=');

@$core.Deprecated('Use getInstalledExtensionResDescriptor instead')
const GetInstalledExtensionRes$json = {
  '1': 'GetInstalledExtensionRes',
  '2': [
    {'1': 'extension', '3': 1, '4': 1, '5': 11, '6': '.pb.Extension', '10': 'extension'},
  ],
};

/// Descriptor for `GetInstalledExtensionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstalledExtensionResDescriptor = $convert.base64Decode(
    'ChhHZXRJbnN0YWxsZWRFeHRlbnNpb25SZXMSKwoJZXh0ZW5zaW9uGAEgASgLMg0ucGIuRXh0ZW'
    '5zaW9uUglleHRlbnNpb24=');

@$core.Deprecated('Use installExtensionReqDescriptor instead')
const InstallExtensionReq$json = {
  '1': 'InstallExtensionReq',
  '2': [
    {'1': 'pkg_name', '3': 1, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'zip_name', '3': 2, '4': 1, '5': 9, '10': 'zipName'},
    {'1': 'repo_url', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'repoUrl', '17': true},
  ],
  '8': [
    {'1': '_repo_url'},
  ],
};

/// Descriptor for `InstallExtensionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List installExtensionReqDescriptor = $convert.base64Decode(
    'ChNJbnN0YWxsRXh0ZW5zaW9uUmVxEhkKCHBrZ19uYW1lGAEgASgJUgdwa2dOYW1lEhkKCHppcF'
    '9uYW1lGAIgASgJUgd6aXBOYW1lEh4KCHJlcG9fdXJsGAQgASgJSABSB3JlcG9VcmyIAQFCCwoJ'
    'X3JlcG9fdXJs');

@$core.Deprecated('Use uninstallExtensionReqDescriptor instead')
const UninstallExtensionReq$json = {
  '1': 'UninstallExtensionReq',
  '2': [
    {'1': 'pkg_name', '3': 1, '4': 1, '5': 9, '10': 'pkgName'},
  ],
};

/// Descriptor for `UninstallExtensionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List uninstallExtensionReqDescriptor = $convert.base64Decode(
    'ChVVbmluc3RhbGxFeHRlbnNpb25SZXESGQoIcGtnX25hbWUYASABKAlSB3BrZ05hbWU=');

@$core.Deprecated('Use getInstallProgressReqDescriptor instead')
const GetInstallProgressReq$json = {
  '1': 'GetInstallProgressReq',
  '2': [
    {'1': 'pkg_name', '3': 1, '4': 1, '5': 9, '10': 'pkgName'},
  ],
};

/// Descriptor for `GetInstallProgressReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstallProgressReqDescriptor = $convert.base64Decode(
    'ChVHZXRJbnN0YWxsUHJvZ3Jlc3NSZXESGQoIcGtnX25hbWUYASABKAlSB3BrZ05hbWU=');

@$core.Deprecated('Use getInstallProgressResDescriptor instead')
const GetInstallProgressRes$json = {
  '1': 'GetInstallProgressRes',
  '2': [
    {'1': 'sites', '3': 1, '4': 3, '5': 11, '6': '.pb.Site', '10': 'sites'},
  ],
};

/// Descriptor for `GetInstallProgressRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstallProgressResDescriptor = $convert.base64Decode(
    'ChVHZXRJbnN0YWxsUHJvZ3Jlc3NSZXMSHgoFc2l0ZXMYASADKAsyCC5wYi5TaXRlUgVzaXRlcw'
    '==');

@$core.Deprecated('Use listRemoteExtensionsReqDescriptor instead')
const ListRemoteExtensionsReq$json = {
  '1': 'ListRemoteExtensionsReq',
  '2': [
    {'1': 'keyword', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'keyword', '17': true},
  ],
  '8': [
    {'1': '_keyword'},
  ],
};

/// Descriptor for `ListRemoteExtensionsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRemoteExtensionsReqDescriptor = $convert.base64Decode(
    'ChdMaXN0UmVtb3RlRXh0ZW5zaW9uc1JlcRIdCgdrZXl3b3JkGAEgASgJSABSB2tleXdvcmSIAQ'
    'FCCgoIX2tleXdvcmQ=');

@$core.Deprecated('Use listRemoteExtensionsResDescriptor instead')
const ListRemoteExtensionsRes$json = {
  '1': 'ListRemoteExtensionsRes',
  '2': [
    {'1': 'extensions', '3': 1, '4': 3, '5': 11, '6': '.pb.RemoteExtension', '10': 'extensions'},
  ],
};

/// Descriptor for `ListRemoteExtensionsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRemoteExtensionsResDescriptor = $convert.base64Decode(
    'ChdMaXN0UmVtb3RlRXh0ZW5zaW9uc1JlcxIzCgpleHRlbnNpb25zGAEgAygLMhMucGIuUmVtb3'
    'RlRXh0ZW5zaW9uUgpleHRlbnNpb25z');

@$core.Deprecated('Use remoteExtensionDescriptor instead')
const RemoteExtension$json = {
  '1': 'RemoteExtension',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.pb.Extension', '10': 'base'},
    {'1': 'icon_url', '3': 2, '4': 1, '5': 9, '10': 'iconUrl'},
    {'1': 'repo_url', '3': 3, '4': 1, '5': 9, '10': 'repoUrl'},
  ],
};

/// Descriptor for `RemoteExtension`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteExtensionDescriptor = $convert.base64Decode(
    'Cg9SZW1vdGVFeHRlbnNpb24SIQoEYmFzZRgBIAEoCzINLnBiLkV4dGVuc2lvblIEYmFzZRIZCg'
    'hpY29uX3VybBgCIAEoCVIHaWNvblVybBIZCghyZXBvX3VybBgDIAEoCVIHcmVwb1VybA==');

@$core.Deprecated('Use extensionDescriptor instead')
const Extension$json = {
  '1': 'Extension',
  '2': [
    {'1': 'pkg_name', '3': 2, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'zip_name', '3': 4, '4': 1, '5': 9, '10': 'zipName'},
    {'1': 'version', '3': 5, '4': 1, '5': 5, '10': 'version'},
    {'1': 'python_version', '3': 6, '4': 1, '5': 5, '10': 'pythonVersion'},
    {'1': 'lang', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'lang', '17': true},
    {'1': 'is_nsfw', '3': 8, '4': 1, '5': 8, '10': 'isNsfw'},
    {'1': 'repo_url', '3': 9, '4': 1, '5': 9, '9': 1, '10': 'repoUrl', '17': true},
  ],
  '8': [
    {'1': '_lang'},
    {'1': '_repo_url'},
  ],
};

/// Descriptor for `Extension`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionDescriptor = $convert.base64Decode(
    'CglFeHRlbnNpb24SGQoIcGtnX25hbWUYAiABKAlSB3BrZ05hbWUSIQoMZGlzcGxheV9uYW1lGA'
    'MgASgJUgtkaXNwbGF5TmFtZRIZCgh6aXBfbmFtZRgEIAEoCVIHemlwTmFtZRIYCgd2ZXJzaW9u'
    'GAUgASgFUgd2ZXJzaW9uEiUKDnB5dGhvbl92ZXJzaW9uGAYgASgFUg1weXRob25WZXJzaW9uEh'
    'cKBGxhbmcYByABKAlIAFIEbGFuZ4gBARIXCgdpc19uc2Z3GAggASgIUgZpc05zZncSHgoIcmVw'
    'b191cmwYCSABKAlIAVIHcmVwb1VybIgBAUIHCgVfbGFuZ0ILCglfcmVwb191cmw=');

@$core.Deprecated('Use extensionRepoDescriptor instead')
const ExtensionRepo$json = {
  '1': 'ExtensionRepo',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'added_at', '3': 2, '4': 1, '5': 3, '10': 'addedAt'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'website', '3': 4, '4': 1, '5': 9, '10': 'website'},
    {'1': 'signing_key_fingerprint', '3': 5, '4': 1, '5': 9, '10': 'signingKeyFingerprint'},
    {'1': 'icon', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'icon', '17': true},
  ],
  '8': [
    {'1': '_icon'},
  ],
};

/// Descriptor for `ExtensionRepo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionRepoDescriptor = $convert.base64Decode(
    'Cg1FeHRlbnNpb25SZXBvEhAKA3VybBgBIAEoCVIDdXJsEhkKCGFkZGVkX2F0GAIgASgDUgdhZG'
    'RlZEF0EiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSGAoHd2Vic2l0ZRgEIAEo'
    'CVIHd2Vic2l0ZRI2ChdzaWduaW5nX2tleV9maW5nZXJwcmludBgFIAEoCVIVc2lnbmluZ0tleU'
    'ZpbmdlcnByaW50EhcKBGljb24YBiABKAlIAFIEaWNvbogBAUIHCgVfaWNvbg==');

@$core.Deprecated('Use addExtensionRepoReqDescriptor instead')
const AddExtensionRepoReq$json = {
  '1': 'AddExtensionRepoReq',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'display_name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'displayName', '17': true},
  ],
  '8': [
    {'1': '_display_name'},
  ],
};

/// Descriptor for `AddExtensionRepoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addExtensionRepoReqDescriptor = $convert.base64Decode(
    'ChNBZGRFeHRlbnNpb25SZXBvUmVxEhAKA3VybBgBIAEoCVIDdXJsEiYKDGRpc3BsYXlfbmFtZR'
    'gCIAEoCUgAUgtkaXNwbGF5TmFtZYgBAUIPCg1fZGlzcGxheV9uYW1l');

@$core.Deprecated('Use addExtensionRepoResDescriptor instead')
const AddExtensionRepoRes$json = {
  '1': 'AddExtensionRepoRes',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
    {'1': 'added_at', '3': 2, '4': 1, '5': 3, '10': 'addedAt'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'website', '3': 4, '4': 1, '5': 9, '10': 'website'},
    {'1': 'signing_key_fingerprint', '3': 5, '4': 1, '5': 9, '10': 'signingKeyFingerprint'},
    {'1': 'icon', '3': 6, '4': 1, '5': 9, '9': 0, '10': 'icon', '17': true},
  ],
  '8': [
    {'1': '_icon'},
  ],
};

/// Descriptor for `AddExtensionRepoRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addExtensionRepoResDescriptor = $convert.base64Decode(
    'ChNBZGRFeHRlbnNpb25SZXBvUmVzEhAKA3VybBgBIAEoCVIDdXJsEhkKCGFkZGVkX2F0GAIgAS'
    'gDUgdhZGRlZEF0EiEKDGRpc3BsYXlfbmFtZRgDIAEoCVILZGlzcGxheU5hbWUSGAoHd2Vic2l0'
    'ZRgEIAEoCVIHd2Vic2l0ZRI2ChdzaWduaW5nX2tleV9maW5nZXJwcmludBgFIAEoCVIVc2lnbm'
    'luZ0tleUZpbmdlcnByaW50EhcKBGljb24YBiABKAlIAFIEaWNvbogBAUIHCgVfaWNvbg==');

@$core.Deprecated('Use removeExtensionRepoReqDescriptor instead')
const RemoveExtensionRepoReq$json = {
  '1': 'RemoveExtensionRepoReq',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `RemoveExtensionRepoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeExtensionRepoReqDescriptor = $convert.base64Decode(
    'ChZSZW1vdmVFeHRlbnNpb25SZXBvUmVxEhAKA3VybBgBIAEoCVIDdXJs');

@$core.Deprecated('Use listExtensionReposResDescriptor instead')
const ListExtensionReposRes$json = {
  '1': 'ListExtensionReposRes',
  '2': [
    {'1': 'repos', '3': 1, '4': 3, '5': 11, '6': '.pb.ExtensionRepo', '10': 'repos'},
  ],
};

/// Descriptor for `ListExtensionReposRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listExtensionReposResDescriptor = $convert.base64Decode(
    'ChVMaXN0RXh0ZW5zaW9uUmVwb3NSZXMSJwoFcmVwb3MYASADKAsyES5wYi5FeHRlbnNpb25SZX'
    'BvUgVyZXBvcw==');

@$core.Deprecated('Use healthCheckReqDescriptor instead')
const HealthCheckReq$json = {
  '1': 'HealthCheckReq',
  '2': [
    {'1': 'service', '3': 1, '4': 1, '5': 9, '10': 'service'},
  ],
};

/// Descriptor for `HealthCheckReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckReqDescriptor = $convert.base64Decode(
    'Cg5IZWFsdGhDaGVja1JlcRIYCgdzZXJ2aWNlGAEgASgJUgdzZXJ2aWNl');

@$core.Deprecated('Use healthCheckResDescriptor instead')
const HealthCheckRes$json = {
  '1': 'HealthCheckRes',
  '2': [
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.pb.HealthCheckRes.ServingStatus', '10': 'status'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'message', '17': true},
  ],
  '4': [HealthCheckRes_ServingStatus$json],
  '8': [
    {'1': '_message'},
  ],
};

@$core.Deprecated('Use healthCheckResDescriptor instead')
const HealthCheckRes_ServingStatus$json = {
  '1': 'ServingStatus',
  '2': [
    {'1': 'UNKNOWN', '2': 0},
    {'1': 'SERVING', '2': 1},
    {'1': 'NOT_SERVING', '2': 2},
    {'1': 'SERVICE_UNKNOWN', '2': 3},
  ],
};

/// Descriptor for `HealthCheckRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List healthCheckResDescriptor = $convert.base64Decode(
    'Cg5IZWFsdGhDaGVja1JlcxI4CgZzdGF0dXMYASABKA4yIC5wYi5IZWFsdGhDaGVja1Jlcy5TZX'
    'J2aW5nU3RhdHVzUgZzdGF0dXMSHQoHbWVzc2FnZRgCIAEoCUgAUgdtZXNzYWdliAEBIk8KDVNl'
    'cnZpbmdTdGF0dXMSCwoHVU5LTk9XThAAEgsKB1NFUlZJTkcQARIPCgtOT1RfU0VSVklORxACEh'
    'MKD1NFUlZJQ0VfVU5LTk9XThADQgoKCF9tZXNzYWdl');

@$core.Deprecated('Use logEntryDescriptor instead')
const LogEntry$json = {
  '1': 'LogEntry',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'level', '3': 2, '4': 1, '5': 14, '6': '.pb.LogLevel', '10': 'level'},
    {'1': 'logger_name', '3': 3, '4': 1, '5': 9, '10': 'loggerName'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
    {'1': 'exception', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'exception', '17': true},
  ],
  '8': [
    {'1': '_exception'},
  ],
};

/// Descriptor for `LogEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List logEntryDescriptor = $convert.base64Decode(
    'CghMb2dFbnRyeRIcCgl0aW1lc3RhbXAYASABKANSCXRpbWVzdGFtcBIiCgVsZXZlbBgCIAEoDj'
    'IMLnBiLkxvZ0xldmVsUgVsZXZlbBIfCgtsb2dnZXJfbmFtZRgDIAEoCVIKbG9nZ2VyTmFtZRIY'
    'CgdtZXNzYWdlGAQgASgJUgdtZXNzYWdlEiEKCWV4Y2VwdGlvbhgFIAEoCUgAUglleGNlcHRpb2'
    '6IAQFCDAoKX2V4Y2VwdGlvbg==');

@$core.Deprecated('Use watchLogsReqDescriptor instead')
const WatchLogsReq$json = {
  '1': 'WatchLogsReq',
  '2': [
    {'1': 'min_level', '3': 1, '4': 1, '5': 14, '6': '.pb.LogLevel', '10': 'minLevel'},
    {'1': 'logger_filter', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'loggerFilter', '17': true},
  ],
  '8': [
    {'1': '_logger_filter'},
  ],
};

/// Descriptor for `WatchLogsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchLogsReqDescriptor = $convert.base64Decode(
    'CgxXYXRjaExvZ3NSZXESKQoJbWluX2xldmVsGAEgASgOMgwucGIuTG9nTGV2ZWxSCG1pbkxldm'
    'VsEigKDWxvZ2dlcl9maWx0ZXIYAiABKAlIAFIMbG9nZ2VyRmlsdGVyiAEBQhAKDl9sb2dnZXJf'
    'ZmlsdGVy');

@$core.Deprecated('Use getLogsReqDescriptor instead')
const GetLogsReq$json = {
  '1': 'GetLogsReq',
  '2': [
    {'1': 'start_time', '3': 1, '4': 1, '5': 3, '10': 'startTime'},
    {'1': 'end_time', '3': 2, '4': 1, '5': 3, '10': 'endTime'},
    {'1': 'min_level', '3': 3, '4': 1, '5': 14, '6': '.pb.LogLevel', '10': 'minLevel'},
    {'1': 'logger_filter', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'loggerFilter', '17': true},
    {'1': 'limit', '3': 5, '4': 1, '5': 5, '9': 1, '10': 'limit', '17': true},
  ],
  '8': [
    {'1': '_logger_filter'},
    {'1': '_limit'},
  ],
};

/// Descriptor for `GetLogsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLogsReqDescriptor = $convert.base64Decode(
    'CgpHZXRMb2dzUmVxEh0KCnN0YXJ0X3RpbWUYASABKANSCXN0YXJ0VGltZRIZCghlbmRfdGltZR'
    'gCIAEoA1IHZW5kVGltZRIpCgltaW5fbGV2ZWwYAyABKA4yDC5wYi5Mb2dMZXZlbFIIbWluTGV2'
    'ZWwSKAoNbG9nZ2VyX2ZpbHRlchgEIAEoCUgAUgxsb2dnZXJGaWx0ZXKIAQESGQoFbGltaXQYBS'
    'ABKAVIAVIFbGltaXSIAQFCEAoOX2xvZ2dlcl9maWx0ZXJCCAoGX2xpbWl0');

@$core.Deprecated('Use getLogsResDescriptor instead')
const GetLogsRes$json = {
  '1': 'GetLogsRes',
  '2': [
    {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.pb.LogEntry', '10': 'entries'},
  ],
};

/// Descriptor for `GetLogsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLogsResDescriptor = $convert.base64Decode(
    'CgpHZXRMb2dzUmVzEiYKB2VudHJpZXMYASADKAsyDC5wYi5Mb2dFbnRyeVIHZW50cmllcw==');

@$core.Deprecated('Use setLogLevelReqDescriptor instead')
const SetLogLevelReq$json = {
  '1': 'SetLogLevelReq',
  '2': [
    {'1': 'level', '3': 1, '4': 1, '5': 14, '6': '.pb.LogLevel', '10': 'level'},
  ],
};

/// Descriptor for `SetLogLevelReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setLogLevelReqDescriptor = $convert.base64Decode(
    'Cg5TZXRMb2dMZXZlbFJlcRIiCgVsZXZlbBgBIAEoDjIMLnBiLkxvZ0xldmVsUgVsZXZlbA==');

