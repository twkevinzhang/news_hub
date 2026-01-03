import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/extensions.dart';
import 'sidecar_api.pb.dart' as pb;

extension SiteTransform on pb.Site {
  domain.Site toDomain() {
    return domain.Site(
      extensionPkgName: pkgName,
      id: id,
      icon: icon,
      name: name,
      url: url,
    );
  }
}

extension BoardTransform on pb.Board {
  domain.Board toDomain() {
    return domain.Board(
      extensionPkgName: pkgName,
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
  domain.Post toDomain() {
    switch (whichContent()) {
      case pb.Post_Content.articlePost:
        return articlePost.toDomain(this);
      case pb.Post_Content.singleImagePost:
        return singleImagePost.toDomain(this);
      default:
        return articlePost.toDomain(this);
    }
  }
}

extension ArticlePostTransform on pb.ArticlePost {
  domain.ArticlePost toDomain(pb.Post post) {
    return domain.ArticlePost(
      extensionPkgName: post.pkgName,
      siteId: post.siteId,
      boardId: post.boardId,
      threadId: post.threadId,
      id: post.id,
      createdAt: createdAt.toDateTime(),
      authorId: authorId,
      authorName: authorName,
      liked: liked,
      disliked: disliked,
      contents: contents.map((e) => e.toDomain()).toList(),
      tags: tags,
      url: url,
      title: title,
      latestRegardingPostCreatedAt: latestRegardingPostCreatedAt.toDateTime(),
      regardingPostsCount: regardingPostsCount,
    );
  }
}

extension SingleImagePostTransform on pb.SingleImagePost {
  domain.SingleImagePost toDomain(pb.Post post) {
    return domain.SingleImagePost(
      extensionPkgName: post.pkgName,
      siteId: post.siteId,
      boardId: post.boardId,
      threadId: post.threadId,
      id: post.id,
      createdAt: createdAt.toDateTime(),
      authorId: authorId,
      authorName: authorName,
      liked: liked,
      disliked: disliked,
      image: image.toDomain(),
      contents: contents.map((e) => e.toDomain()).toList(),
      tags: tags,
      url: url,
      title: title,
      latestRegardingPostCreatedAt: latestRegardingPostCreatedAt.toDateTime(),
      regardingPostsCount: regardingPostsCount,
    );
  }
}

extension CommentTransform on pb.Comment {
  domain.Comment toDomain() {
    return domain.Comment(
      id: id,
      postId: postId,
      threadId: threadId,
      boardId: boardId,
      siteId: siteId,
      extensionPkgName: pkgName,
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
      case pb.Paragraph_Content.newLine:
        return newLine.toDomain();
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

extension NewLineParagraphTransform on pb.NewLineParagraph {
  domain.NewLineParagraph toDomain() {
    return domain.NewLineParagraph(
      symbol: symbol,
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
      authorName: authorName,
      preview: preview,
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
