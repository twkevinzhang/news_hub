import 'package:freezed_annotation/freezed_annotation.dart';

part 'paragraph.freezed.dart';
part 'paragraph.g.dart';

enum ParagraphType { quote, replyTo, text, newLine, image, link, video }

@freezed
sealed class Paragraph with _$Paragraph {
  const Paragraph._();

  const factory Paragraph.text({required String content}) = TextParagraph;
  const factory Paragraph.newLine({required String symbol}) = NewLineParagraph;
  const factory Paragraph.quote({required String content}) = QuoteParagraph;
  const factory Paragraph.link({required String content}) = LinkParagraph;
  const factory Paragraph.replyTo({
    required String id,
    required String authorName,
    required String preview,
  }) = ReplyToParagraph;

  const factory Paragraph.image({String? thumbUrl, required String raw}) =
      ImageParagraph;

  const factory Paragraph.video({String? thumb, required String url}) =
      VideoParagraph;

  factory Paragraph.fromJson(Map<String, dynamic> json) =>
      _$ParagraphFromJson(json);

  ParagraphType get type => when(
    text: (_) => ParagraphType.text,
    newLine: (_) => ParagraphType.newLine,
    quote: (_) => ParagraphType.quote,
    link: (_) => ParagraphType.link,
    replyTo: (_, __, ___) => ParagraphType.replyTo,
    image: (_, __) => ParagraphType.image,
    video: (_, __) => ParagraphType.video,
  );

  bool get isMedia => this is ImageParagraph || this is VideoParagraph;
}

extension ImageParagraphEx on ImageParagraph {
  String thumb() => thumbUrl ?? raw;
}

extension VideoParagraphEx on VideoParagraph {
  bool isYouTube() {
    return url.startsWith("https://") &&
        (url.contains('youtube.com') || url.contains('youtu.be'));
  }
}

extension ParagraphListEx on List<Paragraph> {
  List<ImageParagraph> images() {
    return whereType<ImageParagraph>().toList();
  }

  List<Paragraph> medias() {
    return where((p) => p.isMedia).toList();
  }
}
