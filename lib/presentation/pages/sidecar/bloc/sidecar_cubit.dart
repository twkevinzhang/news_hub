import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/api_service.dart';
import 'package:news_hub/domain/models/models.dart';
part 'sidecar_cubit.freezed.dart';

enum SidecarStatus { online, offline, starting }

@freezed
class SidecarState with _$SidecarState {
  const SidecarState._();

  const factory SidecarState({
    required SidecarStatus status,
    String? message,
    @Default([]) List<LogEntry> logs,
    @Default(true) bool autoScroll,
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
  final ApiService _api;
  StreamSubscription<HealthCheckResult>? _healthSubscription;
  StreamSubscription<LogEntry>? _logsSubscription;
  static const int _maxLogs = 1000;

  SidecarCubit(this._api) : super(const SidecarState(status: SidecarStatus.starting));

  void startHealthWatch() {
    _healthSubscription?.cancel();

    _healthSubscription = _api.watchHealth().listen(
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

  void startLogsWatch({LogLevel minLevel = LogLevel.info}) {
    _logsSubscription?.cancel();

    _logsSubscription = _api.watchLogs(minLevel: minLevel).listen(
      (logEntry) {
        final updatedLogs = List<LogEntry>.from(state.logs)..add(logEntry);

        // Keep only last _maxLogs entries
        if (updatedLogs.length > _maxLogs) {
          updatedLogs.removeAt(0);
        }

        emit(state.copyWith(logs: updatedLogs));
      },
      onError: (error) {
        // Log errors could be handled here if needed
      },
    );
  }

  void stopLogsWatch() {
    _logsSubscription?.cancel();
  }

  void clearLogs() {
    emit(state.copyWith(logs: []));
  }

  void toggleAutoScroll() {
    emit(state.copyWith(autoScroll: !state.autoScroll));
  }

  @override
  Future<void> close() {
    _healthSubscription?.cancel();
    _logsSubscription?.cancel();
    return super.close();
  }
}
