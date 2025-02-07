import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_hub/domain/models/models.dart';

class ParagraphWidget extends StatelessWidget {
  final List<Paragraph> article;
  final int? textLengthMax;
  final void Function(Paragraph paragraph) onParagraphClick;
  final String Function(String id) onPreviewReplyTo;

  const ParagraphWidget({
    Key? key,
    required this.article,
    this.textLengthMax,
    required this.onParagraphClick,
    required this.onPreviewReplyTo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: article.map((paragraph) {
        if (paragraph is TextParagraph) {
          return TextParagraph(
            content: paragraph.content,
          );
        } else if (paragraph is ImageParagraph) {
          return ImageParagraph(
            imageUrl: paragraph.thumb(),
            onClick: () => onParagraphClick(paragraph),
          );
        } else if (paragraph is VideoParagraph) {
          return VideoParagraph(
            thumb: paragraph.thumb,
            onClick: () => onParagraphClick(paragraph),
          );
        } else if (paragraph is LinkParagraph) {
          return LinkParagraph(
            text: paragraph.content,
            onClick: () => onParagraphClick(paragraph),
          );
        } else if (paragraph is ReplyToParagraph) {
          return ReplyToParagraph(
            id: paragraph.id,
            onPreviewReplyTo: onPreviewReplyTo,
            onClick: () => onParagraphClick(paragraph),
          );
        } else if (paragraph is QuoteParagraph) {
          return QuoteParagraph(
            content: paragraph.content,
          );
        }
        return const SizedBox.shrink();
      }).toList(),
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
    final annotations = preview.isEmpty
        ? ">>${id}"
        : ">>${id}($preview...)";

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
      child: SizedBox(
        height: 80.0,
        width: 80.0,
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
        ),
      ),
    );
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
          SizedBox(
            height: 80.0,
            width: 80.0,
            child: CachedNetworkImage(
              imageUrl: thumb ?? 'https://img.freepik.com/premium-vector/window-operating-system-error-warning-dialog-window-popup-message-with-system-failure-flat-design_812892-54.jpg?semt=ais_hybrid',
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
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
