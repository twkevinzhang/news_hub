//
//  Generated code. Do not modify.
//  source: domain_models.proto
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

@$core.Deprecated('Use boardDescriptor instead')
const Board$json = {
  '1': 'Board',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {'1': 'icon', '3': 4, '4': 1, '5': 9, '10': 'icon'},
    {'1': 'large_welcome_image', '3': 5, '4': 1, '5': 9, '10': 'largeWelcomeImage'},
    {'1': 'url', '3': 6, '4': 1, '5': 9, '10': 'url'},
    {'1': 'supported_threads_sorting', '3': 7, '4': 3, '5': 9, '10': 'supportedThreadsSorting'},
    {'1': 'pkg_name', '3': 8, '4': 1, '5': 9, '10': 'pkgName'},
  ],
  '9': [
    {'1': 2, '2': 3},
  ],
};

/// Descriptor for `Board`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boardDescriptor = $convert.base64Decode(
    'CgVCb2FyZBIOCgJpZBgBIAEoCVICaWQSEgoEbmFtZRgDIAEoCVIEbmFtZRISCgRpY29uGAQgAS'
    'gJUgRpY29uEi4KE2xhcmdlX3dlbGNvbWVfaW1hZ2UYBSABKAlSEWxhcmdlV2VsY29tZUltYWdl'
    'EhAKA3VybBgGIAEoCVIDdXJsEjoKGXN1cHBvcnRlZF90aHJlYWRzX3NvcnRpbmcYByADKAlSF3'
    'N1cHBvcnRlZFRocmVhZHNTb3J0aW5nEhkKCHBrZ19uYW1lGAggASgJUgdwa2dOYW1lSgQIAhAD');

@$core.Deprecated('Use paragraphDescriptor instead')
const Paragraph$json = {
  '1': 'Paragraph',
  '2': [
    {'1': 'type', '3': 1, '4': 1, '5': 14, '6': '.news_hub.domain.ParagraphType', '10': 'type'},
    {'1': 'image', '3': 2, '4': 1, '5': 11, '6': '.news_hub.domain.ImageParagraph', '9': 0, '10': 'image'},
    {'1': 'video', '3': 3, '4': 1, '5': 11, '6': '.news_hub.domain.VideoParagraph', '9': 0, '10': 'video'},
    {'1': 'text', '3': 4, '4': 1, '5': 11, '6': '.news_hub.domain.TextParagraph', '9': 0, '10': 'text'},
    {'1': 'new_line', '3': 8, '4': 1, '5': 11, '6': '.news_hub.domain.NewLineParagraph', '9': 0, '10': 'newLine'},
    {'1': 'quote', '3': 5, '4': 1, '5': 11, '6': '.news_hub.domain.QuoteParagraph', '9': 0, '10': 'quote'},
    {'1': 'reply_to', '3': 6, '4': 1, '5': 11, '6': '.news_hub.domain.ReplyToParagraph', '9': 0, '10': 'replyTo'},
    {'1': 'link', '3': 7, '4': 1, '5': 11, '6': '.news_hub.domain.LinkParagraph', '9': 0, '10': 'link'},
  ],
  '8': [
    {'1': 'content'},
  ],
};

