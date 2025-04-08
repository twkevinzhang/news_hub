import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

class TextFieldAnchor extends StatefulWidget {
  final Function()? onClear;
  final List items;
  final bool Function(int) onSelected;
  final Widget? Function(FocusNode) textFieldBuilder;
  final Widget? Function(int) itemBuilder;

  const TextFieldAnchor({
    super.key,
    this.onClear,
    required this.items,
    required this.onSelected,
    required this.textFieldBuilder,
    required this.itemBuilder,
  });

  @override
  State<TextFieldAnchor> createState() => _TextFieldAnchorState();
}

class _TextFieldAnchorState extends State<TextFieldAnchor> {
  final _focusNode = FocusNode();
  final _layerLink = LayerLink();
  OverlayEntry? _overlayEntry;
  bool visibility = false;
  String currentInput = '';

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    _removeOverlay();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) {
      // Don't call setState() directly - use post-frame callback
      // to avoid build-phase state changes
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            visibility = true;
          });
          _showOverlay();
        }
      });
    } else {
      // Don't call setState() directly - use post-frame callback
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            visibility = false;
          });
          _removeOverlay();
        }
      });
    }
  }

  void _showOverlay() {
    _removeOverlay();

    // Check if context is still valid
    if (!mounted) return;

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // Add transparent full-screen GestureDetector to handle outside clicks
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _focusNode.unfocus();
              },
            ),
          ),
          // List
          Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 5),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child: !visibility || widget.items.isEmpty
                    ? const SizedBox.shrink()
                    : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...widget.items.mapIndexed((i, item) => InkWell(
                      onTap: () {
                        final needUnfocus = widget.onSelected.call(i);
                        if (needUnfocus == true) {
                          _focusNode.unfocus();
                        }
                      },
                      child: widget.itemBuilder(i),
                    )),
                    if (widget.onClear != null)
                      ...[
                        const Divider(height: 1),
                        ListTile(
                          leading: const Icon(Icons.delete_outline),
                          title: const Text('清除歷史記錄'),
                          onTap: () {
                            widget.onClear?.call();
                            _focusNode.unfocus();
                          },
                        ),
                      ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_overlayEntry!);
  }

  void _removeOverlay() {
    if (_overlayEntry != null) {
      _overlayEntry?.remove();
      _overlayEntry = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.textFieldBuilder(_focusNode),
    );
  }
}
