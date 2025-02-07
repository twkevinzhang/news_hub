//
//  Generated code. Do not modify.
//  source: extension_api.proto
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
    {'1': 'PARAGRAPH_TYPE_IMAGE', '2': 4},
    {'1': 'PARAGRAPH_TYPE_LINK', '2': 5},
    {'1': 'PARAGRAPH_TYPE_VIDEO', '2': 6},
  ],
};

/// Descriptor for `ParagraphType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paragraphTypeDescriptor = $convert.base64Decode(
    'Cg1QYXJhZ3JhcGhUeXBlEh4KGlBBUkFHUkFQSF9UWVBFX1VOU1BFQ0lGSUVEEAASGAoUUEFSQU'
    'dSQVBIX1RZUEVfUVVPVEUQARIbChdQQVJBR1JBUEhfVFlQRV9SRVBMWV9UTxACEhcKE1BBUkFH'
    'UkFQSF9UWVBFX1RFWFQQAxIYChRQQVJBR1JBUEhfVFlQRV9JTUFHRRAEEhcKE1BBUkFHUkFQSF'
    '9UWVBFX0xJTksQBRIYChRQQVJBR1JBUEhfVFlQRV9WSURFTxAG');

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
    {'1': 'id', '3': 4, '4': 1, '5': 9, '10': 'id'},
    {'1': 'icon', '3': 5, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'url', '3': 3, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Site`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List siteDescriptor = $convert.base64Decode(
    'CgRTaXRlEg4KAmlkGAQgASgJUgJpZBISCgRpY29uGAUgASgJUgRpY29uEhIKBG5hbWUYASABKA'
    'lSBG5hbWUSIAoLZGVzY3JpcHRpb24YAiABKAlSC2Rlc2NyaXB0aW9uEhAKA3VybBgDIAEoCVID'
    'dXJs');

@$core.Deprecated('Use getBoardsReqDescriptor instead')
const GetBoardsReq$json = {
  '1': 'GetBoardsReq',
  '2': [
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationReq', '9': 0, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_page'},
  ],
};

/// Descriptor for `GetBoardsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBoardsReqDescriptor = $convert.base64Decode(
    'CgxHZXRCb2FyZHNSZXESFwoHc2l0ZV9pZBgBIAEoCVIGc2l0ZUlkEioKBHBhZ2UYAiABKAsyES'
    '5wYi5QYWdpbmF0aW9uUmVxSABSBHBhZ2WIAQFCBwoFX3BhZ2U=');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'site_id', '3': 2, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'large_welcome_image', '3': 5, '4': 1, '5': 9, '10': 'largeWelcomeImage'},
    {'1': 'url', '3': 6, '4': 1, '5': 9, '10': 'url'},
    {'1': 'supported_threads_sorting', '3': 7, '4': 3, '5': 9, '10': 'supportedThreadsSorting'},
  ],
};

/// Descriptor for `Board`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boardDescriptor = $convert.base64Decode(
    'CgVCb2FyZBIOCgJpZBgBIAEoCVICaWQSFwoHc2l0ZV9pZBgCIAEoCVIGc2l0ZUlkEhIKBG5hbW'
    'UYAyABKAlSBG5hbWUSEgoEaWNvbhgEIAEoCVIEaWNvbhIuChNsYXJnZV93ZWxjb21lX2ltYWdl'
    'GAUgASgJUhFsYXJnZVdlbGNvbWVJbWFnZRIQCgN1cmwYBiABKAlSA3VybBI6ChlzdXBwb3J0ZW'
    'RfdGhyZWFkc19zb3J0aW5nGAcgAygJUhdzdXBwb3J0ZWRUaHJlYWRzU29ydGluZw==');

