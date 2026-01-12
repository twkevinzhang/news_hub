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

@$core.Deprecated('Use getBoardsReqDescriptor instead')
const GetBoardsReq$json = {
  '1': 'GetBoardsReq',
  '2': [
    {'1': 'pkg_name', '3': 3, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationReq', '9': 0, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_page'},
  ],
};

/// Descriptor for `GetBoardsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBoardsReqDescriptor = $convert.base64Decode(
    'CgxHZXRCb2FyZHNSZXESGQoIcGtnX25hbWUYAyABKAlSB3BrZ05hbWUSNwoEcGFnZRgCIAEoCz'
    'IeLm5ld3NfaHViLmRvbWFpbi5QYWdpbmF0aW9uUmVxSABSBHBhZ2WIAQFCBwoFX3BhZ2U=');

@$core.Deprecated('Use getBoardsResDescriptor instead')
const GetBoardsRes$json = {
  '1': 'GetBoardsRes',
  '2': [
    {'1': 'boards', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.Board', '10': 'boards'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetBoardsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBoardsResDescriptor = $convert.base64Decode(
    'CgxHZXRCb2FyZHNSZXMSLgoGYm9hcmRzGAEgAygLMhYubmV3c19odWIuZG9tYWluLkJvYXJkUg'
    'Zib2FyZHMSMgoEcGFnZRgCIAEoCzIeLm5ld3NfaHViLmRvbWFpbi5QYWdpbmF0aW9uUmVzUgRw'
    'YWdl');

@$core.Deprecated('Use getThreadsReqDescriptor instead')
const GetThreadsReq$json = {
  '1': 'GetThreadsReq',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'board_id', '3': 8, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'sort', '3': 7, '4': 1, '5': 9, '9': 0, '10': 'sort', '17': true},
    {'1': 'page', '3': 3, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationReq', '9': 1, '10': 'page', '17': true},
    {'1': 'keywords', '3': 5, '4': 1, '5': 9, '9': 2, '10': 'keywords', '17': true},
  ],
  '8': [
    {'1': '_sort'},
    {'1': '_page'},
    {'1': '_keywords'},
  ],
};

/// Descriptor for `GetThreadsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadsReqDescriptor = $convert.base64Decode(
    'Cg1HZXRUaHJlYWRzUmVxEhkKCHBrZ19uYW1lGAYgASgJUgdwa2dOYW1lEhkKCGJvYXJkX2lkGA'
    'ggASgJUgdib2FyZElkEhcKBHNvcnQYByABKAlIAFIEc29ydIgBARI3CgRwYWdlGAMgASgLMh4u'
    'bmV3c19odWIuZG9tYWluLlBhZ2luYXRpb25SZXFIAVIEcGFnZYgBARIfCghrZXl3b3JkcxgFIA'
    'EoCUgCUghrZXl3b3Jkc4gBAUIHCgVfc29ydEIHCgVfcGFnZUILCglfa2V5d29yZHM=');

