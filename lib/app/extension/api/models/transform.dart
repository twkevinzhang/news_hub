import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/extensions.dart';
import 'extension_api.pb.dart' as pb;

extension SiteTransform on pb.Site {
  domain.Site toDomain(String extensionPkgName) {
    return domain.Site(
      extensionPkgName: extensionPkgName,
      id: id,
      icon: icon,
      name: name,
      url: url,
    );
  }
}

extension BoardTransform on pb.Board {
  domain.Board toDomain(
    String extensionPkgName,
    String siteId,
  ) {
    return domain.Board(
      extensionPkgName: extensionPkgName,
      id: id,
      name: name,
      siteId: siteId,
      icon: icon,
      largeWelcomeImage: largeWelcomeImage,
      url: url,
      supportedThreadsSorting: supportedThreadsSorting.toSet(),
    );
  }
}

extension PostTransform on pb.Post {
  domain.Post toDomain(String extensionPkgName) {
    return domain.Post(
      extensionPkgName: extensionPkgName,
      id: id,
      threadId: threadId,
      boardId: boardId,
      siteId: siteId,
      authorId: authorId,
      authorName: authorName,
      contents: contents.map((e) => e.toDomain()).toList(),
      createdAt: createdAt.toDateTime(),
      title: title,
      originPostId: originPostId,
      liked: liked,
      disliked: disliked,
      comments: comments, tags: [],
    );
  }
}

extension CommentTransform on pb.Comment {
  domain.Comment toDomain(String extensionPkgName) {
    return domain.Comment(
      id: id,
      postId: postId,
      threadId: threadId,
      boardId: boardId,
      siteId: siteId,
      extensionPkgName: extensionPkgName,
      contents: contents.map((e) => e.toDomain()).toList(),
      authorId: authorId,
      authorName: authorName,
    );
  }
}

extension ParagraphTransform on pb.Paragraph {
  domain.Paragraph toDomain() {
    switch (whichContent()) {
      case pb.Paragraph_Content.image:
        return image.toDomain();
      case pb.Paragraph_Content.video:
        return video.toDomain();
      case pb.Paragraph_Content.text:
        return text.toDomain();
      case pb.Paragraph_Content.quote:
        return quote.toDomain();
      case pb.Paragraph_Content.replyTo:
        return replyTo.toDomain();
      case pb.Paragraph_Content.link:
        return link.toDomain();
      default:
        return text.toDomain();
    }
  }
}

extension ImageParagraphTransform on pb.ImageParagraph {
  domain.ImageParagraph toDomain() {
    return domain.ImageParagraph(
      thumb: thumb,
      raw: raw,
    );
  }
}

extension VideoParagraphTransform on pb.VideoParagraph {
  domain.VideoParagraph toDomain() {
    return domain.VideoParagraph(
      thumb: thumb,
      url: url,
    );
  }
}

extension TextParagraphTransform on pb.TextParagraph {
  domain.TextParagraph toDomain() {
    return domain.TextParagraph(
      content: content,
    );
  }
}

extension QuoteParagraphTransform on pb.QuoteParagraph {
  domain.QuoteParagraph toDomain() {
    return domain.QuoteParagraph(
      content: content,
    );
  }
}

extension ReplyToParagraphTransform on pb.ReplyToParagraph {
  domain.ReplyToParagraph toDomain() {
    return domain.ReplyToParagraph(
      id: id,
    );
  }
}

extension LinkParagraphTransform on pb.LinkParagraph {
  domain.LinkParagraph toDomain() {
    return domain.LinkParagraph(
      content: content,
    );
  }
}