@$core.Deprecated('Use getThreadInfosReqDescriptor instead')
const GetThreadInfosReq$json = {
  '1': 'GetThreadInfosReq',
  '2': [
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'page', '3': 3, '4': 1, '5': 11, '6': '.pb.PaginationReq', '9': 0, '10': 'page', '17': true},
    {'1': 'sort_by', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'sortBy', '17': true},
    {'1': 'keywords', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'keywords', '17': true},
  ],
  '8': [
    {'1': '_page'},
    {'1': '_sort_by'},
    {'1': '_keywords'},
  ],
};

/// Descriptor for `GetThreadInfosReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadInfosReqDescriptor = $convert.base64Decode(
    'ChFHZXRUaHJlYWRJbmZvc1JlcRIXCgdzaXRlX2lkGAEgASgJUgZzaXRlSWQSGQoIYm9hcmRfaW'
    'QYAiABKAlSB2JvYXJkSWQSKgoEcGFnZRgDIAEoCzIRLnBiLlBhZ2luYXRpb25SZXFIAFIEcGFn'
    'ZYgBARIcCgdzb3J0X2J5GAQgASgJSAFSBnNvcnRCeYgBARIfCghrZXl3b3JkcxgFIAEoCUgCUg'
    'hrZXl3b3Jkc4gBAUIHCgVfcGFnZUIKCghfc29ydF9ieUILCglfa2V5d29yZHM=');

@$core.Deprecated('Use getThreadInfosResDescriptor instead')
const GetThreadInfosRes$json = {
  '1': 'GetThreadInfosRes',
  '2': [
    {'1': 'threadInfos', '3': 1, '4': 3, '5': 11, '6': '.pb.ThreadInfo', '10': 'threadInfos'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.pb.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetThreadInfosRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadInfosResDescriptor = $convert.base64Decode(
    'ChFHZXRUaHJlYWRJbmZvc1JlcxIwCgt0aHJlYWRJbmZvcxgBIAMoCzIOLnBiLlRocmVhZEluZm'
    '9SC3RocmVhZEluZm9zEiUKBHBhZ2UYAiABKAsyES5wYi5QYWdpbmF0aW9uUmVzUgRwYWdl');

@$core.Deprecated('Use threadInfoDescriptor instead')
const ThreadInfo$json = {
  '1': 'ThreadInfo',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'board_id', '3': 4, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'site_id', '3': 5, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'url', '3': 11, '4': 1, '5': 9, '10': 'url'},
    {'1': 'title', '3': 2, '4': 1, '5': 9, '10': 'title'},
    {'1': 'author_name', '3': 3, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'created_at', '3': 6, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'latest_regarding_post_created_at', '3': 7, '4': 1, '5': 3, '10': 'latestRegardingPostCreatedAt'},
    {'1': 'regarding_post_count', '3': 8, '4': 1, '5': 5, '10': 'regardingPostCount'},
    {'1': 'preview_content', '3': 9, '4': 1, '5': 9, '10': 'previewContent'},
    {'1': 'tags', '3': 10, '4': 3, '5': 9, '10': 'tags'},
  ],
};

/// Descriptor for `ThreadInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List threadInfoDescriptor = $convert.base64Decode(
    'CgpUaHJlYWRJbmZvEg4KAmlkGAEgASgJUgJpZBIZCghib2FyZF9pZBgEIAEoCVIHYm9hcmRJZB'
    'IXCgdzaXRlX2lkGAUgASgJUgZzaXRlSWQSEAoDdXJsGAsgASgJUgN1cmwSFAoFdGl0bGUYAiAB'
    'KAlSBXRpdGxlEh8KC2F1dGhvcl9uYW1lGAMgASgJUgphdXRob3JOYW1lEh0KCmNyZWF0ZWRfYX'
    'QYBiABKANSCWNyZWF0ZWRBdBJGCiBsYXRlc3RfcmVnYXJkaW5nX3Bvc3RfY3JlYXRlZF9hdBgH'
    'IAEoA1IcbGF0ZXN0UmVnYXJkaW5nUG9zdENyZWF0ZWRBdBIwChRyZWdhcmRpbmdfcG9zdF9jb3'
    'VudBgIIAEoBVIScmVnYXJkaW5nUG9zdENvdW50EicKD3ByZXZpZXdfY29udGVudBgJIAEoCVIO'
    'cHJldmlld0NvbnRlbnQSEgoEdGFncxgKIAMoCVIEdGFncw==');

