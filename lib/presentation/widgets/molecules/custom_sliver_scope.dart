import 'package:flutter/material.dart';

class CustomSliverScope extends StatefulWidget {
  final Widget child;

  const CustomSliverScope({super.key, required this.child});

  @override
  State<CustomSliverScope> createState() => _State();

  /// 取得最近的 _InheritedData
  static _InheritedData of(BuildContext context) {
    final _InheritedData? result = context.dependOnInheritedWidgetOfExactType<_InheritedData>();
    assert(result != null, 'No ScrollControllerProvider found in context');
    return result!;
  }
}

class _State extends State<CustomSliverScope> {
  late ScrollController _scrollController;
  late ValueNotifier<double> _visibility;
  double _lastScrollPosition = 0.0;
  final double _maxScrollThreshold = 100.0;

  @override
  void initState() {
    super.initState();
    _visibility = ValueNotifier<double>(1.0);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    _visibility.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _InheritedData(
      scrollController: _scrollController,
      visibility: _visibility,
      child: widget.child,
    );
  }

  void _onScroll() {
    final currentScrollPosition = _scrollController.position.pixels;
    final scrollDelta = currentScrollPosition - _lastScrollPosition;

    double newFactor = _visibility.value - (scrollDelta / _maxScrollThreshold);
    newFactor = newFactor.clamp(0.0, 1.0);

    if ((newFactor - _visibility.value).abs() > 0.01) {
      _visibility.value = newFactor;
    }

    _lastScrollPosition = currentScrollPosition;
  }
}

class _InheritedData extends InheritedWidget {
  final ScrollController scrollController;
  final ValueNotifier<double> visibility;

  const _InheritedData({
    super.key,
    required super.child,
    required this.scrollController,
    required this.visibility,
  });

  static _InheritedData? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InheritedData>();
  }

  @override
  bool updateShouldNotify(_InheritedData oldWidget) {
    return scrollController != oldWidget.scrollController || visibility.value != oldWidget.visibility.value;
  }
}

class CustomSliverWidgetBuilder extends StatelessWidget {
  final WidgetBuilder builder;
  final double height;

  const CustomSliverWidgetBuilder({
    super.key,
    required this.builder,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    final provider = CustomSliverScope.of(context);
    return ValueListenableBuilder<double>(
      valueListenable: provider.visibility,
      builder: (context, visibility, child) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: height * visibility,
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Opacity(
              opacity: visibility,
              child: builder(context),
            ),
          ),
        );
      },
    );
  }
}
