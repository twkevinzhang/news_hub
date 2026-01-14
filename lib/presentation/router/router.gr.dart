// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:news_hub/domain/models/models.dart' as _i17;
import 'package:news_hub/presentation/pages/collection/:collectionId/boards/:boardId/threads/list/collection_board_thread_list_screen.dart'
    as _i1;
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/collection_thread_list_screen.dart'
    as _i5;
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/search/result/search_result_screen.dart'
    as _i9;
import 'package:news_hub/presentation/pages/collection/create/view/collection_create_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/collection/edit/view/collection_create_screen.dart'
    as _i3;
import 'package:news_hub/presentation/pages/home/home_empty_screen.dart' as _i7;
import 'package:news_hub/presentation/pages/home/home_screen.dart' as _i8;
import 'package:news_hub/presentation/pages/settings/collections/view/collection_manage_screen.dart'
    as _i4;
import 'package:news_hub/presentation/pages/settings/extensions/view/extension_manage_screen.dart'
    as _i6;
import 'package:news_hub/presentation/pages/settings/settings_screen.dart'
    as _i10;
import 'package:news_hub/presentation/pages/settings/sidecar/sidecar_manage_screen.dart'
    as _i12;
import 'package:news_hub/presentation/pages/sidecar/logs/sidecar_logs_screen.dart'
    as _i11;
import 'package:news_hub/presentation/pages/thread/detail/view/thread_detail_screen.dart'
    as _i13;
import 'package:news_hub/presentation/router/wrapper_screen.dart' as _i14;

/// generated route for
/// [_i1.CollectionBoardThreadListScreen]
class CollectionBoardThreadListRoute
    extends _i15.PageRouteInfo<CollectionBoardThreadListRouteArgs> {
  CollectionBoardThreadListRoute({
    _i16.Key? key,
    required String collectionId,
    required String boardId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         CollectionBoardThreadListRoute.name,
         args: CollectionBoardThreadListRouteArgs(
           key: key,
           collectionId: collectionId,
           boardId: boardId,
         ),
         rawPathParams: {'collectionId': collectionId, 'boardId': boardId},
         initialChildren: children,
       );

  static const String name = 'CollectionBoardThreadListRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CollectionBoardThreadListRouteArgs>(
        orElse: () => CollectionBoardThreadListRouteArgs(
          collectionId: pathParams.getString('collectionId'),
          boardId: pathParams.getString('boardId'),
        ),
      );
      return _i15.WrappedRoute(
        child: _i1.CollectionBoardThreadListScreen(
          key: args.key,
          collectionId: args.collectionId,
          boardId: args.boardId,
        ),
      );
    },
  );
}

class CollectionBoardThreadListRouteArgs {
  const CollectionBoardThreadListRouteArgs({
    this.key,
    required this.collectionId,
    required this.boardId,
  });

  final _i16.Key? key;

  final String collectionId;

  final String boardId;

  @override
  String toString() {
    return 'CollectionBoardThreadListRouteArgs{key: $key, collectionId: $collectionId, boardId: $boardId}';
  }
}

/// generated route for
/// [_i2.CollectionCreateScreen]
class CollectionCreateRoute extends _i15.PageRouteInfo<void> {
  const CollectionCreateRoute({List<_i15.PageRouteInfo>? children})
    : super(CollectionCreateRoute.name, initialChildren: children);

  static const String name = 'CollectionCreateRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i2.CollectionCreateScreen());
    },
  );
}

/// generated route for
/// [_i3.CollectionEditScreen]
class CollectionEditRoute extends _i15.PageRouteInfo<CollectionEditRouteArgs> {
  CollectionEditRoute({
    _i16.Key? key,
    required _i17.Collection initialCollection,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         CollectionEditRoute.name,
         args: CollectionEditRouteArgs(
           key: key,
           initialCollection: initialCollection,
         ),
         initialChildren: children,
       );

  static const String name = 'CollectionEditRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionEditRouteArgs>();
      return _i15.WrappedRoute(
        child: _i3.CollectionEditScreen(
          key: args.key,
          initialCollection: args.initialCollection,
        ),
      );
    },
  );
}

class CollectionEditRouteArgs {
  const CollectionEditRouteArgs({this.key, required this.initialCollection});

  final _i16.Key? key;

  final _i17.Collection initialCollection;

  @override
  String toString() {
    return 'CollectionEditRouteArgs{key: $key, initialCollection: $initialCollection}';
  }
}

/// generated route for
/// [_i4.CollectionManageScreen]
class CollectionManageRoute extends _i15.PageRouteInfo<void> {
  const CollectionManageRoute({List<_i15.PageRouteInfo>? children})
    : super(CollectionManageRoute.name, initialChildren: children);

  static const String name = 'CollectionManageRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i4.CollectionManageScreen());
    },
  );
}

/// generated route for
/// [_i5.CollectionThreadListScreen]
class CollectionThreadListRoute
    extends _i15.PageRouteInfo<CollectionThreadListRouteArgs> {
  CollectionThreadListRoute({
    _i16.Key? key,
    required String collectionId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         CollectionThreadListRoute.name,
         args: CollectionThreadListRouteArgs(
           key: key,
           collectionId: collectionId,
         ),
         rawPathParams: {'collectionId': collectionId},
         initialChildren: children,
       );

  static const String name = 'CollectionThreadListRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final pathParams = data.inheritedPathParams;
      final args = data.argsAs<CollectionThreadListRouteArgs>(
        orElse: () => CollectionThreadListRouteArgs(
          collectionId: pathParams.getString('collectionId'),
        ),
      );
      return _i15.WrappedRoute(
        child: _i5.CollectionThreadListScreen(
          key: args.key,
          collectionId: args.collectionId,
        ),
      );
    },
  );
}