@$core.Deprecated('Use getThreadReqDescriptor instead')
const GetThreadReq$json = {
  '1': 'GetThreadReq',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'site_id', '3': 2, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 3, '4': 1, '5': 9, '10': 'boardId'},
  ],
};

/// Descriptor for `GetThreadReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadReqDescriptor = $convert.base64Decode(
    'CgxHZXRUaHJlYWRSZXESDgoCaWQYASABKAlSAmlkEhcKB3NpdGVfaWQYAiABKAlSBnNpdGVJZB'
    'IZCghib2FyZF9pZBgDIAEoCVIHYm9hcmRJZA==');

@$core.Deprecated('Use getThreadResDescriptor instead')
const GetThreadRes$json = {
  '1': 'GetThreadRes',
  '2': [
    {'1': 'thread', '3': 1, '4': 1, '5': 11, '6': '.pb.Thread', '10': 'thread'},
  ],
};

/// Descriptor for `GetThreadRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadResDescriptor = $convert.base64Decode(
    'CgxHZXRUaHJlYWRSZXMSIgoGdGhyZWFkGAEgASgLMgoucGIuVGhyZWFkUgZ0aHJlYWQ=');

@$core.Deprecated('Use threadDescriptor instead')
const Thread$json = {
  '1': 'Thread',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'site_id', '3': 2, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 3, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'url', '3': 8, '4': 1, '5': 9, '10': 'url'},
    {'1': 'latest_regarding_post_created_at', '3': 4, '4': 1, '5': 3, '10': 'latestRegardingPostCreatedAt'},
    {'1': 'regarding_post_count', '3': 5, '4': 1, '5': 5, '10': 'regardingPostCount'},
    {'1': 'tags', '3': 6, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'original_post', '3': 7, '4': 1, '5': 11, '6': '.pb.Post', '10': 'originalPost'},
  ],
};

/// Descriptor for `Thread`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List threadDescriptor = $convert.base64Decode(
    'CgZUaHJlYWQSDgoCaWQYASABKAlSAmlkEhcKB3NpdGVfaWQYAiABKAlSBnNpdGVJZBIZCghib2'
    'FyZF9pZBgDIAEoCVIHYm9hcmRJZBIQCgN1cmwYCCABKAlSA3VybBJGCiBsYXRlc3RfcmVnYXJk'
    'aW5nX3Bvc3RfY3JlYXRlZF9hdBgEIAEoA1IcbGF0ZXN0UmVnYXJkaW5nUG9zdENyZWF0ZWRBdB'
    'IwChRyZWdhcmRpbmdfcG9zdF9jb3VudBgFIAEoBVIScmVnYXJkaW5nUG9zdENvdW50EhIKBHRh'
    'Z3MYBiADKAlSBHRhZ3MSLQoNb3JpZ2luYWxfcG9zdBgHIAEoCzIILnBiLlBvc3RSDG9yaWdpbm'
    'FsUG9zdA==');

@$core.Deprecated('Use getRegardingPostsReqDescriptor instead')
const GetRegardingPostsReq$json = {
  '1': 'GetRegardingPostsReq',
  '2': [
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'original_post_id', '3': 5, '4': 1, '5': 9, '10': 'originalPostId'},
    {'1': 'page', '3': 4, '4': 1, '5': 11, '6': '.pb.PaginationReq', '9': 0, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_page'},
  ],
};