@$core.Deprecated('Use getThreadsResDescriptor instead')
const GetThreadsRes$json = {
  '1': 'GetThreadsRes',
  '2': [
    {'1': 'threads', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.Post', '10': 'threads'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetThreadsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getThreadsResDescriptor = $convert.base64Decode(
    'Cg1HZXRUaHJlYWRzUmVzEi8KB3RocmVhZHMYASADKAsyFS5uZXdzX2h1Yi5kb21haW4uUG9zdF'
    'IHdGhyZWFkcxIyCgRwYWdlGAIgASgLMh4ubmV3c19odWIuZG9tYWluLlBhZ2luYXRpb25SZXNS'
    'BHBhZ2U=');

@$core.Deprecated('Use getOriginalPostReqDescriptor instead')
const GetOriginalPostReq$json = {
  '1': 'GetOriginalPostReq',
  '2': [
    {'1': 'pkg_name', '3': 5, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'board_id', '3': 3, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 1, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'post_id', '3': 4, '4': 1, '5': 9, '10': 'postId'},
  ],
};

/// Descriptor for `GetOriginalPostReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOriginalPostReqDescriptor = $convert.base64Decode(
    'ChJHZXRPcmlnaW5hbFBvc3RSZXESGQoIcGtnX25hbWUYBSABKAlSB3BrZ05hbWUSGQoIYm9hcm'
    'RfaWQYAyABKAlSB2JvYXJkSWQSGwoJdGhyZWFkX2lkGAEgASgJUgh0aHJlYWRJZBIXCgdwb3N0'
    'X2lkGAQgASgJUgZwb3N0SWQ=');

@$core.Deprecated('Use getOriginalPostResDescriptor instead')
const GetOriginalPostRes$json = {
  '1': 'GetOriginalPostRes',
  '2': [
    {'1': 'original_post', '3': 1, '4': 1, '5': 11, '6': '.news_hub.domain.Post', '10': 'originalPost'},
  ],
};

/// Descriptor for `GetOriginalPostRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOriginalPostResDescriptor = $convert.base64Decode(
    'ChJHZXRPcmlnaW5hbFBvc3RSZXMSOgoNb3JpZ2luYWxfcG9zdBgBIAEoCzIVLm5ld3NfaHViLm'
    'RvbWFpbi5Qb3N0UgxvcmlnaW5hbFBvc3Q=');

@$core.Deprecated('Use getRepliesReqDescriptor instead')
const GetRepliesReq$json = {
  '1': 'GetRepliesReq',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'parent_id', '3': 5, '4': 1, '5': 9, '9': 0, '10': 'parentId', '17': true},
    {'1': 'page', '3': 4, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationReq', '9': 1, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_parent_id'},
    {'1': '_page'},
  ],
};

/// Descriptor for `GetRepliesReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRepliesReqDescriptor = $convert.base64Decode(
    'Cg1HZXRSZXBsaWVzUmVxEhkKCHBrZ19uYW1lGAYgASgJUgdwa2dOYW1lEhkKCGJvYXJkX2lkGA'
    'IgASgJUgdib2FyZElkEhsKCXRocmVhZF9pZBgDIAEoCVIIdGhyZWFkSWQSIAoJcGFyZW50X2lk'
    'GAUgASgJSABSCHBhcmVudElkiAEBEjcKBHBhZ2UYBCABKAsyHi5uZXdzX2h1Yi5kb21haW4uUG'
    'FnaW5hdGlvblJlcUgBUgRwYWdliAEBQgwKCl9wYXJlbnRfaWRCBwoFX3BhZ2U=');

