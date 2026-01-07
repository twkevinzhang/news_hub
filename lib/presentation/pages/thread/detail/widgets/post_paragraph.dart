import 'dart:async';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/presentation/components/rendering/loading_indicator.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import 'youtube_paragraph.dart';
import 'video_paragraph.dart';

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

class TextOnlyArticle {
  final List<Widget> children = [];
  final List<InlineSpan> _spans = [];
  final int? _textLengthMax;
  final BuildContext _context;
  bool hasReachedMax = false;
  TextOnlyArticle(context, {int? textLengthMax})
      : _textLengthMax = textLengthMax,
        _context = context;

  int get textLength => _spans.map((s) => s.toPlainText()).join().length;

  void input(InlineSpan span) {
    if (_textLengthMax != null) {
      if (hasReachedMax) {
        return;
      }
      if (textLength >= _textLengthMax) {
        hasReachedMax = true;
        final theme = Theme.of(_context);
        _spans.add(TextSpan(
          text: "...",
          style: span.style,
        ));
        _spans.add(TextSpan(
          text: "查看更多",
          style: span.style?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ));
        return;
      }
      final position = min(_textLengthMax - textLength, span.toPlainText().length);
      final remaining = span.toPlainText().substring(0, position);
      _spans.add(TextSpan(
        text: remaining,
        style: span.style,
      ));
    } else {
      _spans.add(span);
    }
  }

  void enter() {
    if (_spans.isNotEmpty) {
      children.add(RichText(text: TextSpan(children: [..._spans])));
      _spans.clear();
    }
  }
}

class RichContent extends StatelessWidget {
  final List<domain.Paragraph> contents;
  final bool disablePlay;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;

  const RichContent({
    super.key,
    required this.contents,
    this.disablePlay = false,
    required this.onParagraphClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium!.copyWith(
      height: 1.5,
    );

    final article = Article();
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
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
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
        if (onParagraphClick != null) {
          article.inputWidget(ImageParagraph(
            imageUrl: paragraph.raw,
            onClick: () => onParagraphClick!.call(paragraph),
          ));
        } else {
          article.inputWidget(ImageParagraph(
            imageUrl: paragraph.raw,
            onClick: null,
          ));
        }
      } else if (paragraph is domain.VideoParagraph) {
        // 视频段落
        article.enter();
        if (paragraph.isYouTube()) {
          final clipId = YoutubePlayer.convertUrlToId(paragraph.url);
          if (clipId != null) {
            if (disablePlay) {
              article.inputWidget(ImageParagraph(imageUrl: YoutubePlayer.getThumbnail(videoId: clipId)));
            } else {
              article.inputWidget(YouTubeParagraph(clipId: clipId));
            }
          } else {
            article.inputWidget(TextParagraph(
              content: "Unsupported video format: ${paragraph.url}",
              style: textStyle.copyWith(color: theme.colorScheme.error),
            ));
          }
        } else {
          article.inputWidget(VideoParagraph(videoUrl: paragraph.url, isPlayable: !disablePlay));
        }
      }
    }
    article.enter();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: article.children,
    );
  }
}

class TextOnlyContent extends StatelessWidget {
  final List<domain.Paragraph> contents;
  final int? textLengthMax;
  final bool disablePlay;
  final FutureOr<void> Function(domain.Paragraph paragraph)? onParagraphClick;

  const TextOnlyContent({
    super.key,
    required this.contents,
    this.textLengthMax,
    this.disablePlay = false,
    required this.onParagraphClick,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium!.copyWith(
      height: 1.5,
    );

    final article = TextOnlyArticle(context, textLengthMax: 100);
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
            color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
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
        article.input(TextSpan(
          text: "[圖片]",
          style: textStyle,
        ));
      } else if (paragraph is domain.VideoParagraph) {
        // 视频段落
        article.enter();
        if (paragraph.isYouTube()) {
          article.input(TextSpan(
            text: "[YouTube影片]",
            style: textStyle,
          ));
        } else {
          article.input(TextSpan(
            text: "[影片]",
            style: textStyle,
          ));
        }
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
    super.key,
    required this.content,
    this.maxLines,
    this.style,
  });

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
    super.key,
    required this.content,
    this.style,
  });

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
  final String targetName; // paragraph.id
  final String Function(String id) onPreviewReplyTo;
  final void Function()? onClick;

  const ReplyToParagraph({
    super.key,
    required this.targetName,
    required this.onPreviewReplyTo,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final preview = onPreviewReplyTo(targetName);
    final annotations = preview.isEmpty ? ">>$targetName" : ">>$targetName($preview...)";

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
  final void Function()? onClick;

  const LinkParagraph({
    super.key,
    required this.text,
    this.color,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final child = Text(
      text,
      style: TextStyle(
        color: color ?? Theme.of(context).colorScheme.primary,
        decoration: TextDecoration.underline,
      ),
    );
    if (onClick != null) {
      return GestureDetector(
        onTap: onClick,
        child: child,
      );
    } else {
      return child;
    }
  }
}

class ImageParagraph extends StatelessWidget {
  final String imageUrl;
  final VoidCallback? onClick;

  const ImageParagraph({
    super.key,
    required this.imageUrl,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    final child = FittedBox(
        child: CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => const LoadingIndicator(),
      errorWidget: (context, url, error) {
        debugPrint("Failed to load image: $url");
        return const Icon(Icons.error);
      },
      fit: BoxFit.cover,
    ));
    if (onClick != null) {
      return GestureDetector(
        onTap: onClick,
        child: child,
      );
    } else {
      return child;
    }
  }
}
