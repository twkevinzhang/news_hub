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

@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default('NewsHub') String title,
    @Default([]) List<Collection> collections,
    String? expandedCollectionId,
    @Default(SidecarConnectionState.uninitialized)
    SidecarConnectionState sidecarStatus,
    String? sidecarMessage,
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

  HomeCubit(this._collectionRepository, this._sidecarRepository)
    : super(const HomeState());

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

  void toggleCollectionExpansion(String collectionId) {
    if (state.expandedCollectionId == collectionId) {
      emit(state.copyWith(expandedCollectionId: null));
    } else {
      emit(state.copyWith(expandedCollectionId: collectionId));
    }
  }

  void navigateToFirstCollection(StackRouter router) {
    if (state.collections.isEmpty) return;

    final firstCollection = state.collections.first;
    router.replace(CollectionThreadListRoute(collectionId: firstCollection.id));
  }

  void _updateTitleFromRoute(RouteData route) {
    final title = switch (route.name) {
      'CollectionThreadListRoute' => _getTitleForCollectionRoute(route),
      'CollectionBoardThreadListRoute' => _getTitleForBoardRoute(route),
      _ => _getTitleFromRouteName(route.name),
    };

    if (state.title == title) return;
    emit(state.copyWith(title: title));
  }

  String _getTitleForCollectionRoute(RouteData route) {
    final collectionId = _getCollectionIdFromRoute(route);
    final collection = _findCollection(collectionId);

    if (collection != null) return collection.name;
    if (collectionId != null && state.collections.isEmpty) return 'Loading...';
    return 'NewsHub';
  }

  String _getTitleForBoardRoute(RouteData route) {
    final collectionId = _getCollectionIdFromRoute(route);
    final boardId = _getBoardIdFromRoute(route);
    final collection = _findCollection(collectionId);

    if (collection != null && boardId != null) {
      final board = _findBoard(collection, boardId);
      if (board != null) return board.identity.boardName;
      return collection.name;
    }

    if (collectionId != null && state.collections.isEmpty) return 'Loading...';
    return 'NewsHub';
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

  String _getTitleFromRouteName(String routeName) {
    const titleMap = {
      'CreateCollectionRoute': '建立收藏',
      'CollectionCreateRoute': '建立收藏',
      'CollectionEditRoute': '編輯收藏',
      'CollectionThreadListRoute': 'NewsHub',
      'CollectionBoardThreadListRoute': 'NewsHub',
      'SidecarLogsRoute': 'Sidecar Logs',
      'SettingsRoute': '設定',
      'SearchRoute': '搜尋',
      'CollectionManageRoute': '管理收藏',
      'ExtensionManageRoute': '管理擴充功能',
      'SidecarManageRoute': 'Sidecar 設定',
    };
    return titleMap[routeName] ?? 'NewsHub';
  }
}
