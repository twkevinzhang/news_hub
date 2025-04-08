import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

/// Wraps TextFormField to lift the status up principle
class ReactiveTextFormField extends StatefulWidget {
  /// 当前的文本值
  final String value;

  /// 当文本变化时的回调
  final ValueChanged<String> onChanged;

  /// 表单验证函数
  final String? Function(String?)? validator;

  /// 装饰
  final InputDecoration? decoration;

  /// 键盘类型
  final TextInputType? keyboardType;

  /// 文本样式
  final TextStyle? style;

  /// 是否为密码字段
  final bool obscureText;

  /// 获取焦点时的回调
  final Function()? onFocused;

  /// 失去焦点时的回调
  final Function()? onBlurred;

  /// 是否自动验证
  final bool autovalidateMode;

  /// 最大行数
  final int? maxLines;

  /// 最小行数
  final int? minLines;

  /// 占位符文本样式
  final TextStyle? hintStyle;

  /// 标签文本样式
  final TextStyle? labelStyle;

  /// 文本对齐方式
  final TextAlign textAlign;

  /// 焦点节点
  final FocusNode? focusNode;

  /// 是否可编辑
  final bool enabled;

  const ReactiveTextFormField({
    Key? key,
    required this.value,
    required this.onChanged,
    this.validator,
    this.decoration,
    this.keyboardType,
    this.style,
    this.obscureText = false,
    this.onFocused,
    this.onBlurred,
    this.autovalidateMode = false,
    this.maxLines = 1,
    this.minLines,
    this.hintStyle,
    this.labelStyle,
    this.textAlign = TextAlign.start,
    this.focusNode,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<ReactiveTextFormField> createState() => _ReactiveTextFormFieldState();
}

class _ReactiveTextFormFieldState extends State<ReactiveTextFormField> {
  late TextEditingController _controller;
  late FocusNode _focusNode;
  bool _isInternalChange = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
    _focusNode = widget.focusNode ?? FocusNode();

    _focusNode.addListener(_handleFocusChange);
    _controller.addListener(_handleTextChange);
  }

  @override
  void didUpdateWidget(ReactiveTextFormField oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 处理焦点节点的变化
    if (widget.focusNode != oldWidget.focusNode) {
      _focusNode.removeListener(_handleFocusChange);
      _focusNode = widget.focusNode ?? FocusNode();
      _focusNode.addListener(_handleFocusChange);
    }

    // 仅当外部 value 与控制器的值不同时，安排一个安全的状态更新
    if (widget.value != _controller.text) {
      // 使用 post-frame 回调以确保不在 build 周期内更新
      SchedulerBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _isInternalChange = true;
          _controller.value = TextEditingValue(
            text: widget.value,
            selection: TextSelection.fromPosition(
              TextPosition(offset: widget.value.length),
            ),
          );
          _isInternalChange = false;
        }
      });
    }
  }

  void _handleTextChange() {
    // 只响应用户输入，忽略内部程序性更新
    if (!_isInternalChange && _controller.text != widget.value) {
      widget.onChanged(_controller.text);
    }
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      widget.onFocused?.call();
    } else {
      widget.onBlurred?.call();

      // 失去焦点时确保显示的是外部传入的值
      if (_controller.text != widget.value) {
        SchedulerBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            _isInternalChange = true;
            _controller.value = TextEditingValue(
              text: widget.value,
              selection: TextSelection.fromPosition(
                TextPosition(offset: widget.value.length),
              ),
            );
            _isInternalChange = false;
          }
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      focusNode: _focusNode,
      decoration: widget.decoration,
      style: widget.style,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      textAlign: widget.textAlign,
      validator: widget.validator,
      autovalidateMode: widget.autovalidateMode
          ? AutovalidateMode.onUserInteraction
          : AutovalidateMode.disabled,
      enabled: widget.enabled,
      // 我们不再需要在这里处理 onChanged，因为我们已经添加了控制器监听器
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleTextChange);
    _controller.dispose();
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }
    super.dispose();
  }
}