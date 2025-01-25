import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/presentation/widgets/empty_screen.dart';

@RoutePage()
class ExtensionsScreen extends StatelessWidget {
  const ExtensionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EmptyScreen(message: "ExtensionsScreen");
  }
}
