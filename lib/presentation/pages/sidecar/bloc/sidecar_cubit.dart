import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/interactor/watch_health.dart';

part 'sidecar_cubit.freezed.dart';

enum SidecarStatus {
  online,
  offline,
  starting,
}

@freezed
class SidecarState with _$SidecarState {
  const SidecarState._();

  const factory SidecarState({
    required SidecarStatus status,
    String? message,
  }) = _SidecarState;

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

@injectable
class SidecarCubit extends Cubit<SidecarState> {
  final WatchHealthUseCase _watchHealth;

  StreamSubscription<HealthCheckResult>? _healthSubscription;

  SidecarCubit(
    this._watchHealth,
  ) : super(const SidecarState(status: SidecarStatus.starting));

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

  void updateStatus(SidecarStatus status) {
    emit(state.copyWith(status: status));
  }

  @override
  Future<void> close() {
    _healthSubscription?.cancel();
    return super.close();
  }
}
