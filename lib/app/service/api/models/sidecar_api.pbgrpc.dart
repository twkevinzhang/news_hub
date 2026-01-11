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

import 'domain_models.pb.dart' as $1;
import 'sidecar_api.pb.dart' as $0;

export 'sidecar_api.pb.dart';

@$pb.GrpcServiceName('news_hub.sidecar.SidecarApi')
class SidecarApiClient extends $grpc.Client {
  static final _$getBoards = $grpc.ClientMethod<$0.GetBoardsReq, $0.GetBoardsRes>(
      '/news_hub.sidecar.SidecarApi/GetBoards',
      ($0.GetBoardsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBoardsRes.fromBuffer(value));
  static final _$getThreads = $grpc.ClientMethod<$0.GetThreadsReq, $0.GetThreadsRes>(
      '/news_hub.sidecar.SidecarApi/GetThreads',
      ($0.GetThreadsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetThreadsRes.fromBuffer(value));
  static final _$getOriginalPost = $grpc.ClientMethod<$0.GetOriginalPostReq, $0.GetOriginalPostRes>(
      '/news_hub.sidecar.SidecarApi/GetOriginalPost',
      ($0.GetOriginalPostReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetOriginalPostRes.fromBuffer(value));
  static final _$getReplies = $grpc.ClientMethod<$0.GetRepliesReq, $0.GetRepliesRes>(
      '/news_hub.sidecar.SidecarApi/GetReplies',
      ($0.GetRepliesReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetRepliesRes.fromBuffer(value));
  static final _$getComments = $grpc.ClientMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
      '/news_hub.sidecar.SidecarApi/GetComments',
      ($0.GetCommentsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetCommentsRes.fromBuffer(value));
  static final _$getBoardSortOptions = $grpc.ClientMethod<$0.GetBoardSortOptionsReq, $0.GetBoardSortOptionsRes>(
      '/news_hub.sidecar.SidecarApi/GetBoardSortOptions',
      ($0.GetBoardSortOptionsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetBoardSortOptionsRes.fromBuffer(value));
  static final _$listInstalledExtensions = $grpc.ClientMethod<$1.Empty, $0.ListInstalledExtensionsRes>(
      '/news_hub.sidecar.SidecarApi/ListInstalledExtensions',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListInstalledExtensionsRes.fromBuffer(value));
  static final _$getInstalledExtension = $grpc.ClientMethod<$0.GetInstalledExtensionReq, $0.GetInstalledExtensionRes>(
      '/news_hub.sidecar.SidecarApi/GetInstalledExtension',
      ($0.GetInstalledExtensionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetInstalledExtensionRes.fromBuffer(value));
  static final _$installExtension = $grpc.ClientMethod<$0.InstallExtensionReq, $1.Empty>(
      '/news_hub.sidecar.SidecarApi/InstallExtension',
      ($0.InstallExtensionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$uninstallExtension = $grpc.ClientMethod<$0.UninstallExtensionReq, $1.Empty>(
      '/news_hub.sidecar.SidecarApi/UninstallExtension',
      ($0.UninstallExtensionReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$getInstallProgress = $grpc.ClientMethod<$0.GetInstallProgressReq, $0.GetInstallProgressRes>(
      '/news_hub.sidecar.SidecarApi/GetInstallProgress',
      ($0.GetInstallProgressReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetInstallProgressRes.fromBuffer(value));
  static final _$listRemoteExtensions = $grpc.ClientMethod<$0.ListRemoteExtensionsReq, $0.ListRemoteExtensionsRes>(
      '/news_hub.sidecar.SidecarApi/ListRemoteExtensions',
      ($0.ListRemoteExtensionsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListRemoteExtensionsRes.fromBuffer(value));
  static final _$listExtensionRepos = $grpc.ClientMethod<$1.Empty, $0.ListExtensionReposRes>(
      '/news_hub.sidecar.SidecarApi/ListExtensionRepos',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ListExtensionReposRes.fromBuffer(value));
  static final _$addExtensionRepo = $grpc.ClientMethod<$0.AddExtensionRepoReq, $0.AddExtensionRepoRes>(
      '/news_hub.sidecar.SidecarApi/AddExtensionRepo',
      ($0.AddExtensionRepoReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddExtensionRepoRes.fromBuffer(value));
  static final _$removeExtensionRepo = $grpc.ClientMethod<$0.RemoveExtensionRepoReq, $1.Empty>(
      '/news_hub.sidecar.SidecarApi/RemoveExtensionRepo',
      ($0.RemoveExtensionRepoReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));
  static final _$healthCheck = $grpc.ClientMethod<$0.HealthCheckReq, $0.HealthCheckRes>(
      '/news_hub.sidecar.SidecarApi/HealthCheck',
      ($0.HealthCheckReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HealthCheckRes.fromBuffer(value));
  static final _$watchHealth = $grpc.ClientMethod<$0.HealthCheckReq, $0.HealthCheckRes>(
      '/news_hub.sidecar.SidecarApi/WatchHealth',
      ($0.HealthCheckReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.HealthCheckRes.fromBuffer(value));
  static final _$watchLogs = $grpc.ClientMethod<$0.WatchLogsReq, $1.LogEntry>(
      '/news_hub.sidecar.SidecarApi/WatchLogs',
      ($0.WatchLogsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.LogEntry.fromBuffer(value));
  static final _$getLogs = $grpc.ClientMethod<$0.GetLogsReq, $0.GetLogsRes>(
      '/news_hub.sidecar.SidecarApi/GetLogs',
      ($0.GetLogsReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetLogsRes.fromBuffer(value));
  static final _$setLogLevel = $grpc.ClientMethod<$0.SetLogLevelReq, $1.Empty>(
      '/news_hub.sidecar.SidecarApi/SetLogLevel',
      ($0.SetLogLevelReq value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Empty.fromBuffer(value));

  SidecarApiClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetBoardsRes> getBoards($0.GetBoardsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBoards, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetThreadsRes> getThreads($0.GetThreadsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getThreads, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetOriginalPostRes> getOriginalPost($0.GetOriginalPostReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getOriginalPost, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetRepliesRes> getReplies($0.GetRepliesReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getReplies, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetCommentsRes> getComments($0.GetCommentsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getComments, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetBoardSortOptionsRes> getBoardSortOptions($0.GetBoardSortOptionsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getBoardSortOptions, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListInstalledExtensionsRes> listInstalledExtensions($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listInstalledExtensions, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetInstalledExtensionRes> getInstalledExtension($0.GetInstalledExtensionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInstalledExtension, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> installExtension($0.InstallExtensionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$installExtension, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> uninstallExtension($0.UninstallExtensionReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$uninstallExtension, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetInstallProgressRes> getInstallProgress($0.GetInstallProgressReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getInstallProgress, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListRemoteExtensionsRes> listRemoteExtensions($0.ListRemoteExtensionsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listRemoteExtensions, request, options: options);
  }

  $grpc.ResponseFuture<$0.ListExtensionReposRes> listExtensionRepos($1.Empty request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$listExtensionRepos, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddExtensionRepoRes> addExtensionRepo($0.AddExtensionRepoReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addExtensionRepo, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> removeExtensionRepo($0.RemoveExtensionRepoReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$removeExtensionRepo, request, options: options);
  }

  $grpc.ResponseFuture<$0.HealthCheckRes> healthCheck($0.HealthCheckReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$healthCheck, request, options: options);
  }

  $grpc.ResponseStream<$0.HealthCheckRes> watchHealth($0.HealthCheckReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$watchHealth, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseStream<$1.LogEntry> watchLogs($0.WatchLogsReq request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$watchLogs, $async.Stream.fromIterable([request]), options: options);
  }

  $grpc.ResponseFuture<$0.GetLogsRes> getLogs($0.GetLogsReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLogs, request, options: options);
  }

  $grpc.ResponseFuture<$1.Empty> setLogLevel($0.SetLogLevelReq request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$setLogLevel, request, options: options);
  }
}

@$pb.GrpcServiceName('news_hub.sidecar.SidecarApi')
abstract class SidecarApiServiceBase extends $grpc.Service {
  $core.String get $name => 'news_hub.sidecar.SidecarApi';

  SidecarApiServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetBoardsReq, $0.GetBoardsRes>(
        'GetBoards',
        getBoards_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBoardsReq.fromBuffer(value),
        ($0.GetBoardsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetThreadsReq, $0.GetThreadsRes>(
        'GetThreads',
        getThreads_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetThreadsReq.fromBuffer(value),
        ($0.GetThreadsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetOriginalPostReq, $0.GetOriginalPostRes>(
        'GetOriginalPost',
        getOriginalPost_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetOriginalPostReq.fromBuffer(value),
        ($0.GetOriginalPostRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetRepliesReq, $0.GetRepliesRes>(
        'GetReplies',
        getReplies_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetRepliesReq.fromBuffer(value),
        ($0.GetRepliesRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetCommentsReq, $0.GetCommentsRes>(
        'GetComments',
        getComments_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetCommentsReq.fromBuffer(value),
        ($0.GetCommentsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetBoardSortOptionsReq, $0.GetBoardSortOptionsRes>(
        'GetBoardSortOptions',
        getBoardSortOptions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetBoardSortOptionsReq.fromBuffer(value),
        ($0.GetBoardSortOptionsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListInstalledExtensionsRes>(
        'ListInstalledExtensions',
        listInstalledExtensions_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListInstalledExtensionsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetInstalledExtensionReq, $0.GetInstalledExtensionRes>(
        'GetInstalledExtension',
        getInstalledExtension_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetInstalledExtensionReq.fromBuffer(value),
        ($0.GetInstalledExtensionRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.InstallExtensionReq, $1.Empty>(
        'InstallExtension',
        installExtension_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.InstallExtensionReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UninstallExtensionReq, $1.Empty>(
        'UninstallExtension',
        uninstallExtension_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UninstallExtensionReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$1.Empty, $0.ListExtensionReposRes>(
        'ListExtensionRepos',
        listExtensionRepos_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($0.ListExtensionReposRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AddExtensionRepoReq, $0.AddExtensionRepoRes>(
        'AddExtensionRepo',
        addExtensionRepo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddExtensionRepoReq.fromBuffer(value),
        ($0.AddExtensionRepoRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.RemoveExtensionRepoReq, $1.Empty>(
        'RemoveExtensionRepo',
        removeExtensionRepo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.RemoveExtensionRepoReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.WatchLogsReq, $1.LogEntry>(
        'WatchLogs',
        watchLogs_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.WatchLogsReq.fromBuffer(value),
        ($1.LogEntry value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetLogsReq, $0.GetLogsRes>(
        'GetLogs',
        getLogs_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetLogsReq.fromBuffer(value),
        ($0.GetLogsRes value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.SetLogLevelReq, $1.Empty>(
        'SetLogLevel',
        setLogLevel_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.SetLogLevelReq.fromBuffer(value),
        ($1.Empty value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetBoardsRes> getBoards_Pre($grpc.ServiceCall call, $async.Future<$0.GetBoardsReq> request) async {
    return getBoards(call, await request);
  }

  $async.Future<$0.GetThreadsRes> getThreads_Pre($grpc.ServiceCall call, $async.Future<$0.GetThreadsReq> request) async {
    return getThreads(call, await request);
  }

  $async.Future<$0.GetOriginalPostRes> getOriginalPost_Pre($grpc.ServiceCall call, $async.Future<$0.GetOriginalPostReq> request) async {
    return getOriginalPost(call, await request);
  }

  $async.Future<$0.GetRepliesRes> getReplies_Pre($grpc.ServiceCall call, $async.Future<$0.GetRepliesReq> request) async {
    return getReplies(call, await request);
  }

  $async.Future<$0.GetCommentsRes> getComments_Pre($grpc.ServiceCall call, $async.Future<$0.GetCommentsReq> request) async {
    return getComments(call, await request);
  }

  $async.Future<$0.GetBoardSortOptionsRes> getBoardSortOptions_Pre($grpc.ServiceCall call, $async.Future<$0.GetBoardSortOptionsReq> request) async {
    return getBoardSortOptions(call, await request);
  }

  $async.Future<$0.ListInstalledExtensionsRes> listInstalledExtensions_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return listInstalledExtensions(call, await request);
  }

  $async.Future<$0.GetInstalledExtensionRes> getInstalledExtension_Pre($grpc.ServiceCall call, $async.Future<$0.GetInstalledExtensionReq> request) async {
    return getInstalledExtension(call, await request);
  }

  $async.Future<$1.Empty> installExtension_Pre($grpc.ServiceCall call, $async.Future<$0.InstallExtensionReq> request) async {
    return installExtension(call, await request);
  }

  $async.Future<$1.Empty> uninstallExtension_Pre($grpc.ServiceCall call, $async.Future<$0.UninstallExtensionReq> request) async {
    return uninstallExtension(call, await request);
  }

  $async.Future<$0.GetInstallProgressRes> getInstallProgress_Pre($grpc.ServiceCall call, $async.Future<$0.GetInstallProgressReq> request) async {
    return getInstallProgress(call, await request);
  }

  $async.Future<$0.ListRemoteExtensionsRes> listRemoteExtensions_Pre($grpc.ServiceCall call, $async.Future<$0.ListRemoteExtensionsReq> request) async {
    return listRemoteExtensions(call, await request);
  }

  $async.Future<$0.ListExtensionReposRes> listExtensionRepos_Pre($grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return listExtensionRepos(call, await request);
  }

  $async.Future<$0.AddExtensionRepoRes> addExtensionRepo_Pre($grpc.ServiceCall call, $async.Future<$0.AddExtensionRepoReq> request) async {
    return addExtensionRepo(call, await request);
  }

  $async.Future<$1.Empty> removeExtensionRepo_Pre($grpc.ServiceCall call, $async.Future<$0.RemoveExtensionRepoReq> request) async {
    return removeExtensionRepo(call, await request);
  }

  $async.Future<$0.HealthCheckRes> healthCheck_Pre($grpc.ServiceCall call, $async.Future<$0.HealthCheckReq> request) async {
    return healthCheck(call, await request);
  }

  $async.Stream<$0.HealthCheckRes> watchHealth_Pre($grpc.ServiceCall call, $async.Future<$0.HealthCheckReq> request) async* {
    yield* watchHealth(call, await request);
  }

  $async.Stream<$1.LogEntry> watchLogs_Pre($grpc.ServiceCall call, $async.Future<$0.WatchLogsReq> request) async* {
    yield* watchLogs(call, await request);
  }

  $async.Future<$0.GetLogsRes> getLogs_Pre($grpc.ServiceCall call, $async.Future<$0.GetLogsReq> request) async {
    return getLogs(call, await request);
  }

  $async.Future<$1.Empty> setLogLevel_Pre($grpc.ServiceCall call, $async.Future<$0.SetLogLevelReq> request) async {
    return setLogLevel(call, await request);
  }

  $async.Future<$0.GetBoardsRes> getBoards($grpc.ServiceCall call, $0.GetBoardsReq request);
  $async.Future<$0.GetThreadsRes> getThreads($grpc.ServiceCall call, $0.GetThreadsReq request);
  $async.Future<$0.GetOriginalPostRes> getOriginalPost($grpc.ServiceCall call, $0.GetOriginalPostReq request);
  $async.Future<$0.GetRepliesRes> getReplies($grpc.ServiceCall call, $0.GetRepliesReq request);
  $async.Future<$0.GetCommentsRes> getComments($grpc.ServiceCall call, $0.GetCommentsReq request);
  $async.Future<$0.GetBoardSortOptionsRes> getBoardSortOptions($grpc.ServiceCall call, $0.GetBoardSortOptionsReq request);
  $async.Future<$0.ListInstalledExtensionsRes> listInstalledExtensions($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.GetInstalledExtensionRes> getInstalledExtension($grpc.ServiceCall call, $0.GetInstalledExtensionReq request);
  $async.Future<$1.Empty> installExtension($grpc.ServiceCall call, $0.InstallExtensionReq request);
  $async.Future<$1.Empty> uninstallExtension($grpc.ServiceCall call, $0.UninstallExtensionReq request);
  $async.Future<$0.GetInstallProgressRes> getInstallProgress($grpc.ServiceCall call, $0.GetInstallProgressReq request);
  $async.Future<$0.ListRemoteExtensionsRes> listRemoteExtensions($grpc.ServiceCall call, $0.ListRemoteExtensionsReq request);
  $async.Future<$0.ListExtensionReposRes> listExtensionRepos($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$0.AddExtensionRepoRes> addExtensionRepo($grpc.ServiceCall call, $0.AddExtensionRepoReq request);
  $async.Future<$1.Empty> removeExtensionRepo($grpc.ServiceCall call, $0.RemoveExtensionRepoReq request);
  $async.Future<$0.HealthCheckRes> healthCheck($grpc.ServiceCall call, $0.HealthCheckReq request);
  $async.Stream<$0.HealthCheckRes> watchHealth($grpc.ServiceCall call, $0.HealthCheckReq request);
  $async.Stream<$1.LogEntry> watchLogs($grpc.ServiceCall call, $0.WatchLogsReq request);
  $async.Future<$0.GetLogsRes> getLogs($grpc.ServiceCall call, $0.GetLogsReq request);
  $async.Future<$1.Empty> setLogLevel($grpc.ServiceCall call, $0.SetLogLevelReq request);
}