/// Descriptor for `Paragraph`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paragraphDescriptor = $convert.base64Decode(
    'CglQYXJhZ3JhcGgSMgoEdHlwZRgBIAEoDjIeLm5ld3NfaHViLmRvbWFpbi5QYXJhZ3JhcGhUeX'
    'BlUgR0eXBlEjcKBWltYWdlGAIgASgLMh8ubmV3c19odWIuZG9tYWluLkltYWdlUGFyYWdyYXBo'
    'SABSBWltYWdlEjcKBXZpZGVvGAMgASgLMh8ubmV3c19odWIuZG9tYWluLlZpZGVvUGFyYWdyYX'
    'BoSABSBXZpZGVvEjQKBHRleHQYBCABKAsyHi5uZXdzX2h1Yi5kb21haW4uVGV4dFBhcmFncmFw'
    'aEgAUgR0ZXh0Ej4KCG5ld19saW5lGAggASgLMiEubmV3c19odWIuZG9tYWluLk5ld0xpbmVQYX'
    'JhZ3JhcGhIAFIHbmV3TGluZRI3CgVxdW90ZRgFIAEoCzIfLm5ld3NfaHViLmRvbWFpbi5RdW90'
    'ZVBhcmFncmFwaEgAUgVxdW90ZRI+CghyZXBseV90bxgGIAEoCzIhLm5ld3NfaHViLmRvbWFpbi'
    '5SZXBseVRvUGFyYWdyYXBoSABSB3JlcGx5VG8SNAoEbGluaxgHIAEoCzIeLm5ld3NfaHViLmRv'
    'bWFpbi5MaW5rUGFyYWdyYXBoSABSBGxpbmtCCQoHY29udGVudA==');

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
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'thread_id', '3': 2, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'board_id', '3': 3, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'article_post', '3': 7, '4': 1, '5': 11, '6': '.news_hub.domain.ArticlePost', '9': 0, '10': 'articlePost'},
    {'1': 'single_image_post', '3': 8, '4': 1, '5': 11, '6': '.news_hub.domain.SingleImagePost', '9': 0, '10': 'singleImagePost'},
  ],
  '8': [
    {'1': 'content'},
  ],
  '9': [
    {'1': 4, '2': 5},
    {'1': 5, '2': 6},
  ],
};

/// Descriptor for `Post`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postDescriptor = $convert.base64Decode(
    'CgRQb3N0Eg4KAmlkGAEgASgJUgJpZBIbCgl0aHJlYWRfaWQYAiABKAlSCHRocmVhZElkEhkKCG'
    'JvYXJkX2lkGAMgASgJUgdib2FyZElkEhkKCHBrZ19uYW1lGAYgASgJUgdwa2dOYW1lEkEKDGFy'
    'dGljbGVfcG9zdBgHIAEoCzIcLm5ld3NfaHViLmRvbWFpbi5BcnRpY2xlUG9zdEgAUgthcnRpY2'
    'xlUG9zdBJOChFzaW5nbGVfaW1hZ2VfcG9zdBgIIAEoCzIgLm5ld3NfaHViLmRvbWFpbi5TaW5n'
    'bGVJbWFnZVBvc3RIAFIPc2luZ2xlSW1hZ2VQb3N0QgkKB2NvbnRlbnRKBAgEEAVKBAgFEAY=');

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
    {'1': 'contents', '3': 17, '4': 3, '5': 11, '6': '.news_hub.domain.Paragraph', '10': 'contents'},
    {'1': 'tags', '3': 18, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'latest_reply_created_at', '3': 15, '4': 1, '5': 3, '10': 'latestReplyCreatedAt'},
    {'1': 'replies_count', '3': 19, '4': 1, '5': 5, '10': 'repliesCount'},
    {'1': 'url', '3': 20, '4': 1, '5': 9, '10': 'url'},
    {'1': 'top_5_comments', '3': 21, '4': 3, '5': 11, '6': '.news_hub.domain.Comment', '10': 'top5Comments'},
  ],
};

