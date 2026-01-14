import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/collection/repository.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/sidecar/repository.dart';
import 'package:news_hub/presentation/router/router.gr.dart';

part 'home_cubit.freezed.dart';

const DefaultTitle = 'NewsHub';

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(DefaultTitle) String title,
    @Default([]) List<Collection> collections,
    String? expandedCollectionId,
    @Default(SidecarConnectionState.uninitialized)
    SidecarConnectionState sidecarStatus,
    String? sidecarMessage,
    @Default(false) bool isSearchMode,
    RouteData? pendingRoute,
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

  StreamSubscription? _collectionSubscription;
  StreamSubscription? _sidecarSubscription;

  // Search Trigger Stream
  final _searchController = StreamController<void>.broadcast();
  Stream<void> get searchStream => _searchController.stream;

  HomeCubit(this._collectionRepository, this._sidecarRepository)
    : super(const HomeState());

  void triggerSearch() {
    _searchController.add(null);
  }

  void init() {
    _collectionSubscription?.cancel();
    _collectionSubscription = _collectionRepository.watchList().listen((
      collections,
    ) {
      emit(state.copyWith(collections: collections));
      if (state.pendingRoute != null) {
        _updateTitleFromRoute(state.pendingRoute!);
      }
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
    _searchController.close();
    return super.close();
  }

  void handleRouteChanged(RouteData route) {
    emit(state.copyWith(pendingRoute: route));
    _updateTitleFromRoute(route);
  }

  void updateTitle(String title) {
    if (state.title == title) return;
    emit(state.copyWith(title: title));
  }

  void setSearchMode(bool enabled) {
    if (state.isSearchMode == enabled) return;
    emit(state.copyWith(isSearchMode: enabled));
  }

  void toggleCollectionExpansion(String collectionId) {
    if (state.expandedCollectionId == collectionId) {
      emit(state.copyWith(expandedCollectionId: null));
    } else {
      emit(state.copyWith(expandedCollectionId: collectionId));
    }
  }

  void _updateTitleFromRoute(RouteData route) {
    final title = switch (route.name) {
      CollectionThreadListRoute.name => _getTitleForCollectionRoute(route),
      CollectionBoardThreadListRoute.name => _getTitleForBoardRoute(route),
      _ => DefaultTitle,
    };

    // 如果抓到的是預設標題 "NewsHub"，但目前 state 中已經有更具體的標題標題值，則不更新。
    // 這可以防止在頁面返回切換瞬間產生的標題閃爍或遺失。
    if (title == DefaultTitle &&
        state.title != DefaultTitle &&
        route.name != HomeRoute.name) {
      return;
    }

    if (state.title == title) return;
    emit(state.copyWith(title: title));
  }

  String _getTitleForCollectionRoute(RouteData route) {
    final collectionId = _getCollectionIdFromRoute(route);
    final collection = _findCollection(collectionId);

    if (collection != null) return collection.name;
    if (collectionId != null && state.collections.isEmpty) return 'Loading...';
    return DefaultTitle;
  }

  String _getTitleForBoardRoute(RouteData route) {
    final collectionId = _getCollectionIdFromRoute(route);
    final boardId = _getBoardIdFromRoute(route);

    if (collectionId != null && boardId != null) {
      final collection = _findCollection(collectionId);
      if (collection != null) {
        final board = _findBoard(collection, boardId);
        if (board != null) return board.identity.boardName;
        return collection.name;
      }
    }

    if (state.collections.isEmpty) return 'Loading...';
    return DefaultTitle;
  }

  String? _getCollectionIdFromRoute(RouteData route) {
    if (route.args is CollectionThreadListRouteArgs) {
      return (route.args as CollectionThreadListRouteArgs).collectionId;
    } else if (route.args is CollectionBoardThreadListRouteArgs) {
      return (route.args as CollectionBoardThreadListRouteArgs).collectionId;
    }
    return route.pathParams.optString('collectionId');
  }

  String? _getBoardIdFromRoute(RouteData route) {
    if (route.args is CollectionBoardThreadListRouteArgs) {
      return (route.args as CollectionBoardThreadListRouteArgs).boardId;
    }
    return route.pathParams.optString('boardId');
  }

  Collection? _findCollection(String? id) {
    if (id == null || state.collections.isEmpty) return null;
    try {
      return state.collections.firstWhere((c) => c.id == id);
    } catch (e) {
      return null;
    }
  }

  CollectionBoard? _findBoard(Collection collection, String boardId) {
    try {
      return collection.boards.firstWhere((b) => b.identity.boardId == boardId);
    } catch (e) {
      return null;
    }
  }
}
