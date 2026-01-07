import 'dart:async';
import 'package:flutter/material.dart';
import 'package:media_kit/media_kit.dart';
import 'locator.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MediaKit.ensureInitialized();
  await configureDependencies();
  final launcher = sl<Launcher>();
  await launcher.call();
}