/// Descriptor for `GetRegardingPostsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRegardingPostsReqDescriptor = $convert.base64Decode(
    'ChRHZXRSZWdhcmRpbmdQb3N0c1JlcRIXCgdzaXRlX2lkGAEgASgJUgZzaXRlSWQSGQoIYm9hcm'
    'RfaWQYAiABKAlSB2JvYXJkSWQSGwoJdGhyZWFkX2lkGAMgASgJUgh0aHJlYWRJZBIoChBvcmln'
    'aW5hbF9wb3N0X2lkGAUgASgJUg5vcmlnaW5hbFBvc3RJZBIqCgRwYWdlGAQgASgLMhEucGIuUG'
    'FnaW5hdGlvblJlcUgAUgRwYWdliAEBQgcKBV9wYWdl');

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

@$core.Deprecated('Use getPostReqDescriptor instead')
const GetPostReq$json = {
  '1': 'GetPostReq',
  '2': [
    {'1': 'site_id', '3': 1, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'id', '3': 4, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `GetPostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostReqDescriptor = $convert.base64Decode(
    'CgpHZXRQb3N0UmVxEhcKB3NpdGVfaWQYASABKAlSBnNpdGVJZBIZCghib2FyZF9pZBgCIAEoCV'
    'IHYm9hcmRJZBIbCgl0aHJlYWRfaWQYAyABKAlSCHRocmVhZElkEg4KAmlkGAQgASgJUgJpZA==');

@$core.Deprecated('Use getPostResDescriptor instead')
const GetPostRes$json = {
  '1': 'GetPostRes',
  '2': [
    {'1': 'post', '3': 1, '4': 1, '5': 11, '6': '.pb.Post', '10': 'post'},
  ],
};

/// Descriptor for `GetPostRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPostResDescriptor = $convert.base64Decode(
    'CgpHZXRQb3N0UmVzEhwKBHBvc3QYASABKAsyCC5wYi5Qb3N0UgRwb3N0');

@$core.Deprecated('Use paragraphDescriptor instead')
const Paragraph$json = {
  '1': 'Paragraph',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.pb.ParagraphType', '10': 'type'},
    {'1': 'image', '3': 2, '4': 1, '5': 11, '6': '.pb.ImageParagraph', '9': 0, '10': 'image'},
    {'1': 'video', '3': 3, '4': 1, '5': 11, '6': '.pb.VideoParagraph', '9': 0, '10': 'video'},
    {'1': 'text', '3': 4, '4': 1, '5': 11, '6': '.pb.TextParagraph', '9': 0, '10': 'text'},
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
    'dyYXBoSABSBHRleHQSKgoFcXVvdGUYBSABKAsyEi5wYi5RdW90ZVBhcmFncmFwaEgAUgVxdW90'
    'ZRIxCghyZXBseV90bxgGIAEoCzIULnBiLlJlcGx5VG9QYXJhZ3JhcGhIAFIHcmVwbHlUbxInCg'
    'RsaW5rGAcgASgLMhEucGIuTGlua1BhcmFncmFwaEgAUgRsaW5rQgkKB2NvbnRlbnQ=');

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
  ],
};

/// Descriptor for `ReplyToParagraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List replyToParagraphDescriptor = $convert.base64Decode(
    'ChBSZXBseVRvUGFyYWdyYXBoEg4KAmlkGAEgASgJUgJpZA==');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'origin_post_id', '3': 10, '4': 1, '5': 9, '9': 0, '10': 'originPostId', '17': true},
    {'1': 'thread_id', '3': 2, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'board_id', '3': 3, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'site_id', '3': 4, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'authorId', '3': 11, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_name', '3': 5, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'content', '3': 6, '4': 1, '5': 9, '10': 'content'},
    {'1': 'created_at', '3': 7, '4': 1, '5': 3, '10': 'createdAt'},
    {'1': 'title', '3': 9, '4': 1, '5': 9, '10': 'title'},
    {'1': 'like', '3': 12, '4': 1, '5': 5, '10': 'like'},
    {'1': 'dislike', '3': 13, '4': 1, '5': 5, '10': 'dislike'},
    {'1': 'comments', '3': 14, '4': 1, '5': 5, '10': 'comments'},
    {'1': 'contents', '3': 15, '4': 3, '5': 11, '6': '.pb.Paragraph', '10': 'contents'},
  ],
  '8': [
    {'1': '_origin_post_id'},
  ],
};

