import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// It is called "Empty Shell" on the [official documentation](https://pub.dev/packages/auto_route#nested-navigation)
@RoutePage()
class WrapperScreen extends StatelessWidget{
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoRouter();
  }
}
