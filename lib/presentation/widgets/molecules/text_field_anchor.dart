// history_input_field.dart
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
      setState(() {
        visibility = true;
      });
      _showOverlay();
    } else {
      setState(() {
        visibility = false;
      });
      _removeOverlay();
    }
  }

  void _showOverlay() {
    _removeOverlay();

    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // 添加一個透明的全屏 GestureDetector 來處理外部點擊
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                _focusNode.unfocus();
              },
            ),
          ),
          // 清單
          Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              offset: Offset(0, size.height + 5),
              child: Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(8),
                child:
                !visibility || widget.items.isEmpty
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
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: widget.textFieldBuilder(_focusNode),
    );
  }
}