// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:news_hub/presentation/pages/add_extension_repo/widgets/add_extension_repo_dialog.dart'
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
import 'package:news_hub/presentation/pages/thread_infos/view/thread_infos_screen.dart';

/// generated route for
/// [_i1.AddExtensionRepoDialog]
class AddExtensionRepoRoute extends _i7.PageRouteInfo<void> {
  const AddExtensionRepoRoute({List<_i7.PageRouteInfo>? children})
    : super(AddExtensionRepoRoute.name, initialChildren: children);

  static const String name = 'AddExtensionRepoRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddExtensionRepoDialog();
    },
  );
}

/// generated route for
/// [_i2.ExtensionReposScreen]
class ExtensionReposRoute extends _i7.PageRouteInfo<void> {
  const ExtensionReposRoute({List<_i7.PageRouteInfo>? children})
    : super(ExtensionReposRoute.name, initialChildren: children);

  static const String name = 'ExtensionReposRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.ExtensionReposScreen();
    },
  );
}

/// generated route for
/// [_i3.ExtensionsScreen]
class ExtensionsRoute extends _i7.PageRouteInfo<void> {
  const ExtensionsRoute({List<_i7.PageRouteInfo>? children})
    : super(ExtensionsRoute.name, initialChildren: children);

  static const String name = 'ExtensionsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.ExtensionsScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.SearchScreen]
class SearchRoute extends _i7.PageRouteInfo<void> {
  const SearchRoute({List<_i7.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SearchScreen();
    },
  );
}

/// generated route for
/// [_i6.SettingsScreen]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute({List<_i7.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.SettingsScreen();
    },
  );
}

/// generated route for
/// [ThreadInfosScreen]
class ThreadInfosRoute extends _i7.PageRouteInfo<ThreadInfosRouteArgs> {
  ThreadInfosRoute({_i8.Key? key, List<_i7.PageRouteInfo>? children})
    : super(
        ThreadInfosRoute.name,
        args: ThreadInfosRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ThreadInfosRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadInfosRouteArgs>(
        orElse: () => const ThreadInfosRouteArgs(),
      );
      return ThreadInfosScreen(key: args.key);
    },
  );
}

class ThreadInfosRouteArgs {
  const ThreadInfosRouteArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'ThreadInfosRouteArgs{key: $key}';
  }
}
