// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i14;
import 'package:flutter/material.dart' as _i15;
import 'package:news_hub/domain/models/models.dart' as _i16;
import 'package:news_hub/presentation/pages/collection/:collectionId/boards/:boardId/threads/list/collection_board_thread_list_screen.dart'
    as _i1;
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/list/collection_thread_list_screen.dart'
    as _i5;
import 'package:news_hub/presentation/pages/collection/:collectionId/threads/search/view/search_screen.dart'
    as _i8;
import 'package:news_hub/presentation/pages/collection/create/view/collection_create_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/collection/edit/view/collection_create_screen.dart'
    as _i3;
import 'package:news_hub/presentation/pages/settings/collections/view/collection_manage_screen.dart'
    as _i4;
import 'package:news_hub/presentation/pages/settings/extensions/view/extension_manage_screen.dart'
    as _i6;
import 'package:news_hub/presentation/pages/settings/settings_screen.dart'
    as _i9;
import 'package:news_hub/presentation/pages/settings/sidecar/sidecar_manage_screen.dart'
    as _i11;
import 'package:news_hub/presentation/pages/shell/home_screen.dart' as _i7;
import 'package:news_hub/presentation/pages/sidecar/logs/sidecar_logs_screen.dart'
    as _i10;
import 'package:news_hub/presentation/pages/thread/detail/view/thread_detail_screen.dart'
    as _i12;
import 'package:news_hub/presentation/router/wrapper_screen.dart' as _i13;

/// generated route for
/// [_i1.CollectionBoardThreadListScreen]
class CollectionBoardThreadListRoute extends _i14.PageRouteInfo<void> {
  const CollectionBoardThreadListRoute({List<_i14.PageRouteInfo>? children})
    : super(CollectionBoardThreadListRoute.name, initialChildren: children);

  static const String name = 'CollectionBoardThreadListRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.WrappedRoute(
        child: const _i1.CollectionBoardThreadListScreen(),
      );
    },
  );
}

/// generated route for
/// [_i2.CollectionCreateScreen]
class CollectionCreateRoute extends _i14.PageRouteInfo<void> {
  const CollectionCreateRoute({List<_i14.PageRouteInfo>? children})
    : super(CollectionCreateRoute.name, initialChildren: children);

  static const String name = 'CollectionCreateRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.WrappedRoute(child: const _i2.CollectionCreateScreen());
    },
  );
}

/// generated route for
/// [_i3.CollectionEditScreen]
class CollectionEditRoute extends _i14.PageRouteInfo<CollectionEditRouteArgs> {
  CollectionEditRoute({
    _i15.Key? key,
    required _i16.Collection initialCollection,
    List<_i14.PageRouteInfo>? children,
  }) : super(
         CollectionEditRoute.name,
         args: CollectionEditRouteArgs(
           key: key,
           initialCollection: initialCollection,
         ),
         initialChildren: children,
       );

  static const String name = 'CollectionEditRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionEditRouteArgs>();
      return _i14.WrappedRoute(
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

  final _i15.Key? key;

  final _i16.Collection initialCollection;

  @override
  String toString() {
    return 'CollectionEditRouteArgs{key: $key, initialCollection: $initialCollection}';
  }
}

/// generated route for
/// [_i4.CollectionManageScreen]
class CollectionManageRoute extends _i14.PageRouteInfo<void> {
  const CollectionManageRoute({List<_i14.PageRouteInfo>? children})
    : super(CollectionManageRoute.name, initialChildren: children);

  static const String name = 'CollectionManageRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.WrappedRoute(child: const _i4.CollectionManageScreen());
    },
  );
}

/// generated route for
/// [_i5.CollectionThreadListScreen]
class CollectionThreadListRoute extends _i14.PageRouteInfo<void> {
  const CollectionThreadListRoute({List<_i14.PageRouteInfo>? children})
    : super(CollectionThreadListRoute.name, initialChildren: children);

  static const String name = 'CollectionThreadListRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.WrappedRoute(child: const _i5.CollectionThreadListScreen());
    },
  );
}

/// generated route for
/// [_i6.ExtensionManageScreen]
class ExtensionManageRoute extends _i14.PageRouteInfo<void> {
  const ExtensionManageRoute({List<_i14.PageRouteInfo>? children})
    : super(ExtensionManageRoute.name, initialChildren: children);

  static const String name = 'ExtensionManageRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return _i14.WrappedRoute(child: const _i6.ExtensionManageScreen());
    },
  );
}

/// generated route for
/// [_i7.HomeScreen]
class HomeRoute extends _i14.PageRouteInfo<void> {
  const HomeRoute({List<_i14.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i7.HomeScreen();
    },
  );
}

/// generated route for
/// [_i8.SearchScreen]
class SearchRoute extends _i14.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i15.Key? key, List<_i14.PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => const SearchRouteArgs(),
      );
      return _i14.WrappedRoute(child: _i8.SearchScreen(key: args.key));
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i15.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i9.SettingsScreen]
class SettingsRoute extends _i14.PageRouteInfo<void> {
  const SettingsRoute({List<_i14.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i9.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i10.SidecarLogsScreen]
class SidecarLogsRoute extends _i14.PageRouteInfo<void> {
  const SidecarLogsRoute({List<_i14.PageRouteInfo>? children})
    : super(SidecarLogsRoute.name, initialChildren: children);

  static const String name = 'SidecarLogsRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i10.SidecarLogsScreen();
    },
  );
}

/// generated route for
/// [_i11.SidecarManageScreen]
class SidecarManageRoute extends _i14.PageRouteInfo<void> {
  const SidecarManageRoute({List<_i14.PageRouteInfo>? children})
    : super(SidecarManageRoute.name, initialChildren: children);

  static const String name = 'SidecarManageRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i11.SidecarManageScreen();
    },
  );
}

/// generated route for
/// [_i12.ThreadDetailScreen]
class ThreadDetailRoute extends _i14.PageRouteInfo<ThreadDetailRouteArgs> {
  ThreadDetailRoute({
    _i15.Key? key,
    required String threadId,
    required String extensionPkgName,
    required String boardId,
    List<_i14.PageRouteInfo>? children,
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

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadDetailRouteArgs>();
      return _i14.WrappedRoute(
        child: _i12.ThreadDetailScreen(
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

  final _i15.Key? key;

  final String threadId;

  final String extensionPkgName;

  final String boardId;

  @override
  String toString() {
    return 'ThreadDetailRouteArgs{key: $key, threadId: $threadId, extensionPkgName: $extensionPkgName, boardId: $boardId}';
  }
}

/// generated route for
/// [_i13.WrapperScreen]
class WrapperRoute extends _i14.PageRouteInfo<void> {
  const WrapperRoute({List<_i14.PageRouteInfo>? children})
    : super(WrapperRoute.name, initialChildren: children);

  static const String name = 'WrapperRoute';

  static _i14.PageInfo page = _i14.PageInfo(
    name,
    builder: (data) {
      return const _i13.WrapperScreen();
    },
  );
}
