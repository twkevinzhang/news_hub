import 'package:flutter/widgets.dart';

/// A test helper widget that tracks rebuild count.
///
/// This widget wraps a child and calls [onBuild] every time it rebuilds.
/// Useful for testing that BlocSelector and other optimization techniques
/// are working correctly.
///
/// Example:
/// ```dart
/// var buildCount = 0;
///
/// await tester.pumpWidget(
///   RebuildObserver(
///     onBuild: () => buildCount++,
///     child: MyWidget(),
///   ),
/// );
///
/// expect(buildCount, 1); // Initial build
/// ```
class RebuildObserver extends StatelessWidget {
  final Widget child;
  final VoidCallback onBuild;

  const RebuildObserver({
    required this.child,
    required this.onBuild,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    onBuild();
    return child;
  }
}