class CollectionThreadListRouteArgs {
  const CollectionThreadListRouteArgs({this.key, required this.collectionId});

  final _i16.Key? key;

  final String collectionId;

  @override
  String toString() {
    return 'CollectionThreadListRouteArgs{key: $key, collectionId: $collectionId}';
  }
}

/// generated route for
/// [_i6.ExtensionManageScreen]
class ExtensionManageRoute extends _i15.PageRouteInfo<void> {
  const ExtensionManageRoute({List<_i15.PageRouteInfo>? children})
    : super(ExtensionManageRoute.name, initialChildren: children);

  static const String name = 'ExtensionManageRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return _i15.WrappedRoute(child: const _i6.ExtensionManageScreen());
    },
  );
}

/// generated route for
/// [_i7.HomeEmptyScreen]
class HomeEmptyRoute extends _i15.PageRouteInfo<void> {
  const HomeEmptyRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeEmptyRoute.name, initialChildren: children);

  static const String name = 'HomeEmptyRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeEmptyScreen();
    },
  );
}

/// generated route for
/// [_i8.HomeScreen]
class HomeRoute extends _i15.PageRouteInfo<void> {
  const HomeRoute({List<_i15.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i8.HomeScreen();
    },
  );
}

/// generated route for
/// [_i9.SearchResultScreen]
class SearchResultRoute extends _i15.PageRouteInfo<SearchResultRouteArgs> {
  SearchResultRoute({
    _i16.Key? key,
    required String collectionId,
    required _i17.ThreadsFilter filter,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         SearchResultRoute.name,
         args: SearchResultRouteArgs(
           key: key,
           collectionId: collectionId,
           filter: filter,
         ),
         initialChildren: children,
       );

  static const String name = 'SearchResultRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchResultRouteArgs>();
      return _i9.SearchResultScreen(
        key: args.key,
        collectionId: args.collectionId,
        filter: args.filter,
      );
    },
  );
}

class SearchResultRouteArgs {
  const SearchResultRouteArgs({
    this.key,
    required this.collectionId,
    required this.filter,
  });

  final _i16.Key? key;

  final String collectionId;

  final _i17.ThreadsFilter filter;

  @override
  String toString() {
    return 'SearchResultRouteArgs{key: $key, collectionId: $collectionId, filter: $filter}';
  }
}

/// generated route for
/// [_i10.SettingsScreen]
class SettingsRoute extends _i15.PageRouteInfo<void> {
  const SettingsRoute({List<_i15.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i10.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i11.SidecarLogsScreen]
class SidecarLogsRoute extends _i15.PageRouteInfo<void> {
  const SidecarLogsRoute({List<_i15.PageRouteInfo>? children})
    : super(SidecarLogsRoute.name, initialChildren: children);

  static const String name = 'SidecarLogsRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i11.SidecarLogsScreen();
    },
  );
}

/// generated route for
/// [_i12.SidecarManageScreen]
class SidecarManageRoute extends _i15.PageRouteInfo<void> {
  const SidecarManageRoute({List<_i15.PageRouteInfo>? children})
    : super(SidecarManageRoute.name, initialChildren: children);

  static const String name = 'SidecarManageRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i12.SidecarManageScreen();
    },
  );
}

/// generated route for
/// [_i13.ThreadDetailScreen]
class ThreadDetailRoute extends _i15.PageRouteInfo<ThreadDetailRouteArgs> {
  ThreadDetailRoute({
    _i16.Key? key,
    required String threadId,
    required String extensionPkgName,
    required String boardId,
    List<_i15.PageRouteInfo>? children,
  }) : super(
         ThreadDetailRoute.name,
         args: ThreadDetailRouteArgs(
           key: key,
           threadId: threadId,
           extensionPkgName: extensionPkgName,
           boardId: boardId,
         ),
         initialChildren: children,
       );

  static const String name = 'ThreadDetailRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadDetailRouteArgs>();
      return _i15.WrappedRoute(
        child: _i13.ThreadDetailScreen(
          key: args.key,
          threadId: args.threadId,
          extensionPkgName: args.extensionPkgName,
          boardId: args.boardId,
        ),
      );
    },
  );
}

class ThreadDetailRouteArgs {
  const ThreadDetailRouteArgs({
    this.key,
    required this.threadId,
    required this.extensionPkgName,
    required this.boardId,
  });

  final _i16.Key? key;

  final String threadId;

  final String extensionPkgName;

  final String boardId;

  @override
  String toString() {
    return 'ThreadDetailRouteArgs{key: $key, threadId: $threadId, extensionPkgName: $extensionPkgName, boardId: $boardId}';
  }
}

/// generated route for
/// [_i14.WrapperScreen]
class WrapperRoute extends _i15.PageRouteInfo<void> {
  const WrapperRoute({List<_i15.PageRouteInfo>? children})
    : super(WrapperRoute.name, initialChildren: children);

  static const String name = 'WrapperRoute';

  static _i15.PageInfo page = _i15.PageInfo(
    name,
    builder: (data) {
      return const _i14.WrapperScreen();
    },
  );
}
