// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:flutter/material.dart' as _i14;
import 'package:news_hub/domain/models/models.dart' as _i15;
import 'package:news_hub/presentation/pages/collection/create/view/collection_create_screen.dart'
    as _i1;
import 'package:news_hub/presentation/pages/collection/edit/view/collection_create_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/settings/collections/view/collection_manage_screen.dart'
    as _i3;
import 'package:news_hub/presentation/pages/settings/extensions/view/extension_manage_screen.dart'
    as _i4;
import 'package:news_hub/presentation/pages/settings/settings_screen.dart'
    as _i7;
import 'package:news_hub/presentation/pages/settings/sidecar/sidecar_manage_screen.dart'
    as _i9;
import 'package:news_hub/presentation/pages/shell/home_screen.dart' as _i5;
import 'package:news_hub/presentation/pages/sidecar/logs/sidecar_logs_screen.dart'
    as _i8;
import 'package:news_hub/presentation/pages/thread/detail/view/thread_detail_screen.dart'
    as _i10;
import 'package:news_hub/presentation/pages/thread/list/view/thread_list_screen.dart'
    as _i11;
import 'package:news_hub/presentation/pages/thread/search/view/search_screen.dart'
    as _i6;
import 'package:news_hub/presentation/router/wrapper_screen.dart' as _i12;

/// generated route for
/// [_i1.CollectionCreateScreen]
class CollectionCreateRoute extends _i13.PageRouteInfo<void> {
  const CollectionCreateRoute({List<_i13.PageRouteInfo>? children})
    : super(CollectionCreateRoute.name, initialChildren: children);

  static const String name = 'CollectionCreateRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return _i13.WrappedRoute(child: const _i1.CollectionCreateScreen());
    },
  );
}

/// generated route for
/// [_i2.CollectionEditScreen]
class CollectionEditRoute extends _i13.PageRouteInfo<CollectionEditRouteArgs> {
  CollectionEditRoute({
    _i14.Key? key,
    required _i15.Collection initialCollection,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         CollectionEditRoute.name,
         args: CollectionEditRouteArgs(
           key: key,
           initialCollection: initialCollection,
         ),
         initialChildren: children,
       );

  static const String name = 'CollectionEditRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CollectionEditRouteArgs>();
      return _i13.WrappedRoute(
        child: _i2.CollectionEditScreen(
          key: args.key,
          initialCollection: args.initialCollection,
        ),
      );
    },
  );
}

class CollectionEditRouteArgs {
  const CollectionEditRouteArgs({this.key, required this.initialCollection});

  final _i14.Key? key;

  final _i15.Collection initialCollection;

  @override
  String toString() {
    return 'CollectionEditRouteArgs{key: $key, initialCollection: $initialCollection}';
  }
}

/// generated route for
/// [_i3.CollectionManageScreen]
class CollectionManageRoute extends _i13.PageRouteInfo<void> {
  const CollectionManageRoute({List<_i13.PageRouteInfo>? children})
    : super(CollectionManageRoute.name, initialChildren: children);

  static const String name = 'CollectionManageRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return _i13.WrappedRoute(child: const _i3.CollectionManageScreen());
    },
  );
}

/// generated route for
/// [_i4.ExtensionManageScreen]
class ExtensionManageRoute extends _i13.PageRouteInfo<void> {
  const ExtensionManageRoute({List<_i13.PageRouteInfo>? children})
    : super(ExtensionManageRoute.name, initialChildren: children);

  static const String name = 'ExtensionManageRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return _i13.WrappedRoute(child: const _i4.ExtensionManageScreen());
    },
  );
}

/// generated route for
/// [_i5.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreen();
    },
  );
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i13.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i14.Key? key, List<_i13.PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => const SearchRouteArgs(),
      );
      return _i13.WrappedRoute(child: _i6.SearchScreen(key: args.key));
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i14.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i7.SettingsScreen]
class SettingsRoute extends _i13.PageRouteInfo<void> {
  const SettingsRoute({List<_i13.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i7.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i8.SidecarLogsScreen]
class SidecarLogsRoute extends _i13.PageRouteInfo<void> {
  const SidecarLogsRoute({List<_i13.PageRouteInfo>? children})
    : super(SidecarLogsRoute.name, initialChildren: children);

  static const String name = 'SidecarLogsRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.SidecarLogsScreen();
    },
  );
}

/// generated route for
/// [_i9.SidecarManageScreen]
class SidecarManageRoute extends _i13.PageRouteInfo<void> {
  const SidecarManageRoute({List<_i13.PageRouteInfo>? children})
    : super(SidecarManageRoute.name, initialChildren: children);

  static const String name = 'SidecarManageRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i9.SidecarManageScreen();
    },
  );
}

/// generated route for
/// [_i10.ThreadDetailScreen]
class ThreadDetailRoute extends _i13.PageRouteInfo<ThreadDetailRouteArgs> {
  ThreadDetailRoute({
    _i14.Key? key,
    required String threadId,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ThreadDetailRoute.name,
         args: ThreadDetailRouteArgs(
           key: key,
           threadId: threadId,
           extensionPkgName: extensionPkgName,
           siteId: siteId,
           boardId: boardId,
         ),
         initialChildren: children,
       );

  static const String name = 'ThreadDetailRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadDetailRouteArgs>();
      return _i13.WrappedRoute(
        child: _i10.ThreadDetailScreen(
          key: args.key,
          threadId: args.threadId,
          extensionPkgName: args.extensionPkgName,
          siteId: args.siteId,
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
    required this.siteId,
    required this.boardId,
  });

  final _i14.Key? key;

  final String threadId;

  final String extensionPkgName;

  final String siteId;

  final String boardId;

  @override
  String toString() {
    return 'ThreadDetailRouteArgs{key: $key, threadId: $threadId, extensionPkgName: $extensionPkgName, siteId: $siteId, boardId: $boardId}';
  }
}

/// generated route for
/// [_i11.ThreadListScreen]
class ThreadListRoute extends _i13.PageRouteInfo<ThreadListRouteArgs> {
  ThreadListRoute({
    _i14.Key? key,
    _i15.ThreadsFilter? filter,
    _i15.ThreadsSorting? sorting,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ThreadListRoute.name,
         args: ThreadListRouteArgs(key: key, filter: filter, sorting: sorting),
         initialChildren: children,
       );

  static const String name = 'ThreadListRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadListRouteArgs>(
        orElse: () => const ThreadListRouteArgs(),
      );
      return _i13.WrappedRoute(
        child: _i11.ThreadListScreen(
          key: args.key,
          filter: args.filter,
          sorting: args.sorting,
        ),
      );
    },
  );
}

class ThreadListRouteArgs {
  const ThreadListRouteArgs({this.key, this.filter, this.sorting});

  final _i14.Key? key;

  final _i15.ThreadsFilter? filter;

  final _i15.ThreadsSorting? sorting;

  @override
  String toString() {
    return 'ThreadListRouteArgs{key: $key, filter: $filter, sorting: $sorting}';
  }
}

/// generated route for
/// [_i12.WrapperScreen]
class WrapperRoute extends _i13.PageRouteInfo<void> {
  const WrapperRoute({List<_i13.PageRouteInfo>? children})
    : super(WrapperRoute.name, initialChildren: children);

  static const String name = 'WrapperRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.WrapperScreen();
    },
  );
}
