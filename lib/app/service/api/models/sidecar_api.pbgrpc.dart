//
//  Generated code. Do not modify.
//  source: sidecar_api.proto
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

import 'sidecar_api.pb.dart' as $0;

export 'sidecar_api.pb.dart';

@$pb.GrpcServiceName('pb.SidecarApi')
class SidecarApiClient extends $grpc.Client {
  static final _$getSite = $grpc.ClientMethod<$0.GetSiteReq, $0.GetSiteRes>(
      '/pb.SidecarApi/GetSite',
      ($0.GetSiteReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSiteRes.fromBuffer(value));
  static final _$getBoards = $grpc.ClientMethod<$0.GetBoardsReq, $0.GetBoardsRes>(
      '/pb.SidecarApi/GetBoards',
      ($0.GetBoardsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBoardsRes.fromBuffer(value));
  static final _$getThreadInfos = $grpc.ClientMethod<$0.GetThreadInfosReq, $0.GetThreadInfosRes>(
      '/pb.SidecarApi/GetThreadInfos',
      ($0.GetThreadInfosReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetThreadInfosRes.fromBuffer(value));
  static final _$getThreadPost = $grpc.ClientMethod<$0.GetThreadPostReq, $0.GetThreadPostRes>(
      '/pb.SidecarApi/GetThreadPost',
      ($0.GetThreadPostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetThreadPostRes.fromBuffer(value));
  static final _$getRegardingPosts = $grpc.ClientMethod<$0.GetRegardingPostsReq, $0.GetRegardingPostsRes>(
      '/pb.SidecarApi/GetRegardingPosts',
      ($0.GetRegardingPostsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRegardingPostsRes.fromBuffer(value));
  static final _$getComments = $grpc.ClientMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
      '/pb.SidecarApi/GetComments',
      ($0.GetCommentsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetCommentsRes.fromBuffer(value));
  static final _$listInstalledExtensions = $grpc.ClientMethod<$0.Empty, $0.ListInstalledExtensionsRes>(
      '/pb.SidecarApi/ListInstalledExtensions',
      ($0.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListInstalledExtensionsRes.fromBuffer(value));
  static final _$getInstalledExtension = $grpc.ClientMethod<$0.GetInstalledExtensionReq, $0.GetInstalledExtensionRes>(
      '/pb.SidecarApi/GetInstalledExtension',
      ($0.GetInstalledExtensionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetInstalledExtensionRes.fromBuffer(value));
  static final _$installExtension = $grpc.ClientMethod<$0.InstallExtensionReq, $0.Empty>(
      '/pb.SidecarApi/InstallExtension',
      ($0.InstallExtensionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$uninstallExtension = $grpc.ClientMethod<$0.UninstallExtensionReq, $0.Empty>(
      '/pb.SidecarApi/UninstallExtension',
      ($0.UninstallExtensionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$getInstallProgress = $grpc.ClientMethod<$0.GetInstallProgressReq, $0.GetInstallProgressRes>(
      '/pb.SidecarApi/GetInstallProgress',
      ($0.GetInstallProgressReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetInstallProgressRes.fromBuffer(value));
  static final _$listRemoteExtensions = $grpc.ClientMethod<$0.ListRemoteExtensionsReq, $0.ListRemoteExtensionsRes>(
      '/pb.SidecarApi/ListRemoteExtensions',
      ($0.ListRemoteExtensionsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListRemoteExtensionsRes.fromBuffer(value));
  static final _$healthCheck = $grpc.ClientMethod<$0.HealthCheckReq, $0.HealthCheckRes>(
      '/pb.SidecarApi/HealthCheck',
      ($0.HealthCheckReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HealthCheckRes.fromBuffer(value));
  static final _$watchHealth = $grpc.ClientMethod<$0.HealthCheckReq, $0.HealthCheckRes>(
      '/pb.SidecarApi/WatchHealth',
      ($0.HealthCheckReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HealthCheckRes.fromBuffer(value));
  static final _$watchLogs = $grpc.ClientMethod<$0.WatchLogsReq, $0.LogEntry>(
      '/pb.SidecarApi/WatchLogs',
      ($0.WatchLogsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.LogEntry.fromBuffer(value));
  static final _$getLogs = $grpc.ClientMethod<$0.GetLogsReq, $0.GetLogsRes>(
      '/pb.SidecarApi/GetLogs',
      ($0.GetLogsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetLogsRes.fromBuffer(value));
  static final _$setLogLevel = $grpc.ClientMethod<$0.SetLogLevelReq, $0.Empty>(
      '/pb.SidecarApi/SetLogLevel',
      ($0.SetLogLevelReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));

  SidecarApiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetSiteRes> getSite($0.GetSiteReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSite, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBoardsRes> getBoards($0.GetBoardsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBoards, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetThreadInfosRes> getThreadInfos($0.GetThreadInfosReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getThreadInfos, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetThreadPostRes> getThreadPost($0.GetThreadPostReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getThreadPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRegardingPostsRes> getRegardingPosts($0.GetRegardingPostsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getRegardingPosts, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCommentsRes> getComments($0.GetCommentsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getComments, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListInstalledExtensionsRes> listInstalledExtensions($0.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listInstalledExtensions, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetInstalledExtensionRes> getInstalledExtension($0.GetInstalledExtensionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInstalledExtension, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> installExtension($0.InstallExtensionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$installExtension, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> uninstallExtension($0.UninstallExtensionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uninstallExtension, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetInstallProgressRes> getInstallProgress($0.GetInstallProgressReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInstallProgress, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListRemoteExtensionsRes> listRemoteExtensions($0.ListRemoteExtensionsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRemoteExtensions, request, options: options);
  }

  $grpc.ResponseFuture<$0.HealthCheckRes> healthCheck($0.HealthCheckReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$healthCheck, request, options: options);
  }

  $grpc.ResponseStream<$0.HealthCheckRes> watchHealth($0.HealthCheckReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$watchHealth, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$0.LogEntry> watchLogs($0.WatchLogsReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$watchLogs, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.GetLogsRes> getLogs($0.GetLogsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLogs, request, options: options);
  }

  $grpc.ResponseFuture<$0.Empty> setLogLevel($0.SetLogLevelReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setLogLevel, request, options: options);
  }
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
    $addMethod($grpc.ServiceMethod<$0.GetRegardingPostsReq, $0.GetRegardingPostsRes>(
        'GetRegardingPosts',
        getRegardingPosts_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRegardingPostsReq.fromBuffer(value),
        ($0.GetRegardingPostsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
        'GetComments',
        getComments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCommentsReq.fromBuffer(value),
        ($0.GetCommentsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.Empty, $0.ListInstalledExtensionsRes>(
        'ListInstalledExtensions',
        listInstalledExtensions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.Empty.fromBuffer(value),
        ($0.ListInstalledExtensionsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetInstalledExtensionReq, $0.GetInstalledExtensionRes>(
        'GetInstalledExtension',
        getInstalledExtension_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetInstalledExtensionReq.fromBuffer(value),
        ($0.GetInstalledExtensionRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InstallExtensionReq, $0.Empty>(
        'InstallExtension',
        installExtension_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InstallExtensionReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UninstallExtensionReq, $0.Empty>(
        'UninstallExtension',
        uninstallExtension_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UninstallExtensionReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetInstallProgressReq, $0.GetInstallProgressRes>(
        'GetInstallProgress',
        getInstallProgress_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetInstallProgressReq.fromBuffer(value),
        ($0.GetInstallProgressRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ListRemoteExtensionsReq, $0.ListRemoteExtensionsRes>(
        'ListRemoteExtensions',
        listRemoteExtensions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ListRemoteExtensionsReq.fromBuffer(value),
        ($0.ListRemoteExtensionsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HealthCheckReq, $0.HealthCheckRes>(
        'HealthCheck',
        healthCheck_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.HealthCheckReq.fromBuffer(value),
        ($0.HealthCheckRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.HealthCheckReq, $0.HealthCheckRes>(
        'WatchHealth',
        watchHealth_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.HealthCheckReq.fromBuffer(value),
        ($0.HealthCheckRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.WatchLogsReq, $0.LogEntry>(
        'WatchLogs',
        watchLogs_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.WatchLogsReq.fromBuffer(value),
        ($0.LogEntry value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLogsReq, $0.GetLogsRes>(
        'GetLogs',
        getLogs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetLogsReq.fromBuffer(value),
        ($0.GetLogsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetLogLevelReq, $0.Empty>(
        'SetLogLevel',
        setLogLevel_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetLogLevelReq.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetSiteRes> getSite_Pre($grpc.ServiceCall call, $async.Future<$0.GetSiteReq> request) async {
    return getSite(call, await request);
  }

  $async.Future<$0.GetBoardsRes> getBoards_Pre($grpc.ServiceCall call, $async.Future<$0.GetBoardsReq> request) async {
    return getBoards(call, await request);
  }

  $async.Future<$0.GetThreadInfosRes> getThreadInfos_Pre($grpc.ServiceCall call, $async.Future<$0.GetThreadInfosReq> request) async {
    return getThreadInfos(call, await request);
  }

  $async.Future<$0.GetThreadPostRes> getThreadPost_Pre($grpc.ServiceCall call, $async.Future<$0.GetThreadPostReq> request) async {
    return getThreadPost(call, await request);
  }

  $async.Future<$0.GetRegardingPostsRes> getRegardingPosts_Pre($grpc.ServiceCall call, $async.Future<$0.GetRegardingPostsReq> request) async {
    return getRegardingPosts(call, await request);
  }

  $async.Future<$0.GetCommentsRes> getComments_Pre($grpc.ServiceCall call, $async.Future<$0.GetCommentsReq> request) async {
    return getComments(call, await request);
  }

  $async.Future<$0.ListInstalledExtensionsRes> listInstalledExtensions_Pre($grpc.ServiceCall call, $async.Future<$0.Empty> request) async {
    return listInstalledExtensions(call, await request);
  }

  $async.Future<$0.GetInstalledExtensionRes> getInstalledExtension_Pre($grpc.ServiceCall call, $async.Future<$0.GetInstalledExtensionReq> request) async {
    return getInstalledExtension(call, await request);
  }

  $async.Future<$0.Empty> installExtension_Pre($grpc.ServiceCall call, $async.Future<$0.InstallExtensionReq> request) async {
    return installExtension(call, await request);
  }

  $async.Future<$0.Empty> uninstallExtension_Pre($grpc.ServiceCall call, $async.Future<$0.UninstallExtensionReq> request) async {
    return uninstallExtension(call, await request);
  }

  $async.Future<$0.GetInstallProgressRes> getInstallProgress_Pre($grpc.ServiceCall call, $async.Future<$0.GetInstallProgressReq> request) async {
    return getInstallProgress(call, await request);
  }

  $async.Future<$0.ListRemoteExtensionsRes> listRemoteExtensions_Pre($grpc.ServiceCall call, $async.Future<$0.ListRemoteExtensionsReq> request) async {
    return listRemoteExtensions(call, await request);
  }

  $async.Future<$0.HealthCheckRes> healthCheck_Pre($grpc.ServiceCall call, $async.Future<$0.HealthCheckReq> request) async {
    return healthCheck(call, await request);
  }

  $async.Stream<$0.HealthCheckRes> watchHealth_Pre($grpc.ServiceCall call, $async.Future<$0.HealthCheckReq> request) async* {
    yield* watchHealth(call, await request);
  }

  $async.Stream<$0.LogEntry> watchLogs_Pre($grpc.ServiceCall call, $async.Future<$0.WatchLogsReq> request) async* {
    yield* watchLogs(call, await request);
  }

  $async.Future<$0.GetLogsRes> getLogs_Pre($grpc.ServiceCall call, $async.Future<$0.GetLogsReq> request) async {
    return getLogs(call, await request);
  }

  $async.Future<$0.Empty> setLogLevel_Pre($grpc.ServiceCall call, $async.Future<$0.SetLogLevelReq> request) async {
    return setLogLevel(call, await request);
  }

  $async.Future<$0.GetSiteRes> getSite($grpc.ServiceCall call, $0.GetSiteReq request);
  $async.Future<$0.GetBoardsRes> getBoards($grpc.ServiceCall call, $0.GetBoardsReq request);
  $async.Future<$0.GetThreadInfosRes> getThreadInfos($grpc.ServiceCall call, $0.GetThreadInfosReq request);
  $async.Future<$0.GetThreadPostRes> getThreadPost($grpc.ServiceCall call, $0.GetThreadPostReq request);
  $async.Future<$0.GetRegardingPostsRes> getRegardingPosts($grpc.ServiceCall call, $0.GetRegardingPostsReq request);
  $async.Future<$0.GetCommentsRes> getComments($grpc.ServiceCall call, $0.GetCommentsReq request);
  $async.Future<$0.ListInstalledExtensionsRes> listInstalledExtensions($grpc.ServiceCall call, $0.Empty request);
  $async.Future<$0.GetInstalledExtensionRes> getInstalledExtension($grpc.ServiceCall call, $0.GetInstalledExtensionReq request);
  $async.Future<$0.Empty> installExtension($grpc.ServiceCall call, $0.InstallExtensionReq request);
  $async.Future<$0.Empty> uninstallExtension($grpc.ServiceCall call, $0.UninstallExtensionReq request);
  $async.Future<$0.GetInstallProgressRes> getInstallProgress($grpc.ServiceCall call, $0.GetInstallProgressReq request);
  $async.Future<$0.ListRemoteExtensionsRes> listRemoteExtensions($grpc.ServiceCall call, $0.ListRemoteExtensionsReq request);
  $async.Future<$0.HealthCheckRes> healthCheck($grpc.ServiceCall call, $0.HealthCheckReq request);
  $async.Stream<$0.HealthCheckRes> watchHealth($grpc.ServiceCall call, $0.HealthCheckReq request);
  $async.Stream<$0.LogEntry> watchLogs($grpc.ServiceCall call, $0.WatchLogsReq request);
  $async.Future<$0.GetLogsRes> getLogs($grpc.ServiceCall call, $0.GetLogsReq request);
  $async.Future<$0.Empty> setLogLevel($grpc.ServiceCall call, $0.SetLogLevelReq request);
}
