import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'sidecar_cubit.freezed.dart';

enum SidecarStatus { online, offline, starting }

@freezed
class SidecarState with _$SidecarState {
  const SidecarState._();

  const factory SidecarState({
    required SidecarStatus status,
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

@lazySingleton
class SidecarCubit extends Cubit<SidecarState> {
  SidecarCubit() : super(const SidecarState(status: SidecarStatus.online));

  void updateStatus(SidecarStatus status) {
    emit(state.copyWith(status: status));
  }
}
