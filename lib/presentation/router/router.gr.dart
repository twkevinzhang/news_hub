// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:news_hub/domain/models/models.dart' as _i11;
import 'package:news_hub/presentation/pages/extension_repos/view/add_extension_repo_screen.dart'
    as _i1;
import 'package:news_hub/presentation/pages/extension_repos/view/extension_repos_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/extensions/view/extensions_screen.dart'
    as _i3;
import 'package:news_hub/presentation/pages/home_screen.dart' as _i4;
import 'package:news_hub/presentation/pages/search/view/search_screen.dart'
    as _i5;
import 'package:news_hub/presentation/pages/settings/view/settings_screen.dart'
    as _i6;
import 'package:news_hub/presentation/pages/thread_infos/view/thread_infos_screen.dart'
    as _i7;
import 'package:news_hub/presentation/router/wrapper_screen.dart' as _i8;

/// generated route for
/// [_i1.AddExtensionRepoScreen]
class AddExtensionRepoRoute extends _i9.PageRouteInfo<void> {
  const AddExtensionRepoRoute({List<_i9.PageRouteInfo>? children})
    : super(AddExtensionRepoRoute.name, initialChildren: children);

  static const String name = 'AddExtensionRepoRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i1.AddExtensionRepoScreen());
    },
  );
}

/// generated route for
/// [_i2.ExtensionReposScreen]
class ExtensionReposRoute extends _i9.PageRouteInfo<void> {
  const ExtensionReposRoute({List<_i9.PageRouteInfo>? children})
    : super(ExtensionReposRoute.name, initialChildren: children);

  static const String name = 'ExtensionReposRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i9.WrappedRoute(child: const _i2.ExtensionReposScreen());
    },
  );
}

/// generated route for
/// [_i3.ExtensionsScreen]
class ExtensionsRoute extends _i9.PageRouteInfo<ExtensionsRouteArgs> {
  ExtensionsRoute({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        ExtensionsRoute.name,
        args: ExtensionsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ExtensionsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExtensionsRouteArgs>(
        orElse: () => const ExtensionsRouteArgs(),
      );
      return _i9.WrappedRoute(child: _i3.ExtensionsScreen(key: args.key));
    },
  );
}

class ExtensionsRouteArgs {
  const ExtensionsRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'ExtensionsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i9.PageRouteInfo<void> {
  const HomeRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRoute extends _i9.PageRouteInfo<SearchRouteArgs> {
  SearchRoute({_i10.Key? key, List<_i9.PageRouteInfo>? children})
    : super(
        SearchRoute.name,
        args: SearchRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'SearchRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SearchRouteArgs>(
        orElse: () => const SearchRouteArgs(),
      );
      return _i9.WrappedRoute(child: _i5.SearchScreen(key: args.key));
    },
  );
}

class SearchRouteArgs {
  const SearchRouteArgs({this.key});

  final _i10.Key? key;

  @override
  String toString() {
    return 'SearchRouteArgs{key: $key}';
  }
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i7.ThreadInfosScreen]
class ThreadInfosRoute extends _i9.PageRouteInfo<ThreadInfosRouteArgs> {
  ThreadInfosRoute({
    _i10.Key? key,
    _i11.ThreadsFilter? filter,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         ThreadInfosRoute.name,
         args: ThreadInfosRouteArgs(key: key, filter: filter),
         initialChildren: children,
       );

  static const String name = 'ThreadInfosRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadInfosRouteArgs>(
        orElse: () => const ThreadInfosRouteArgs(),
      );
      return _i9.WrappedRoute(
        child: _i7.ThreadInfosScreen(key: args.key, filter: args.filter),
      );
    },
  );
}

class ThreadInfosRouteArgs {
  const ThreadInfosRouteArgs({this.key, this.filter});

  final _i10.Key? key;

  final _i11.ThreadsFilter? filter;

  @override
  String toString() {
    return 'ThreadInfosRouteArgs{key: $key, filter: $filter}';
  }
}

/// generated route for
/// [_i8.WrapperScreen]
class WrapperRoute extends _i9.PageRouteInfo<void> {
  const WrapperRoute({List<_i9.PageRouteInfo>? children})
    : super(WrapperRoute.name, initialChildren: children);

  static const String name = 'WrapperRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i8.WrapperScreen();
    },
  );
}