@$core.Deprecated('Use getRepliesResDescriptor instead')
const GetRepliesRes$json = {
  '1': 'GetRepliesRes',
  '2': [
    {'1': 'replies', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.Post', '10': 'replies'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetRepliesRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getRepliesResDescriptor = $convert.base64Decode(
    'Cg1HZXRSZXBsaWVzUmVzEi8KB3JlcGxpZXMYASADKAsyFS5uZXdzX2h1Yi5kb21haW4uUG9zdF'
    'IHcmVwbGllcxIyCgRwYWdlGAIgASgLMh4ubmV3c19odWIuZG9tYWluLlBhZ2luYXRpb25SZXNS'
    'BHBhZ2U=');

@$core.Deprecated('Use getCommentsReqDescriptor instead')
const GetCommentsReq$json = {
  '1': 'GetCommentsReq',
  '2': [
    {'1': 'pkg_name', '3': 6, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'board_id', '3': 2, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'thread_id', '3': 3, '4': 1, '5': 9, '10': 'threadId'},
    {'1': 'post_id', '3': 4, '4': 1, '5': 9, '10': 'postId'},
    {'1': 'page', '3': 5, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationReq', '9': 0, '10': 'page', '17': true},
  ],
  '8': [
    {'1': '_page'},
  ],
};

/// Descriptor for `GetCommentsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentsReqDescriptor = $convert.base64Decode(
    'Cg5HZXRDb21tZW50c1JlcRIZCghwa2dfbmFtZRgGIAEoCVIHcGtnTmFtZRIZCghib2FyZF9pZB'
    'gCIAEoCVIHYm9hcmRJZBIbCgl0aHJlYWRfaWQYAyABKAlSCHRocmVhZElkEhcKB3Bvc3RfaWQY'
    'BCABKAlSBnBvc3RJZBI3CgRwYWdlGAUgASgLMh4ubmV3c19odWIuZG9tYWluLlBhZ2luYXRpb2'
    '5SZXFIAFIEcGFnZYgBAUIHCgVfcGFnZQ==');

@$core.Deprecated('Use getCommentsResDescriptor instead')
const GetCommentsRes$json = {
  '1': 'GetCommentsRes',
  '2': [
    {'1': 'comments', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.Comment', '10': 'comments'},
    {'1': 'page', '3': 2, '4': 1, '5': 11, '6': '.news_hub.domain.PaginationRes', '10': 'page'},
  ],
};

/// Descriptor for `GetCommentsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCommentsResDescriptor = $convert.base64Decode(
    'Cg5HZXRDb21tZW50c1JlcxI0Cghjb21tZW50cxgBIAMoCzIYLm5ld3NfaHViLmRvbWFpbi5Db2'
    '1tZW50Ughjb21tZW50cxIyCgRwYWdlGAIgASgLMh4ubmV3c19odWIuZG9tYWluLlBhZ2luYXRp'
    'b25SZXNSBHBhZ2U=');

@$core.Deprecated('Use listInstalledExtensionsResDescriptor instead')
const ListInstalledExtensionsRes$json = {
  '1': 'ListInstalledExtensionsRes',
  '2': [
    {'1': 'extensions', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.Extension', '10': 'extensions'},
  ],
};

/// Descriptor for `ListInstalledExtensionsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listInstalledExtensionsResDescriptor = $convert.base64Decode(
    'ChpMaXN0SW5zdGFsbGVkRXh0ZW5zaW9uc1JlcxI6CgpleHRlbnNpb25zGAEgAygLMhoubmV3c1'
    '9odWIuZG9tYWluLkV4dGVuc2lvblIKZXh0ZW5zaW9ucw==');

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
    {'1': 'extension', '3': 1, '4': 1, '5': 11, '6': '.news_hub.domain.Extension', '10': 'extension'},
  ],
};

/// Descriptor for `GetInstalledExtensionRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstalledExtensionResDescriptor = $convert.base64Decode(
    'ChhHZXRJbnN0YWxsZWRFeHRlbnNpb25SZXMSOAoJZXh0ZW5zaW9uGAEgASgLMhoubmV3c19odW'
    'IuZG9tYWluLkV4dGVuc2lvblIJZXh0ZW5zaW9u');

@$core.Deprecated('Use installExtensionReqDescriptor instead')
const InstallExtensionReq$json = {
  '1': 'InstallExtensionReq',
  '2': [
    {'1': 'pkg_name', '3': 1, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'repo_url', '3': 4, '4': 1, '5': 9, '9': 0, '10': 'repoUrl', '17': true},
  ],
  '8': [
    {'1': '_repo_url'},
  ],
};

/// Descriptor for `InstallExtensionReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List installExtensionReqDescriptor = $convert.base64Decode(
    'ChNJbnN0YWxsRXh0ZW5zaW9uUmVxEhkKCHBrZ19uYW1lGAEgASgJUgdwa2dOYW1lEh4KCHJlcG'
    '9fdXJsGAQgASgJSABSB3JlcG9VcmyIAQFCCwoJX3JlcG9fdXJs');

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
    {'1': 'progress', '3': 2, '4': 1, '5': 3, '10': 'progress'},
  ],
};

/// Descriptor for `GetInstallProgressRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInstallProgressResDescriptor = $convert.base64Decode(
    'ChVHZXRJbnN0YWxsUHJvZ3Jlc3NSZXMSGgoIcHJvZ3Jlc3MYAiABKANSCHByb2dyZXNz');

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
    {'1': 'extensions', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.RemoteExtension', '10': 'extensions'},
  ],
};