/// Descriptor for `Post`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDescriptor = $convert.base64Decode(
    'CgRQb3N0Eg4KAmlkGAEgASgJUgJpZBIpCg5vcmlnaW5fcG9zdF9pZBgKIAEoCUgAUgxvcmlnaW'
    '5Qb3N0SWSIAQESGwoJdGhyZWFkX2lkGAIgASgJUgh0aHJlYWRJZBIZCghib2FyZF9pZBgDIAEo'
    'CVIHYm9hcmRJZBIXCgdzaXRlX2lkGAQgASgJUgZzaXRlSWQSGgoIYXV0aG9ySWQYCyABKAlSCG'
    'F1dGhvcklkEh8KC2F1dGhvcl9uYW1lGAUgASgJUgphdXRob3JOYW1lEhgKB2NvbnRlbnQYBiAB'
    'KAlSB2NvbnRlbnQSHQoKY3JlYXRlZF9hdBgHIAEoA1IJY3JlYXRlZEF0EhQKBXRpdGxlGAkgAS'
    'gJUgV0aXRsZRISCgRsaWtlGAwgASgFUgRsaWtlEhgKB2Rpc2xpa2UYDSABKAVSB2Rpc2xpa2US'
    'GgoIY29tbWVudHMYDiABKAVSCGNvbW1lbnRzEikKCGNvbnRlbnRzGA8gAygLMg0ucGIuUGFyYW'
    'dyYXBoUghjb250ZW50c0IRCg9fb3JpZ2luX3Bvc3RfaWQ=');

@$core.Deprecated('Use getCommentsReqDescriptor instead')
const GetCommentsReq$json = {
  '1': 'GetCommentsReq',
  '2': [
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
    'Cg5HZXRDb21tZW50c1JlcRIXCgdzaXRlX2lkGAEgASgJUgZzaXRlSWQSGQoIYm9hcmRfaWQYAi'
    'ABKAlSB2JvYXJkSWQSGwoJdGhyZWFkX2lkGAMgASgJUgh0aHJlYWRJZBIXCgdwb3N0X2lkGAQg'
    'ASgJUgZwb3N0SWQSKgoEcGFnZRgFIAEoCzIRLnBiLlBhZ2luYXRpb25SZXFIAFIEcGFnZYgBAU'
    'IHCgVfcGFnZQ==');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'board_id', '3': 4, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'site_id', '3': 5, '4': 1, '5': 9, '10': 'siteId'},
    {'1': 'author_id', '3': 6, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_name', '3': 10, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'contents', '3': 11, '4': 3, '5': 11, '6': '.pb.Paragraph', '10': 'contents'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 3, '10': 'createdAt'},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode(
    'CgdDb21tZW50Eg4KAmlkGAEgASgJUgJpZBIXCgdwb3N0X2lkGAIgASgJUgZwb3N0SWQSGwoJdG'
    'hyZWFkX2lkGAMgASgJUgh0aHJlYWRJZBIZCghib2FyZF9pZBgEIAEoCVIHYm9hcmRJZBIXCgdz'
    'aXRlX2lkGAUgASgJUgZzaXRlSWQSGwoJYXV0aG9yX2lkGAYgASgJUghhdXRob3JJZBIfCgthdX'
    'Rob3JfbmFtZRgKIAEoCVIKYXV0aG9yTmFtZRIpCghjb250ZW50cxgLIAMoCzINLnBiLlBhcmFn'
    'cmFwaFIIY29udGVudHMSHQoKY3JlYXRlZF9hdBgIIAEoA1IJY3JlYXRlZEF0');

