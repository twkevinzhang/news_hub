// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:news_hub/presentation/pages/add_extension_repo/widgets/add_extension_repo_dialog.dart'
    as _i1;
import 'package:news_hub/presentation/pages/extension_repos/view/extension_repos_screen.dart'
    as _i2;
import 'package:news_hub/presentation/pages/extensions/view/extensions_screen.dart' as _i3;
import 'package:news_hub/presentation/pages/home_screen.dart' as _i4;
import 'package:news_hub/presentation/pages/search/view/search_screen.dart' as _i5;
import 'package:news_hub/presentation/pages/settings/view/settings_screen.dart' as _i6;
import 'package:news_hub/presentation/pages/threads/view/threads_screen.dart' as _i7;

/// generated route for
/// [_i1.AddExtensionRepoDialog]
class AddExtensionRepoRoute extends _i8.PageRouteInfo<void> {
  const AddExtensionRepoRoute({List<_i8.PageRouteInfo>? children})
    : super(AddExtensionRepoRoute.name, initialChildren: children);

  static const String name = 'AddExtensionRepoRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddExtensionRepoDialog();
    },
  );
}

/// generated route for
/// [_i2.ExtensionReposScreen]
class ExtensionReposRoute extends _i8.PageRouteInfo<void> {
  const ExtensionReposRoute({List<_i8.PageRouteInfo>? children})
    : super(ExtensionReposRoute.name, initialChildren: children);

  static const String name = 'ExtensionReposRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExtensionReposScreen();
    },
  );
}

/// generated route for
/// [_i3.ExtensionsScreen]
class ExtensionsRoute extends _i8.PageRouteInfo<void> {
  const ExtensionsRoute({List<_i8.PageRouteInfo>? children})
    : super(ExtensionsRoute.name, initialChildren: children);

  static const String name = 'ExtensionsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i3.ExtensionsScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRoute extends _i8.PageRouteInfo<void> {
  const SearchRoute({List<_i8.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.SearchScreen();
    },
  );
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute({List<_i8.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i7.ThreadsScreen]
class ThreadsRoute extends _i8.PageRouteInfo<ThreadsRouteArgs> {
  ThreadsRoute({_i9.Key? key, List<_i8.PageRouteInfo>? children})
    : super(
        ThreadsRoute.name,
        args: ThreadsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ThreadsRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadsRouteArgs>(
        orElse: () => const ThreadsRouteArgs(),
      );
      return _i7.ThreadsScreen(key: args.key);
    },
  );
}

class ThreadsRouteArgs {
  const ThreadsRouteArgs({this.key});

  final _i9.Key? key;

  @override
  String toString() {
    return 'ThreadsRouteArgs{key: $key}';
  }
}
