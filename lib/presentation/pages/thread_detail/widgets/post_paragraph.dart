import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/presentation/widgets/molecules/loading_indicator.dart';
import 'package:news_hub/shared/extensions.dart';

class Article {
  List<Widget> children = [];
  List<InlineSpan> spans = [];

  void input(InlineSpan span) {
    spans.add(span);
  }

  void enter() {
    if (spans.isNotEmpty) {
      children.add(RichText(text: TextSpan(children: [...spans])));
      spans.clear();
    }
  }

  void inputWidget(Widget widget) {
    children.add(widget);
  }
}

class ArticleWidget extends StatelessWidget {
  final List<domain.Paragraph> contents;
  final int? textLengthMax;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;

  const ArticleWidget({
    super.key,
    required this.contents,
    this.textLengthMax,
    required this.onParagraphClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium!.copyWith(
      height: 1.5,
    );

    Article article = Article();
    for (var paragraph in contents) {
      if (paragraph is domain.TextParagraph) {
        // 纯文本段落 - 添加为TextSpan
        article.input(TextSpan(
          text: "${paragraph.content} ",
          style: textStyle,
        ));
      } else if (paragraph is domain.NewLineParagraph) {
        // 纯文本段落 - 添加为TextSpan
        article.input(TextSpan(
          text: paragraph.symbol,
          style: textStyle,
        ));
      } else if (paragraph is domain.QuoteParagraph) {
        // 引用段落 - 使用斜体样式
        article.input(TextSpan(
          text: "${paragraph.content} ",
          style: textStyle.copyWith(
            fontStyle: FontStyle.italic,
            color: theme.colorScheme.onSurfaceVariant.withOpacity(0.8),
          ),
        ));
      } else if (paragraph is domain.LinkParagraph) {
        // 链接段落 - 添加为可点击的TextSpan
        article.input(TextSpan(
          text: "${paragraph.content} ",
          style: textStyle.copyWith(
            color: theme.colorScheme.primary,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = () => onParagraphClick?.call(paragraph),
        ));
      } else if (paragraph is domain.ReplyToParagraph) {
        // 回复段落 - 添加为可点击的TextSpan
        article.enter();
        final annotations = paragraph.preview.isEmpty ? ">>${paragraph.authorName} " : ">>${paragraph.authorName}(${paragraph.preview.truncate(7)}) ";
        article.input(TextSpan(
          text: annotations,
          style: textStyle.copyWith(
            color: theme.colorScheme.secondary,
            decoration: TextDecoration.underline,
          ),
          recognizer: TapGestureRecognizer()..onTap = () => onParagraphClick?.call(paragraph),
        ));
        article.enter();
      } else if (paragraph is domain.ImageParagraph) {
        // 图片段落 - 添加为可点击的Image
        article.enter();
        article.inputWidget(ImageParagraph(
          imageUrl: paragraph.raw,
          onClick: () => onParagraphClick?.call(paragraph),
        ));
      } else if (paragraph is domain.VideoParagraph) {
        // 视频段落 - 添加为可点击的Video
        article.enter();
        article.inputWidget(VideoParagraph(
          thumb: paragraph.thumb,
          onClick: () => onParagraphClick?.call((paragraph)),
        ));
      }
    }
    article.enter();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: article.children,
    );
  }
}

class TextParagraph extends StatelessWidget {
  final String content;
  final int? maxLines;
  final TextStyle? style;

  const TextParagraph({
    Key? key,
    required this.content,
    this.maxLines,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      maxLines: maxLines,
      style: style,
    );
  }
}

class QuoteParagraph extends StatelessWidget {
  final String content;
  final TextStyle? style;

  const QuoteParagraph({
    Key? key,
    required this.content,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextParagraph(
          content: content,
          style: style,
        ),
        const SizedBox(height: 4.0),
      ],
    );
  }
}

class ReplyToParagraph extends StatelessWidget {
  final String id; // paragraph.id
  final String Function(String id) onPreviewReplyTo;
  final VoidCallback onClick;

  const ReplyToParagraph({
    Key? key,
    required this.id,
    required this.onPreviewReplyTo,
    this.onClick = defaultOnClick,
  }) : super(key: key);

  static void defaultOnClick() {
    debugPrint("Link clicked!");
  }

  @override
  Widget build(BuildContext context) {
    final preview = onPreviewReplyTo(id);
    final annotations = preview.isEmpty ? ">>${id}" : ">>${id}($preview...)";

    return LinkParagraph(
      text: annotations,
      color: Theme.of(context).colorScheme.secondary,
      onClick: onClick,
    );
  }
}

class LinkParagraph extends StatelessWidget {
  final String text;
  final Color? color;
  final VoidCallback onClick;

  const LinkParagraph({
    Key? key,
    required this.text,
    this.color,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Text(
        text,
        style: TextStyle(
          color: color ?? Theme.of(context).colorScheme.primary,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}

class ImageParagraph extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onClick;

  const ImageParagraph({
    Key? key,
    required this.imageUrl,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onClick,
        child: FittedBox(
            child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const LoadingIndicator(),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        )));
  }
}

class VideoParagraph extends StatelessWidget {
  final String? thumb;
  final VoidCallback? onClick;

  const VideoParagraph({
    Key? key,
    this.thumb,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Stack(
        children: [
          FittedBox(
            child: CachedNetworkImage(
              imageUrl: 'https://dummyimage.com/640x480/f00/fff&text=video',
              placeholder: (context, url) => const LoadingIndicator(),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: Center(
              child: Icon(
                Icons.play_circle_filled,
                color: Colors.white.withOpacity(0.7),
                size: 40.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
