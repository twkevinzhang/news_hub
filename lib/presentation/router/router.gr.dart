// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:news_hub/domain/models/models.dart' as _i14;
import 'package:news_hub/presentation/pages/app-shell/home/home_screen.dart'
    as _i4;
import 'package:news_hub/presentation/pages/app-shell/settings/view/settings_screen.dart'
    as _i6;
import 'package:news_hub/presentation/pages/content-discovery/browse-threads/view/thread_list_screen.dart'
    as _i10;
import 'package:news_hub/presentation/pages/content-discovery/read-thread/view/thread_detail_screen.dart'
    as _i9;
import 'package:news_hub/presentation/pages/content-discovery/search-threads/view/search_screen.dart'
    as _i5;
import 'package:news_hub/presentation/pages/content-organization/create-collection/view/create_collection_page.dart'
    as _i2;
import 'package:news_hub/presentation/pages/content-organization/manage-collections/view/collection_list_screen.dart'
    as _i1;
import 'package:news_hub/presentation/pages/extension-marketplace/manage-extensions/view/extension_manage_screen.dart'
    as _i3;
import 'package:news_hub/presentation/pages/system-operations/configure-sidecar/sidecar_manage_screen.dart'
    as _i8;
import 'package:news_hub/presentation/pages/system-operations/monitor-sidecar/sidecar_logs_screen.dart'
    as _i7;
import 'package:news_hub/presentation/router/wrapper_screen.dart' as _i11;

/// generated route for
/// [_i1.CollectionListScreen]
class CollectionListRoute extends _i12.PageRouteInfo<void> {
  const CollectionListRoute({List<_i12.PageRouteInfo>? children})
    : super(CollectionListRoute.name, initialChildren: children);

  static const String name = 'CollectionListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i1.CollectionListScreen();
    },
  );
}

/// generated route for
/// [_i2.CreateCollectionPage]
class CreateCollectionRoute extends _i12.PageRouteInfo<void> {
  const CreateCollectionRoute({List<_i12.PageRouteInfo>? children})
    : super(CreateCollectionRoute.name, initialChildren: children);

  static const String name = 'CreateCollectionRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i2.CreateCollectionPage());
    },
  );
}

/// generated route for
/// [_i3.ExtensionManageScreen]
class ExtensionManageRoute extends _i12.PageRouteInfo<void> {
  const ExtensionManageRoute({List<_i12.PageRouteInfo>? children})
    : super(ExtensionManageRoute.name, initialChildren: children);

  static const String name = 'ExtensionManageRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return _i12.WrappedRoute(child: const _i3.ExtensionManageScreen());
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i12.PageRouteInfo<void> {
  const HomeRoute({List<_i12.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRoute extends _i12.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i13.Key? key, List<_i12.PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => const SearchRouteArgs(),
      );
      return _i12.WrappedRoute(child: _i5.SearchScreen(key: args.key));
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i13.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i12.PageRouteInfo<void> {
  const SettingsRoute({List<_i12.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i7.SidecarLogsScreen]
class SidecarLogsRoute extends _i12.PageRouteInfo<void> {
  const SidecarLogsRoute({List<_i12.PageRouteInfo>? children})
    : super(SidecarLogsRoute.name, initialChildren: children);

  static const String name = 'SidecarLogsRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i7.SidecarLogsScreen();
    },
  );
}

/// generated route for
/// [_i8.SidecarManageScreen]
class SidecarManageRoute extends _i12.PageRouteInfo<void> {
  const SidecarManageRoute({List<_i12.PageRouteInfo>? children})
    : super(SidecarManageRoute.name, initialChildren: children);

  static const String name = 'SidecarManageRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i8.SidecarManageScreen();
    },
  );
}

/// generated route for
/// [_i9.ThreadDetailScreen]
class ThreadDetailRoute extends _i12.PageRouteInfo<ThreadDetailRouteArgs> {
  ThreadDetailRoute({
    _i13.Key? key,
    required String threadId,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    List<_i12.PageRouteInfo>? children,
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

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadDetailRouteArgs>();
      return _i12.WrappedRoute(
        child: _i9.ThreadDetailScreen(
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

  final _i13.Key? key;

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
/// [_i10.ThreadListScreen]
class ThreadListRoute extends _i12.PageRouteInfo<ThreadListRouteArgs> {
  ThreadListRoute({
    _i13.Key? key,
    _i14.ThreadsFilter? filter,
    _i14.ThreadsSorting? sorting,
    List<_i12.PageRouteInfo>? children,
  }) : super(
         ThreadListRoute.name,
         args: ThreadListRouteArgs(key: key, filter: filter, sorting: sorting),
         initialChildren: children,
       );

  static const String name = 'ThreadListRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadListRouteArgs>(
        orElse: () => const ThreadListRouteArgs(),
      );
      return _i12.WrappedRoute(
        child: _i10.ThreadListScreen(
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

  final _i13.Key? key;

  final _i14.ThreadsFilter? filter;

  final _i14.ThreadsSorting? sorting;

  @override
  String toString() {
    return 'ThreadListRouteArgs{key: $key, filter: $filter, sorting: $sorting}';
  }
}

/// generated route for
/// [_i11.WrapperScreen]
class WrapperRoute extends _i12.PageRouteInfo<void> {
  const WrapperRoute({List<_i12.PageRouteInfo>? children})
    : super(WrapperRoute.name, initialChildren: children);

  static const String name = 'WrapperRoute';

  static _i12.PageInfo page = _i12.PageInfo(
    name,
    builder: (data) {
      return const _i11.WrapperScreen();
    },
  );
}
