import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/interactor/watch_health.dart';

part 'sidecar_cubit.freezed.dart';

/// Sidecar 服務狀態
///
/// 表示 Sidecar 服務的連線和運作狀態
enum SidecarStatus {
  /// 線上，服務正常運作
  online,

  /// 離線，服務無法連線
  offline,

  /// 啟動中，服務正在初始化
  starting,
}

/// Sidecar 健康狀態的 State
///
/// 包含 Sidecar 服務的健康狀態和相關訊息。
/// 此 State 專注於健康監控，日誌相關功能由 [SidecarLogsCubit] 管理。
@freezed
class SidecarState with _$SidecarState {
  const SidecarState._();

  const factory SidecarState({
    required SidecarStatus status,
    String? message,
  }) = _SidecarState;

  /// 狀態顯示文字
  String get label {
    switch (status) {
      case SidecarStatus.online:
        return 'Sidecar: Online';
      case SidecarStatus.offline:
        return 'Sidecar: Offline';
      case SidecarStatus.starting:
        return 'Sidecar: Starting';
    }
  }

  /// 狀態指示顏色
  Color get statusColor {
    switch (status) {
      case SidecarStatus.online:
        return Colors.green;
      case SidecarStatus.starting:
        return Colors.orange;
      case SidecarStatus.offline:
        return Colors.red;
    }
  }
}

/// Sidecar 健康狀態管理 Cubit
///
/// 負責監聽和管理 Sidecar 服務的健康狀態。
/// 使用 [WatchHealthUseCase] 從 Domain 層獲取健康狀態，遵循 DDD 原則。
///
/// 職責：
/// - 監聽 Sidecar 健康狀態變更
/// - 映射 Domain 模型到 Presentation 狀態
/// - 處理連線錯誤
@injectable
class SidecarCubit extends Cubit<SidecarState> {
  final WatchHealthUseCase _watchHealth;
  StreamSubscription<HealthCheckResult>? _healthSubscription;

  SidecarCubit(this._watchHealth)
      : super(const SidecarState(status: SidecarStatus.starting));

  /// 開始監聽 Sidecar 健康狀態
  ///
  /// 訂閱健康狀態串流，當狀態變更時自動更新 UI。
  /// 如果已有訂閱，會先取消舊訂閱再建立新訂閱。
  void startHealthWatch() {
    _healthSubscription?.cancel();

    _healthSubscription = _watchHealth().listen(
      (response) {
        final status = _mapHealthStatus(response.status);
        emit(state.copyWith(
          status: status,
          message: response.message,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          status: SidecarStatus.offline,
          message: 'Connection error: $error',
        ));
      },
    );
  }

  /// 映射 Domain 層的 ServingStatus 到 Presentation 層的 SidecarStatus
  SidecarStatus _mapHealthStatus(ServingStatus status) {
    switch (status) {
      case ServingStatus.serving:
        return SidecarStatus.online;
      case ServingStatus.notServing:
        return SidecarStatus.offline;
      default:
        return SidecarStatus.starting;
    }
  }

  /// 手動更新狀態（用於測試或特殊情況）
  void updateStatus(SidecarStatus status) {
    emit(state.copyWith(status: status));
  }

  @override
  Future<void> close() {
    _healthSubscription?.cancel();
    return super.close();
  }
}