/// Descriptor for `ListRemoteExtensionsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listRemoteExtensionsResDescriptor = $convert.base64Decode(
    'ChdMaXN0UmVtb3RlRXh0ZW5zaW9uc1JlcxJACgpleHRlbnNpb25zGAEgAygLMiAubmV3c19odW'
    'IuZG9tYWluLlJlbW90ZUV4dGVuc2lvblIKZXh0ZW5zaW9ucw==');

@$core.Deprecated('Use listExtensionReposResDescriptor instead')
const ListExtensionReposRes$json = {
  '1': 'ListExtensionReposRes',
  '2': [
    {'1': 'repos', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.ExtensionRepo', '10': 'repos'},
  ],
};

/// Descriptor for `ListExtensionReposRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listExtensionReposResDescriptor = $convert.base64Decode(
    'ChVMaXN0RXh0ZW5zaW9uUmVwb3NSZXMSNAoFcmVwb3MYASADKAsyHi5uZXdzX2h1Yi5kb21haW'
    '4uRXh0ZW5zaW9uUmVwb1IFcmVwb3M=');

@$core.Deprecated('Use addExtensionRepoReqDescriptor instead')
const AddExtensionRepoReq$json = {
  '1': 'AddExtensionRepoReq',
  '2': [
    {'1': 'url', '3': 1, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `AddExtensionRepoReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addExtensionRepoReqDescriptor = $convert.base64Decode(
    'ChNBZGRFeHRlbnNpb25SZXBvUmVxEhAKA3VybBgBIAEoCVIDdXJs');

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
    {'1': 'status', '3': 1, '4': 1, '5': 14, '6': '.news_hub.sidecar.HealthCheckRes.ServingStatus', '10': 'status'},
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
    'Cg5IZWFsdGhDaGVja1JlcxJGCgZzdGF0dXMYASABKA4yLi5uZXdzX2h1Yi5zaWRlY2FyLkhlYW'
    'x0aENoZWNrUmVzLlNlcnZpbmdTdGF0dXNSBnN0YXR1cxIdCgdtZXNzYWdlGAIgASgJSABSB21l'
    'c3NhZ2WIAQEiTwoNU2VydmluZ1N0YXR1cxILCgdVTktOT1dOEAASCwoHU0VSVklORxABEg8KC0'
    '5PVF9TRVJWSU5HEAISEwoPU0VSVklDRV9VTktOT1dOEANCCgoIX21lc3NhZ2U=');

@$core.Deprecated('Use watchLogsReqDescriptor instead')
const WatchLogsReq$json = {
  '1': 'WatchLogsReq',
  '2': [
    {'1': 'min_level', '3': 1, '4': 1, '5': 14, '6': '.news_hub.domain.LogLevel', '10': 'minLevel'},
    {'1': 'logger_filter', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'loggerFilter', '17': true},
  ],
  '8': [
    {'1': '_logger_filter'},
  ],
};

/// Descriptor for `WatchLogsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List watchLogsReqDescriptor = $convert.base64Decode(
    'CgxXYXRjaExvZ3NSZXESNgoJbWluX2xldmVsGAEgASgOMhkubmV3c19odWIuZG9tYWluLkxvZ0'
    'xldmVsUghtaW5MZXZlbBIoCg1sb2dnZXJfZmlsdGVyGAIgASgJSABSDGxvZ2dlckZpbHRlcogB'
    'AUIQCg5fbG9nZ2VyX2ZpbHRlcg==');

@$core.Deprecated('Use getLogsReqDescriptor instead')
const GetLogsReq$json = {
  '1': 'GetLogsReq',
  '2': [
    {'1': 'start_time', '3': 1, '4': 1, '5': 3, '10': 'startTime'},
    {'1': 'end_time', '3': 2, '4': 1, '5': 3, '10': 'endTime'},
    {'1': 'min_level', '3': 3, '4': 1, '5': 14, '6': '.news_hub.domain.LogLevel', '10': 'minLevel'},
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
    'gCIAEoA1IHZW5kVGltZRI2CgltaW5fbGV2ZWwYAyABKA4yGS5uZXdzX2h1Yi5kb21haW4uTG9n'
    'TGV2ZWxSCG1pbkxldmVsEigKDWxvZ2dlcl9maWx0ZXIYBCABKAlIAFIMbG9nZ2VyRmlsdGVyiA'
    'EBEhkKBWxpbWl0GAUgASgFSAFSBWxpbWl0iAEBQhAKDl9sb2dnZXJfZmlsdGVyQggKBl9saW1p'
    'dA==');

@$core.Deprecated('Use getLogsResDescriptor instead')
const GetLogsRes$json = {
  '1': 'GetLogsRes',
  '2': [
    {'1': 'entries', '3': 1, '4': 3, '5': 11, '6': '.news_hub.domain.LogEntry', '10': 'entries'},
  ],
};

/// Descriptor for `GetLogsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLogsResDescriptor = $convert.base64Decode(
    'CgpHZXRMb2dzUmVzEjMKB2VudHJpZXMYASADKAsyGS5uZXdzX2h1Yi5kb21haW4uTG9nRW50cn'
    'lSB2VudHJpZXM=');

@$core.Deprecated('Use setLogLevelReqDescriptor instead')
const SetLogLevelReq$json = {
  '1': 'SetLogLevelReq',
  '2': [
    {'1': 'level', '3': 1, '4': 1, '5': 14, '6': '.news_hub.domain.LogLevel', '10': 'level'},
  ],
};

/// Descriptor for `SetLogLevelReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setLogLevelReqDescriptor = $convert.base64Decode(
    'Cg5TZXRMb2dMZXZlbFJlcRIvCgVsZXZlbBgBIAEoDjIZLm5ld3NfaHViLmRvbWFpbi5Mb2dMZX'
    'ZlbFIFbGV2ZWw=');

@$core.Deprecated('Use boardSortOptionDescriptor instead')
const BoardSortOption$json = {
  '1': 'BoardSortOption',
  '2': [
    {'1': 'board_id', '3': 1, '4': 1, '5': 9, '10': 'boardId'},
    {'1': 'options', '3': 2, '4': 3, '5': 9, '10': 'options'},
  ],
};

/// Descriptor for `BoardSortOption`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List boardSortOptionDescriptor = $convert.base64Decode(
    'Cg9Cb2FyZFNvcnRPcHRpb24SGQoIYm9hcmRfaWQYASABKAlSB2JvYXJkSWQSGAoHb3B0aW9ucx'
    'gCIAMoCVIHb3B0aW9ucw==');

@$core.Deprecated('Use getBoardSortOptionsReqDescriptor instead')
const GetBoardSortOptionsReq$json = {
  '1': 'GetBoardSortOptionsReq',
  '2': [
    {'1': 'pkg_name', '3': 1, '4': 1, '5': 9, '10': 'pkgName'},
    {'1': 'board_ids', '3': 2, '4': 3, '5': 9, '10': 'boardIds'},
  ],
};

/// Descriptor for `GetBoardSortOptionsReq`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBoardSortOptionsReqDescriptor = $convert.base64Decode(
    'ChZHZXRCb2FyZFNvcnRPcHRpb25zUmVxEhkKCHBrZ19uYW1lGAEgASgJUgdwa2dOYW1lEhsKCW'
    'JvYXJkX2lkcxgCIAMoCVIIYm9hcmRJZHM=');

@$core.Deprecated('Use getBoardSortOptionsResDescriptor instead')
const GetBoardSortOptionsRes$json = {
  '1': 'GetBoardSortOptionsRes',
  '2': [
    {'1': 'options', '3': 1, '4': 3, '5': 11, '6': '.news_hub.sidecar.BoardSortOption', '10': 'options'},
  ],
};

/// Descriptor for `GetBoardSortOptionsRes`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBoardSortOptionsResDescriptor = $convert.base64Decode(
    'ChZHZXRCb2FyZFNvcnRPcHRpb25zUmVzEjsKB29wdGlvbnMYASADKAsyIS5uZXdzX2h1Yi5zaW'
    'RlY2FyLkJvYXJkU29ydE9wdGlvblIHb3B0aW9ucw==');

