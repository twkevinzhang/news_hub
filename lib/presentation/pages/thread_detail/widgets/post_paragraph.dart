import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/presentation/widgets/molecules/loading_indicator.dart';
import 'package:news_hub/shared/extensions.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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
          onClick: onParagraphClick != null ? () => onParagraphClick!.call(paragraph) : null,
        ));
      } else if (paragraph is domain.VideoParagraph) {
        // 视频段落
        article.enter();
        if (paragraph.isYouTube()) {
          final clipId = YoutubePlayer.convertUrlToId(paragraph.url);
          if (clipId != null) {
            if (onParagraphClick != null) {
              article.inputWidget(YouTubeParagraph(
                clipId: clipId,
              ));
            } else {
              article.inputWidget(ImageParagraph(
                imageUrl: YoutubePlayer.getThumbnail(videoId: clipId),
              ));
            }
          } else {
            article.inputWidget(TextParagraph(
              content: "Unsupported video format: ${paragraph.url}",
              style: textStyle.copyWith(color: theme.colorScheme.error),
            ));
          }
        } else {
          article.inputWidget(TextParagraph(
            content: "Unsupported video format: ${paragraph.url}",
            style: textStyle.copyWith(color: theme.colorScheme.error),
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
      errorWidget: (context, url, error) => const Icon(Icons.error),
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

class YouTubeParagraph extends StatefulWidget {
  final String clipId;
  const YouTubeParagraph({
    super.key,
    required this.clipId,
  });

  @override
  State<YouTubeParagraph> createState() => _YouTubeParagraphState();
}

class _YouTubeParagraphState extends State<YouTubeParagraph> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;
  late TextEditingController _seekToController;

  late PlayerState _playerState;
  late YoutubeMetaData _videoMetaData;
  double _volume = 100;
  bool _muted = false;
  bool _isPlayerReady = false;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.clipId,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(_listener);
    super.initState();
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    _seekToController.dispose();
    super.dispose();
  }

  void _listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        _playerState = _controller.value.playerState;
        _videoMetaData = _controller.metadata;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      onReady: () {
        debugPrint('Player is ready.');
      },
      bottomActions: [
        CurrentPosition(),
        ProgressBar(isExpanded: true),
        RemainingDuration(),
        IconButton(
          onPressed: () async {
            _controller.pause();
            final seconds = _controller.value.position.inSeconds;
            final url = "https://www.youtube.com/watch?v=${widget.clipId}&t=$seconds";
            if (!await launchUrl(Uri.parse(url))) {
              debugPrint('Could not launch $url');
            }
          },
          icon: Icon(Icons.open_in_new_outlined, color: Colors.white),
        )
      ],
    );
  }
}
