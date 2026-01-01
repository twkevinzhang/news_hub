import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

enum SidecarStatus { online, offline, starting }

class SidecarState {
  final SidecarStatus status;
  final String label;

  SidecarState({required this.status, required this.label});
}

@lazySingleton
class SidecarCubit extends Cubit<SidecarState> {
  SidecarCubit() : super(SidecarState(status: SidecarStatus.online, label: 'Sidecar: Online'));

  void updateStatus(SidecarStatus status) {
    String label = 'Sidecar: Offline';
    if (status == SidecarStatus.online) label = 'Sidecar: Online';
    if (status == SidecarStatus.starting) label = 'Sidecar: Starting';
    emit(SidecarState(status: status, label: label));
  }
}