/// Descriptor for `ArticlePost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List articlePostDescriptor = $convert.base64Decode(
    'CgtBcnRpY2xlUG9zdBIbCglhdXRob3JfaWQYCyABKAlSCGF1dGhvcklkEh8KC2F1dGhvcl9uYW'
    '1lGAUgASgJUgphdXRob3JOYW1lEh0KCmNyZWF0ZWRfYXQYByABKANSCWNyZWF0ZWRBdBIUCgV0'
    'aXRsZRgJIAEoCVIFdGl0bGUSFAoFbGlrZWQYDCABKAVSBWxpa2VkEhoKCGRpc2xpa2VkGA0gAS'
    'gFUghkaXNsaWtlZBI2Cghjb250ZW50cxgRIAMoCzIaLm5ld3NfaHViLmRvbWFpbi5QYXJhZ3Jh'
    'cGhSCGNvbnRlbnRzEhIKBHRhZ3MYEiADKAlSBHRhZ3MSNQoXbGF0ZXN0X3JlcGx5X2NyZWF0ZW'
    'RfYXQYDyABKANSFGxhdGVzdFJlcGx5Q3JlYXRlZEF0EiMKDXJlcGxpZXNfY291bnQYEyABKAVS'
    'DHJlcGxpZXNDb3VudBIQCgN1cmwYFCABKAlSA3VybBI+Cg50b3BfNV9jb21tZW50cxgVIAMoCz'
    'IYLm5ld3NfaHViLmRvbWFpbi5Db21tZW50Ugx0b3A1Q29tbWVudHM=');

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
    {'1': 'image', '3': 21, '4': 1, '5': 11, '6': '.news_hub.domain.ImageParagraph', '10': 'image'},
    {'1': 'contents', '3': 17, '4': 3, '5': 11, '6': '.news_hub.domain.Paragraph', '10': 'contents'},
    {'1': 'tags', '3': 18, '4': 3, '5': 9, '10': 'tags'},
    {'1': 'latest_reply_created_at', '3': 15, '4': 1, '5': 3, '10': 'latestReplyCreatedAt'},
    {'1': 'replies_count', '3': 19, '4': 1, '5': 5, '10': 'repliesCount'},
    {'1': 'url', '3': 20, '4': 1, '5': 9, '10': 'url'},
    {'1': 'top_5_comments', '3': 22, '4': 3, '5': 11, '6': '.news_hub.domain.Comment', '10': 'top5Comments'},
  ],
};

/// Descriptor for `SingleImagePost`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List singleImagePostDescriptor = $convert.base64Decode(
    'Cg9TaW5nbGVJbWFnZVBvc3QSGwoJYXV0aG9yX2lkGAsgASgJUghhdXRob3JJZBIfCgthdXRob3'
    'JfbmFtZRgFIAEoCVIKYXV0aG9yTmFtZRIdCgpjcmVhdGVkX2F0GAcgASgDUgljcmVhdGVkQXQS'
    'FAoFdGl0bGUYCSABKAlSBXRpdGxlEhQKBWxpa2VkGAwgASgFUgVsaWtlZBIaCghkaXNsaWtlZB'
    'gNIAEoBVIIZGlzbGlrZWQSNQoFaW1hZ2UYFSABKAsyHy5uZXdzX2h1Yi5kb21haW4uSW1hZ2VQ'
    'YXJhZ3JhcGhSBWltYWdlEjYKCGNvbnRlbnRzGBEgAygLMhoubmV3c19odWIuZG9tYWluLlBhcm'
    'FncmFwaFIIY29udGVudHMSEgoEdGFncxgSIAMoCVIEdGFncxI1ChdsYXRlc3RfcmVwbHlfY3Jl'
    'YXRlZF9hdBgPIAEoA1IUbGF0ZXN0UmVwbHlDcmVhdGVkQXQSIwoNcmVwbGllc19jb3VudBgTIA'
    'EoBVIMcmVwbGllc0NvdW50EhAKA3VybBgUIAEoCVIDdXJsEj4KDnRvcF81X2NvbW1lbnRzGBYg'
    'AygLMhgubmV3c19odWIuZG9tYWluLkNvbW1lbnRSDHRvcDVDb21tZW50cw==');

@$core.Deprecated('Use commentDescriptor instead')
const Comment$json = {
  '1': 'Comment',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    {'1': 'post_id', '3': 2, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'board_id', '3': 4, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'author_id', '3': 6, '4': 1, '5': 9, '10': 'authorId'},
    {'1': 'author_name', '3': 10, '4': 1, '5': 9, '10': 'authorName'},
    {'1': 'contents', '3': 11, '4': 3, '5': 11, '6': '.news_hub.domain.Paragraph', '10': 'contents'},
    {'1': 'pkg_name', '3': 12, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'created_at', '3': 8, '4': 1, '5': 3, '10': 'createdAt'},
  ],
  '9': [
    {'1': 5, '2': 6},
    {'1': 7, '2': 8},
    {'1': 9, '2': 10},
  ],
};

