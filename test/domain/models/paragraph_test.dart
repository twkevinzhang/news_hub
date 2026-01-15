import 'package:flutter_test/flutter_test.dart';
import 'package:news_hub/domain/models/models.dart';

void main() {
  group('Paragraph (Freezed)', () {
    test('ImageParagraph 應該正確建立並提供 thumb', () {
      const p = ImageParagraph(
        raw: 'http://raw.jpg',
        thumbUrl: 'http://thumb.jpg',
      );

      expect(p.raw, 'http://raw.jpg');
      expect(p.thumb(), 'http://thumb.jpg');
      expect(p.type, ParagraphType.image);
    });

    test('TextParagraph 應該正確建立', () {
      const p = TextParagraph(content: 'hello');

      expect(p.content, 'hello');
      expect(p.type, ParagraphType.text);
    });

    test('應該支援 JSON 序列化', () {
      const p = TextParagraph(content: 'hello');
      final json = p.toJson();

      expect(json['runtimeType'], 'text');
      expect(json['content'], 'hello');
    });

    test('VideoParagraph 應該正確判斷 YouTube', () {
      const p = VideoParagraph(url: 'https://youtube.com/watch?v=123');
      expect(p.isYouTube(), isTrue);

      const p2 = VideoParagraph(url: 'https://example.com');
      expect(p2.isYouTube(), isFalse);
    });
  });
}
