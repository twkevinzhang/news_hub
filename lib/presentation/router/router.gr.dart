// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:news_hub/domain/models/models.dart' as _i12;
import 'package:news_hub/presentation/pages/collection/create/view/create_collection_page.dart'
    as _i1;
import 'package:news_hub/presentation/pages/extension/view/extension_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/home/home_screen.dart' as _i3;
import 'package:news_hub/presentation/pages/search/view/search_screen.dart'
    as _i4;
import 'package:news_hub/presentation/pages/settings/view/settings_screen.dart'
    as _i5;
import 'package:news_hub/presentation/pages/sidecar/sidecar_logs_page.dart'
    as _i6;
import 'package:news_hub/presentation/pages/thread/detail/view/thread_detail_screen.dart'
    as _i7;
import 'package:news_hub/presentation/pages/thread/list/view/thread_list_screen.dart'
    as _i8;
import 'package:news_hub/presentation/router/wrapper_screen.dart' as _i9;

/// generated route for
/// [_i1.CreateCollectionPage]
class CreateCollectionRoute extends _i10.PageRouteInfo<void> {
  const CreateCollectionRoute({List<_i10.PageRouteInfo>? children})
    : super(CreateCollectionRoute.name, initialChildren: children);

  static const String name = 'CreateCollectionRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return _i10.WrappedRoute(child: const _i1.CreateCollectionPage());
    },
  );
}

/// generated route for
/// [_i2.ExtensionScreen]
class ExtensionRoute extends _i10.PageRouteInfo<ExtensionRouteArgs> {
  ExtensionRoute({_i11.Key? key, List<_i10.PageRouteInfo>? children})
    : super(
        ExtensionRoute.name,
        args: ExtensionRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ExtensionRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExtensionRouteArgs>(
        orElse: () => const ExtensionRouteArgs(),
      );
      return _i10.WrappedRoute(child: _i2.ExtensionScreen(key: args.key));
    },
  );
}

class ExtensionRouteArgs {
  const ExtensionRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'ExtensionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.SearchScreen]
class SearchRoute extends _i10.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i11.Key? key, List<_i10.PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => const SearchRouteArgs(),
      );
      return _i10.WrappedRoute(child: _i4.SearchScreen(key: args.key));
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i5.SettingsScreen]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i5.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i6.SidecarLogsPage]
class SidecarLogsRoute extends _i10.PageRouteInfo<void> {
  const SidecarLogsRoute({List<_i10.PageRouteInfo>? children})
    : super(SidecarLogsRoute.name, initialChildren: children);

  static const String name = 'SidecarLogsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.SidecarLogsPage();
    },
  );
}

/// generated route for
/// [_i7.ThreadDetailScreen]
class ThreadDetailRoute extends _i10.PageRouteInfo<ThreadDetailRouteArgs> {
  ThreadDetailRoute({
    _i11.Key? key,
    required String threadId,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    List<_i10.PageRouteInfo>? children,
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

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadDetailRouteArgs>();
      return _i10.WrappedRoute(
        child: _i7.ThreadDetailScreen(
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

  final _i11.Key? key;

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
/// [_i8.ThreadListScreen]
class ThreadListRoute extends _i10.PageRouteInfo<ThreadListRouteArgs> {
  ThreadListRoute({
    _i11.Key? key,
    _i12.ThreadsFilter? filter,
    _i12.ThreadsSorting? sorting,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         ThreadListRoute.name,
         args: ThreadListRouteArgs(key: key, filter: filter, sorting: sorting),
         initialChildren: children,
       );

  static const String name = 'ThreadListRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadListRouteArgs>(
        orElse: () => const ThreadListRouteArgs(),
      );
      return _i10.WrappedRoute(
        child: _i8.ThreadListScreen(
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

  final _i11.Key? key;

  final _i12.ThreadsFilter? filter;

  final _i12.ThreadsSorting? sorting;

  @override
  String toString() {
    return 'ThreadListRouteArgs{key: $key, filter: $filter, sorting: $sorting}';
  }
}

/// generated route for
/// [_i9.WrapperScreen]
class WrapperRoute extends _i10.PageRouteInfo<void> {
  const WrapperRoute({List<_i10.PageRouteInfo>? children})
    : super(WrapperRoute.name, initialChildren: children);

  static const String name = 'WrapperRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i9.WrapperScreen();
    },
  );
}
