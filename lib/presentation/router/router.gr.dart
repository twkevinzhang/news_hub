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
import 'package:news_hub/presentation/pages/extension_repos/view/add_extension_repo_screen.dart'
    as _i1;
import 'package:news_hub/presentation/pages/extension_repos/view/extension_repos_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/extensions/view/extensions_screen.dart'
    as _i3;
import 'package:news_hub/presentation/pages/home_screen.dart' as _i4;
import 'package:news_hub/presentation/pages/settings/view/settings_screen.dart'
    as _i6;
import 'package:news_hub/presentation/pages/thread_detail/view/thread_detail_screen.dart'
    as _i7;
import 'package:news_hub/presentation/pages/thread_infos/view/search_screen.dart'
    as _i5;
import 'package:news_hub/presentation/pages/thread_infos/view/thread_infos_screen.dart'
    as _i8;
import 'package:news_hub/presentation/router/wrapper_screen.dart' as _i9;

/// generated route for
/// [_i1.AddExtensionRepoScreen]
class AddExtensionRepoRoute extends _i10.PageRouteInfo<void> {
  const AddExtensionRepoRoute({List<_i10.PageRouteInfo>? children})
    : super(AddExtensionRepoRoute.name, initialChildren: children);

  static const String name = 'AddExtensionRepoRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return _i10.WrappedRoute(child: const _i1.AddExtensionRepoScreen());
    },
  );
}

/// generated route for
/// [_i2.ExtensionReposScreen]
class ExtensionReposRoute extends _i10.PageRouteInfo<void> {
  const ExtensionReposRoute({List<_i10.PageRouteInfo>? children})
    : super(ExtensionReposRoute.name, initialChildren: children);

  static const String name = 'ExtensionReposRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return _i10.WrappedRoute(child: const _i2.ExtensionReposScreen());
    },
  );
}

/// generated route for
/// [_i3.ExtensionsScreen]
class ExtensionsRoute extends _i10.PageRouteInfo<ExtensionsRouteArgs> {
  ExtensionsRoute({_i11.Key? key, List<_i10.PageRouteInfo>? children})
    : super(
        ExtensionsRoute.name,
        args: ExtensionsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ExtensionsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExtensionsRouteArgs>(
        orElse: () => const ExtensionsRouteArgs(),
      );
      return _i10.WrappedRoute(child: _i3.ExtensionsScreen(key: args.key));
    },
  );
}

class ExtensionsRouteArgs {
  const ExtensionsRouteArgs({this.key});

  final _i11.Key? key;

  @override
  String toString() {
    return 'ExtensionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i10.PageRouteInfo<void> {
  const HomeRoute({List<_i10.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.SearchScreen]
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
      return _i10.WrappedRoute(child: _i5.SearchScreen(key: args.key));
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
/// [_i6.SettingsScreen]
class SettingsRoute extends _i10.PageRouteInfo<void> {
  const SettingsRoute({List<_i10.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
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
/// [_i8.ThreadInfosScreen]
class ThreadInfosRoute extends _i10.PageRouteInfo<ThreadInfosRouteArgs> {
  ThreadInfosRoute({
    _i11.Key? key,
    required _i12.ThreadsFilter filter,
    required _i12.ThreadsSorting sorting,
    List<_i10.PageRouteInfo>? children,
  }) : super(
         ThreadInfosRoute.name,
         args: ThreadInfosRouteArgs(key: key, filter: filter, sorting: sorting),
         initialChildren: children,
       );

  static const String name = 'ThreadInfosRoute';

  static _i10.PageInfo page = _i10.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadInfosRouteArgs>();
      return _i10.WrappedRoute(
        child: _i8.ThreadInfosScreen(
          key: args.key,
          filter: args.filter,
          sorting: args.sorting,
        ),
      );
    },
  );
}

class ThreadInfosRouteArgs {
  const ThreadInfosRouteArgs({
    this.key,
    required this.filter,
    required this.sorting,
  });

  final _i11.Key? key;

  final _i12.ThreadsFilter filter;

  final _i12.ThreadsSorting sorting;

  @override
  String toString() {
    return 'ThreadInfosRouteArgs{key: $key, filter: $filter, sorting: $sorting}';
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
