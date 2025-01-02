class Site {
  final String id;
  final String name;
  final String icon;
  final String url;

  Site({
    required this.id,
    required this.name,
    required this.icon,
    required this.url,
  });
}

class Board {
  final String id;
  final String name;
  final String icon;
  final String largeWelcomeImage;
  final String url;

  Board({
    required this.id,
    required this.name,
    required this.icon,
    required this.largeWelcomeImage,
    required this.url,
  });
}

class Thread {
  final String id;
  final String url;
  final Post masterPost;

  Thread({
    required this.id,
    required this.url,
    required this.masterPost,
  });
}

class Post {
  final String id;
  final String? masterId;
  final String? title;
  final String? url;
  final DateTime createdAt;
  final String posterId;
  final String posterName;
  final int like;
  final int dislike;
  final int comments;
  final List<Paragraph> contents;

  Post({
    required this.id,
    this.masterId,
    this.title,
    this.url,
    required this.createdAt,
    required this.posterId,
    required this.posterName,
    required this.like,
    required this.dislike,
    required this.comments,
    required this.contents,
  });
}

enum ParagraphType { QUOTE, REPLY_TO, TEXT, IMAGE, LINK, VIDEO }

abstract class Paragraph {
  final ParagraphType type;
  Paragraph(this.type);
}

class ImageInfo extends Paragraph {
  final String? thumb;
  final String raw;

  ImageInfo(
    this.thumb,
    this.raw,
  ) : super(ParagraphType.IMAGE);
}

class VideoInfo extends Paragraph {
  final String url;

  VideoInfo(this.url) : super(ParagraphType.VIDEO);
}

class Text extends Paragraph {
  final String content;

  Text(this.content) : super(ParagraphType.TEXT);
}

class Quote extends Paragraph {
  final String content;

  Quote(this.content) : super(ParagraphType.QUOTE);
}

class ReplyTo extends Paragraph {
  final String id;

  ReplyTo(this.id) : super(ParagraphType.REPLY_TO);
}

class Link extends Paragraph {
  final String content;

  Link(this.content) : super(ParagraphType.LINK);
}

class Comment {
  final String id;
  final List<Paragraph> contents;

  Comment({
    required this.id,
    required this.contents,
  });
}
