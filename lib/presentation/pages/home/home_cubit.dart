import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/presentation/components/forms/thread-search/search_mode_notifier.dart';

part 'home_cubit.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default([]) List<Collection> collections,
    String? expandedCollectionId,
    @Default(SidecarConnectionState.uninitialized)
    SidecarConnectionState sidecarStatus,
    String? sidecarMessage,
  }) = _HomeState;

  String get sidecarLabel {
    switch (sidecarStatus) {
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

  Color get sidecarStatusColor {
    switch (sidecarStatus) {
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

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  final CollectionRepository _collectionRepository;
  final SidecarRepository _sidecarRepository;
  final SearchModeNotifier _searchModeNotifier;

  StreamSubscription? _collectionSubscription;
  StreamSubscription? _sidecarSubscription;

  HomeCubit(
    this._collectionRepository,
    this._sidecarRepository,
    this._searchModeNotifier,
  ) : super(const HomeState());

  void triggerSearch() {
    _searchModeNotifier.enterSearchMode();
  }

  void init() {
    _collectionSubscription?.cancel();
    _collectionSubscription = _collectionRepository.watchList().listen((
      collections,
    ) {
      emit(state.copyWith(collections: collections));
    });

    _sidecarSubscription?.cancel();
    _sidecarSubscription = _sidecarRepository.watchHealth().listen(
      (status) =>
          emit(state.copyWith(sidecarStatus: status, sidecarMessage: null)),
      onError: (error) => emit(
        state.copyWith(
          sidecarStatus: SidecarConnectionState.failed,
          sidecarMessage: 'Connection error: $error',
        ),
      ),
    );
  }

  @override
  Future<void> close() {
    _collectionSubscription?.cancel();
    _sidecarSubscription?.cancel();
    return super.close();
  }

  void toggleCollectionExpansion(String collectionId) {
    if (state.expandedCollectionId == collectionId) {
      emit(state.copyWith(expandedCollectionId: null));
    } else {
      emit(state.copyWith(expandedCollectionId: collectionId));
    }
  }
}
