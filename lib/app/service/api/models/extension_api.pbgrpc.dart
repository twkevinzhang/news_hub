// This is a generated file - do not edit.
//
// Generated from extension_api.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'extension_api.pb.dart' as $0;

export 'extension_api.pb.dart';

@$pb.GrpcServiceName('pb.SidecarApi')
class SidecarApiClient extends $grpc.Client {
  /// The hostname for this service.
  static const $core.String defaultHost = '';

  /// OAuth scopes needed for the client.
  static const $core.List<$core.String> oauthScopes = [
    '',
  ];

  SidecarApiClient(super.channel, {super.options, super.interceptors});

  $grpc.ResponseFuture<$0.GetSiteRes> getSite(
    $0.GetSiteReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getSite, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBoardsRes> getBoards(
    $0.GetBoardsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getBoards, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetThreadInfosRes> getThreadInfos(
    $0.GetThreadInfosReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getThreadInfos, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetThreadPostRes> getThreadPost(
    $0.GetThreadPostReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getThreadPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRegardingPostsRes> getRegardingPosts(
    $0.GetRegardingPostsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getRegardingPosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCommentsRes> getComments(
    $0.GetCommentsReq request, {
    $grpc.CallOptions? options,
  }) {
    return $createUnaryCall(_$getComments, request, options: options);
  }

  // method descriptors

  static final _$getSite = $grpc.ClientMethod<$0.GetSiteReq, $0.GetSiteRes>(
      '/pb.SidecarApi/GetSite',
      ($0.GetSiteReq value) => value.writeToBuffer(),
      $0.GetSiteRes.fromBuffer);
  static final _$getBoards =
      $grpc.ClientMethod<$0.GetBoardsReq, $0.GetBoardsRes>(
          '/pb.SidecarApi/GetBoards',
          ($0.GetBoardsReq value) => value.writeToBuffer(),
          $0.GetBoardsRes.fromBuffer);
  static final _$getThreadInfos =
      $grpc.ClientMethod<$0.GetThreadInfosReq, $0.GetThreadInfosRes>(
          '/pb.SidecarApi/GetThreadInfos',
          ($0.GetThreadInfosReq value) => value.writeToBuffer(),
          $0.GetThreadInfosRes.fromBuffer);
  static final _$getThreadPost =
      $grpc.ClientMethod<$0.GetThreadPostReq, $0.GetThreadPostRes>(
          '/pb.SidecarApi/GetThreadPost',
          ($0.GetThreadPostReq value) => value.writeToBuffer(),
          $0.GetThreadPostRes.fromBuffer);
  static final _$getRegardingPosts =
      $grpc.ClientMethod<$0.GetRegardingPostsReq, $0.GetRegardingPostsRes>(
          '/pb.SidecarApi/GetRegardingPosts',
          ($0.GetRegardingPostsReq value) => value.writeToBuffer(),
          $0.GetRegardingPostsRes.fromBuffer);
  static final _$getComments =
      $grpc.ClientMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
          '/pb.SidecarApi/GetComments',
          ($0.GetCommentsReq value) => value.writeToBuffer(),
          $0.GetCommentsRes.fromBuffer);
}

@$pb.GrpcServiceName('pb.SidecarApi')
abstract class SidecarApiServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.SidecarApi';

  SidecarApiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetSiteReq, $0.GetSiteRes>(
        'GetSite',
        getSite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSiteReq.fromBuffer(value),
        ($0.GetSiteRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBoardsReq, $0.GetBoardsRes>(
        'GetBoards',
        getBoards_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBoardsReq.fromBuffer(value),
        ($0.GetBoardsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetThreadInfosReq, $0.GetThreadInfosRes>(
        'GetThreadInfos',
        getThreadInfos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetThreadInfosReq.fromBuffer(value),
        ($0.GetThreadInfosRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetThreadPostReq, $0.GetThreadPostRes>(
        'GetThreadPost',
        getThreadPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetThreadPostReq.fromBuffer(value),
        ($0.GetThreadPostRes value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.GetRegardingPostsReq, $0.GetRegardingPostsRes>(
            'GetRegardingPosts',
            getRegardingPosts_Pre,
            false,
            false,
            ($core.List<$core.int> value) =>
                $0.GetRegardingPostsReq.fromBuffer(value),
            ($0.GetRegardingPostsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
        'GetComments',
        getComments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCommentsReq.fromBuffer(value),
        ($0.GetCommentsRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetSiteRes> getSite_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetSiteReq> $request) async {
    return getSite($call, await $request);
  }

  $async.Future<$0.GetSiteRes> getSite(
      $grpc.ServiceCall call, $0.GetSiteReq request);

  $async.Future<$0.GetBoardsRes> getBoards_Pre(
      $grpc.ServiceCall $call, $async.Future<$0.GetBoardsReq> $request) async {
    return getBoards($call, await $request);
  }

  $async.Future<$0.GetBoardsRes> getBoards(
      $grpc.ServiceCall call, $0.GetBoardsReq request);

  $async.Future<$0.GetThreadInfosRes> getThreadInfos_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetThreadInfosReq> $request) async {
    return getThreadInfos($call, await $request);
  }

  $async.Future<$0.GetThreadInfosRes> getThreadInfos(
      $grpc.ServiceCall call, $0.GetThreadInfosReq request);

  $async.Future<$0.GetThreadPostRes> getThreadPost_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetThreadPostReq> $request) async {
    return getThreadPost($call, await $request);
  }

  $async.Future<$0.GetThreadPostRes> getThreadPost(
      $grpc.ServiceCall call, $0.GetThreadPostReq request);

  $async.Future<$0.GetRegardingPostsRes> getRegardingPosts_Pre(
      $grpc.ServiceCall $call,
      $async.Future<$0.GetRegardingPostsReq> $request) async {
    return getRegardingPosts($call, await $request);
  }

  $async.Future<$0.GetRegardingPostsRes> getRegardingPosts(
      $grpc.ServiceCall call, $0.GetRegardingPostsReq request);

  $async.Future<$0.GetCommentsRes> getComments_Pre($grpc.ServiceCall $call,
      $async.Future<$0.GetCommentsReq> $request) async {
    return getComments($call, await $request);
  }

  $async.Future<$0.GetCommentsRes> getComments(
      $grpc.ServiceCall call, $0.GetCommentsReq request);
}