/// Descriptor for `Comment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List commentDescriptor = $convert.base64Decode(
    'CgdDb21tZW50Eg4KAmlkGAEgASgJUgJpZBIXCgdwb3N0X2lkGAIgASgJUgZwb3N0SWQSGwoJdG'
    'hyZWFkX2lkGAMgASgJUgh0aHJlYWRJZBIZCghib2FyZF9pZBgEIAEoCVIHYm9hcmRJZBIbCglh'
    'dXRob3JfaWQYBiABKAlSCGF1dGhvcklkEh8KC2F1dGhvcl9uYW1lGAogASgJUgphdXRob3JOYW'
    '1lEjYKCGNvbnRlbnRzGAsgAygLMhoubmV3c19odWIuZG9tYWluLlBhcmFncmFwaFIIY29udGVu'
    'dHMSGQoIcGtnX25hbWUYDCABKAlSB3BrZ05hbWUSHQoKY3JlYXRlZF9hdBgIIAEoA1IJY3JlYX'
    'RlZEF0SgQIBRAGSgQIBxAISgQICRAK');

@$core.Deprecated('Use extensionDescriptor instead')
const Extension$json = {
  '1': 'Extension',
  '2': [
    {'1': 'pkg_name', '3': 2, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'version', '3': 5, '4': 1, '5': 5, '10': 'version'},
    {'1': 'python_version', '3': 6, '4': 1, '5': 5, '10': 'pythonVersion'},
    {'1': 'lang', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'lang', '17': true},
    {'1': 'is_nsfw', '3': 8, '4': 1, '5': 8, '10': 'isNsfw'},
  ],
  '8': [
    {'1': '_lang'},
  ],
};

/// Descriptor for `Extension`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List extensionDescriptor = $convert.base64Decode(
    'CglFeHRlbnNpb24SGQoIcGtnX25hbWUYAiABKAlSB3BrZ05hbWUSIQoMZGlzcGxheV9uYW1lGA'
    'MgASgJUgtkaXNwbGF5TmFtZRIYCgd2ZXJzaW9uGAUgASgFUgd2ZXJzaW9uEiUKDnB5dGhvbl92'
    'ZXJzaW9uGAYgASgFUg1weXRob25WZXJzaW9uEhcKBGxhbmcYByABKAlIAFIEbGFuZ4gBARIXCg'
    'dpc19uc2Z3GAggASgIUgZpc05zZndCBwoFX2xhbmc=');

@$core.Deprecated('Use remoteExtensionDescriptor instead')
const RemoteExtension$json = {
  '1': 'RemoteExtension',
  '2': [
    {'1': 'base', '3': 1, '4': 1, '5': 11, '6': '.news_hub.domain.Extension', '10': 'base'},
    {'1': 'icon_url', '3': 2, '4': 1, '5': 9, '10': 'iconUrl'},
    {'1': 'repo_url', '3': 3, '4': 1, '5': 9, '10': 'repoUrl'},
  ],
};

/// Descriptor for `RemoteExtension`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List remoteExtensionDescriptor = $convert.base64Decode(
    'Cg9SZW1vdGVFeHRlbnNpb24SLgoEYmFzZRgBIAEoCzIaLm5ld3NfaHViLmRvbWFpbi5FeHRlbn'
    'Npb25SBGJhc2USGQoIaWNvbl91cmwYAiABKAlSB2ljb25VcmwSGQoIcmVwb191cmwYAyABKAlS'
    'B3JlcG9Vcmw=');

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

@$core.Deprecated('Use logEntryDescriptor instead')
const LogEntry$json = {
  '1': 'LogEntry',
  '2': [
    {'1': 'timestamp', '3': 1, '4': 1, '5': 3, '10': 'timestamp'},
    {'1': 'level', '3': 2, '4': 1, '5': 14, '6': '.news_hub.domain.LogLevel', '10': 'level'},
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
    'CghMb2dFbnRyeRIcCgl0aW1lc3RhbXAYASABKANSCXRpbWVzdGFtcBIvCgVsZXZlbBgCIAEoDj'
    'IZLm5ld3NfaHViLmRvbWFpbi5Mb2dMZXZlbFIFbGV2ZWwSHwoLbG9nZ2VyX25hbWUYAyABKAlS'
    'CmxvZ2dlck5hbWUSGAoHbWVzc2FnZRgEIAEoCVIHbWVzc2FnZRIhCglleGNlcHRpb24YBSABKA'
    'lIAFIJZXhjZXB0aW9uiAEBQgwKCl9leGNlcHRpb24=');

