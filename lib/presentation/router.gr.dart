// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;
import 'package:news_hub/presentation/pages/extensions/screen.dart' as _i1;
import 'package:news_hub/presentation/pages/home_screen.dart' as _i2;
import 'package:news_hub/presentation/pages/search/screen.dart' as _i3;
import 'package:news_hub/presentation/pages/settings/screen.dart' as _i4;
import 'package:news_hub/presentation/pages/threads/screen.dart' as _i5;

/// generated route for
/// [_i1.ExtensionsScreen]
class ExtensionsRoute extends _i6.PageRouteInfo<void> {
  const ExtensionsRoute({List<_i6.PageRouteInfo>? children})
    : super(ExtensionsRoute.name, initialChildren: children);

  static const String name = 'ExtensionsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i1.ExtensionsScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.SearchScreen]
class SearchRoute extends _i6.PageRouteInfo<void> {
  const SearchRoute({List<_i6.PageRouteInfo>? children})
    : super(SearchRoute.name, initialChildren: children);

  static const String name = 'SearchRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i3.SearchScreen();
    },
  );
}

/// generated route for
/// [_i4.SettingsScreen]
class SettingsRoute extends _i6.PageRouteInfo<void> {
  const SettingsRoute({List<_i6.PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      return const _i4.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i5.ThreadsScreen]
class ThreadsRoute extends _i6.PageRouteInfo<ThreadsRouteArgs> {
  ThreadsRoute({_i7.Key? key, List<_i6.PageRouteInfo>? children})
    : super(
        ThreadsRoute.name,
        args: ThreadsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ThreadsRoute';

  static _i6.PageInfo page = _i6.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ThreadsRouteArgs>(
        orElse: () => const ThreadsRouteArgs(),
      );
      return _i5.ThreadsScreen(key: args.key);
    },
  );
}

class ThreadsRouteArgs {
  const ThreadsRouteArgs({this.key});

  final _i7.Key? key;

  @override
  String toString() {
    return 'ThreadsRouteArgs{key: $key}';
  }
}
