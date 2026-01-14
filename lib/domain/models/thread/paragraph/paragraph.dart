enum ParagraphType { quote, replyTo, text, newLine, image, link, video }

abstract class Paragraph {
  final ParagraphType type;
  Paragraph(this.type);
}

abstract class MediaParagraph extends Paragraph {
  MediaParagraph(super.type);
}

class ImageParagraph extends MediaParagraph {
  final String? _thumb;
  final String raw;

  ImageParagraph({String? thumb, required this.raw})
    : _thumb = thumb,
      super(ParagraphType.image);

  String thumb() {
    return _thumb ?? raw;
  }
}

class VideoParagraph extends MediaParagraph {
  final String? thumb;
  final String url;

  VideoParagraph({this.thumb, required this.url}) : super(ParagraphType.video);
}

extension VideoParagraphEx on VideoParagraph {
  bool isYouTube() {
    return url.startsWith("https://") &&
        (url.contains('youtube.com') || url.contains('youtu.be'));
  }
}

class TextParagraph extends Paragraph {
  final String content;

  TextParagraph({required this.content}) : super(ParagraphType.text);
}

class NewLineParagraph extends Paragraph {
  final String symbol;

  NewLineParagraph({required this.symbol}) : super(ParagraphType.newLine);
}

class QuoteParagraph extends Paragraph {
  final String content;

  QuoteParagraph({required this.content}) : super(ParagraphType.quote);
}

class ReplyToParagraph extends Paragraph {
  final String id;
  final String authorName;
  final String preview;

  ReplyToParagraph({
    required this.id,
    required this.authorName,
    required this.preview,
  }) : super(ParagraphType.replyTo);
}

class LinkParagraph extends Paragraph {
  final String content;

  LinkParagraph({required this.content}) : super(ParagraphType.link);
}

extension ParagraphListEx on List<Paragraph> {
  List<ImageParagraph> images() {
    return whereType<ImageParagraph>().toList();
  }

  List<MediaParagraph> medias() {
    return whereType<MediaParagraph>().toList();
  }
}
