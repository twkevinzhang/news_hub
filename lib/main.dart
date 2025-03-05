
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/app.dart';
import 'package:news_hub/locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  final launcher = sl<Launcher>();
  await launcher.call();
}
