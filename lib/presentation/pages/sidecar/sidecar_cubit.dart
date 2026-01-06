import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/domain/sidecar/service/sidecar_connection_manager.dart';

part 'sidecar_cubit.freezed.dart';

@freezed
class SidecarState with _$SidecarState {
  const SidecarState._();

  const factory SidecarState({
    required SidecarConnectionState status,
    String? message,
  }) = _SidecarState;

  String get label {
    switch (status) {
      case SidecarConnectionState.connected:
        return 'Sidecar: Connected';
      case SidecarConnectionState.connecting:
        return 'Sidecar: Connecting';
      case SidecarConnectionState.retrying:
        return 'Sidecar: Retrying';
      case SidecarConnectionState.uninitialized:
        return 'Sidecar: Uninitialized';
      case SidecarConnectionState.failed:
        return 'Sidecar: Failed';
      case SidecarConnectionState.closed:
        return 'Sidecar: Closed';
    }
  }

  Color get statusColor {
    switch (status) {
      case SidecarConnectionState.connected:
        return Colors.green;
      case SidecarConnectionState.connecting:
      case SidecarConnectionState.retrying:
      case SidecarConnectionState.uninitialized:
        return Colors.orange;
      case SidecarConnectionState.failed:
      case SidecarConnectionState.closed:
        return Colors.red;
    }
  }
}

@injectable
class SidecarCubit extends Cubit<SidecarState> {
  final SidecarRepository _repository;

  StreamSubscription<SidecarConnectionState>? _healthSubscription;

  SidecarCubit(
    this._repository,
  ) : super(const SidecarState(status: SidecarConnectionState.uninitialized));

  void startHealthWatch() {
    _healthSubscription?.cancel();
    _healthSubscription = _repository.watchHealth().listen(
      (status) {
        emit(state.copyWith(
          status: status,
          message: null,
        ));
      },
      onError: (error) {
        emit(state.copyWith(
          status: SidecarConnectionState.failed,
          message: 'Connection error: $error',
        ));
      },
    );
  }

  void updateStatus(SidecarConnectionState status) {
    emit(state.copyWith(status: status));
  }

  @override
  Future<void> close() {
    _healthSubscription?.cancel();
    return super.close();
  }
}
