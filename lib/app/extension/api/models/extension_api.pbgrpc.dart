//
//  Generated code. Do not modify.
//  source: extension_api.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'extension_api.pb.dart' as $0;

export 'extension_api.pb.dart';

@$pb.GrpcServiceName('pb.ExtensionApi')
class ExtensionApiClient extends $grpc.Client {
  static final _$getSite = $grpc.ClientMethod<$0.Empty, $0.GetSiteRes>(
      '/pb.ExtensionApi/GetSite',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSiteRes.fromBuffer(value));
  static final _$getBoards = $grpc.ClientMethod<$0.GetBoardsReq, $0.GetBoardsRes>(
      '/pb.ExtensionApi/GetBoards',
      ($0.GetBoardsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBoardsRes.fromBuffer(value));
  static final _$getThreadInfos = $grpc.ClientMethod<$0.GetThreadInfosReq, $0.GetThreadInfosRes>(
      '/pb.ExtensionApi/GetThreadInfos',
      ($0.GetThreadInfosReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetThreadInfosRes.fromBuffer(value));
  static final _$getThread = $grpc.ClientMethod<$0.GetThreadReq, $0.GetThreadRes>(
      '/pb.ExtensionApi/GetThread',
      ($0.GetThreadReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetThreadRes.fromBuffer(value));
  static final _$getRegardingPosts = $grpc.ClientMethod<$0.GetRegardingPostsReq, $0.GetRegardingPostsRes>(
      '/pb.ExtensionApi/GetRegardingPosts',
      ($0.GetRegardingPostsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRegardingPostsRes.fromBuffer(value));
  static final _$getPost = $grpc.ClientMethod<$0.GetPostReq, $0.GetPostRes>(
      '/pb.ExtensionApi/GetPost',
      ($0.GetPostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetPostRes.fromBuffer(value));
  static final _$getComments = $grpc.ClientMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
      '/pb.ExtensionApi/GetComments',
      ($0.GetCommentsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetCommentsRes.fromBuffer(value));

  ExtensionApiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetSiteRes> getSite($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSite, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBoardsRes> getBoards($0.GetBoardsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBoards, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetThreadInfosRes> getThreadInfos($0.GetThreadInfosReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getThreadInfos, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetThreadRes> getThread($0.GetThreadReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getThread, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRegardingPostsRes> getRegardingPosts($0.GetRegardingPostsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRegardingPosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetPostRes> getPost($0.GetPostReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCommentsRes> getComments($0.GetCommentsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getComments, request, options: options);
  }
}

@$pb.GrpcServiceName('pb.ExtensionApi')
abstract class ExtensionApiServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.ExtensionApi';

  ExtensionApiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.GetSiteRes>(
        'GetSite',
        getSite_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
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
    $addMethod($grpc.ServiceMethod<$0.GetThreadReq, $0.GetThreadRes>(
        'GetThread',
        getThread_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetThreadReq.fromBuffer(value),
        ($0.GetThreadRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRegardingPostsReq, $0.GetRegardingPostsRes>(
        'GetRegardingPosts',
        getRegardingPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRegardingPostsReq.fromBuffer(value),
        ($0.GetRegardingPostsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetPostReq, $0.GetPostRes>(
        'GetPost',
        getPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetPostReq.fromBuffer(value),
        ($0.GetPostRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
        'GetComments',
        getComments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCommentsReq.fromBuffer(value),
        ($0.GetCommentsRes value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetSiteRes> getSite_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return getSite(call, await request);
  }

  $async.Future<$0.GetBoardsRes> getBoards_Pre($grpc.ServiceCall call, $async.Future<$0.GetBoardsReq> request) async {
    return getBoards(call, await request);
  }

  $async.Future<$0.GetThreadInfosRes> getThreadInfos_Pre($grpc.ServiceCall call, $async.Future<$0.GetThreadInfosReq> request) async {
    return getThreadInfos(call, await request);
  }

  $async.Future<$0.GetThreadRes> getThread_Pre($grpc.ServiceCall call, $async.Future<$0.GetThreadReq> request) async {
    return getThread(call, await request);
  }

  $async.Future<$0.GetRegardingPostsRes> getRegardingPosts_Pre($grpc.ServiceCall call, $async.Future<$0.GetRegardingPostsReq> request) async {
    return getRegardingPosts(call, await request);
  }

  $async.Future<$0.GetPostRes> getPost_Pre($grpc.ServiceCall call, $async.Future<$0.GetPostReq> request) async {
    return getPost(call, await request);
  }

  $async.Future<$0.GetCommentsRes> getComments_Pre($grpc.ServiceCall call, $async.Future<$0.GetCommentsReq> request) async {
    return getComments(call, await request);
  }

  $async.Future<$0.GetSiteRes> getSite($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.GetBoardsRes> getBoards($grpc.ServiceCall call, $0.GetBoardsReq request);
  $async.Future<$0.GetThreadInfosRes> getThreadInfos($grpc.ServiceCall call, $0.GetThreadInfosReq request);
  $async.Future<$0.GetThreadRes> getThread($grpc.ServiceCall call, $0.GetThreadReq request);
  $async.Future<$0.GetRegardingPostsRes> getRegardingPosts($grpc.ServiceCall call, $0.GetRegardingPostsReq request);
  $async.Future<$0.GetPostRes> getPost($grpc.ServiceCall call, $0.GetPostReq request);
  $async.Future<$0.GetCommentsRes> getComments($grpc.ServiceCall call, $0.GetCommentsReq request);
}
