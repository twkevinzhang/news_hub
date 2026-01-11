import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/extensions.dart';
import 'sidecar_api.pb.dart' as pb;
import 'domain_models.pb.dart' as domain_pb;

extension BoardTransform on domain_pb.Board {
  domain.Board toBoardDomain() {
    return domain.Board(
      extensionPkgName: pkgName,
      id: id,
      name: name,
      icon: icon,
      largeWelcomeImage: largeWelcomeImage,
      url: url,
      sortOptions: supportedThreadsSorting.toSet(),
    );
  }
}

extension PostTransform on domain_pb.Post {
  domain.Post toPostDomain() {
    switch (whichContent()) {
      case domain_pb.Post_Content.articlePost:
        return articlePost.toArticlePostDomain(this);
      case domain_pb.Post_Content.singleImagePost:
        return singleImagePost.toSingleImagePostDomain(this);
      default:
        return articlePost.toArticlePostDomain(this);
    }
  }
}

extension ArticlePostTransform on domain_pb.ArticlePost {
  domain.ArticlePost toArticlePostDomain(domain_pb.Post post) {
    return domain.ArticlePost(
      extensionPkgName: post.pkgName,
      boardId: post.boardId,
      threadId: post.threadId,
      id: post.id,
      createdAt: createdAt.toDateTime(),
      authorId: authorId,
      authorName: authorName,
      liked: liked,
      disliked: disliked,
      contents: contents.map((e) => e.toParagraphDomain()).toList(),
      tags: tags,
      url: url,
      title: title,
      latestReplyCreatedAt: latestReplyCreatedAt.toDateTime(),
      repliesCount: repliesCount,
    );
  }
}

extension SingleImagePostTransform on domain_pb.SingleImagePost {
  domain.SingleImagePost toSingleImagePostDomain(domain_pb.Post post) {
    return domain.SingleImagePost(
      extensionPkgName: post.pkgName,
      boardId: post.boardId,
      threadId: post.threadId,
      id: post.id,
      createdAt: createdAt.toDateTime(),
      authorId: authorId,
      authorName: authorName,
      liked: liked,
      disliked: disliked,
      image: image.toImageParagraphDomain(),
      contents: contents.map((e) => e.toParagraphDomain()).toList(),
      tags: tags,
      url: url,
      title: title,
      latestReplyCreatedAt: latestReplyCreatedAt.toDateTime(),
      repliesCount: repliesCount,
    );
  }
}

extension CommentTransform on domain_pb.Comment {
  domain.Comment toCommentDomain() {
    return domain.Comment(
      id: id,
      postId: postId,
      threadId: threadId,
      boardId: boardId,
      extensionPkgName: pkgName,
      contents: contents.map((e) => e.toParagraphDomain()).toList(),
      authorId: authorId,
      authorName: authorName,
    );
  }
}

extension ParagraphTransform on domain_pb.Paragraph {
  domain.Paragraph toParagraphDomain() {
    switch (whichContent()) {
      case domain_pb.Paragraph_Content.image:
        return image.toImageParagraphDomain();
      case domain_pb.Paragraph_Content.video:
        return video.toVideoParagraphDomain();
      case domain_pb.Paragraph_Content.text:
        return text.toTextParagraphDomain();
      case domain_pb.Paragraph_Content.newLine:
        return newLine.toNewLineParagraphDomain();
      case domain_pb.Paragraph_Content.quote:
        return quote.toQuoteParagraphDomain();
      case domain_pb.Paragraph_Content.replyTo:
        return replyTo.toReplyToParagraphDomain();
      case domain_pb.Paragraph_Content.link:
        return link.toLinkParagraphDomain();
      default:
        return text.toTextParagraphDomain();
    }
  }
}

extension ImageParagraphTransform on domain_pb.ImageParagraph {
  domain.ImageParagraph toImageParagraphDomain() {
    return domain.ImageParagraph(
      thumb: thumb,
      raw: raw,
    );
  }
}

extension VideoParagraphTransform on domain_pb.VideoParagraph {
  domain.VideoParagraph toVideoParagraphDomain() {
    return domain.VideoParagraph(
      thumb: thumb,
      url: url,
    );
  }
}

extension TextParagraphTransform on domain_pb.TextParagraph {
  domain.TextParagraph toTextParagraphDomain() {
    return domain.TextParagraph(
      content: content,
    );
  }
}

extension NewLineParagraphTransform on domain_pb.NewLineParagraph {
  domain.NewLineParagraph toNewLineParagraphDomain() {
    return domain.NewLineParagraph(
      symbol: symbol,
    );
  }
}

extension QuoteParagraphTransform on domain_pb.QuoteParagraph {
  domain.QuoteParagraph toQuoteParagraphDomain() {
    return domain.QuoteParagraph(
      content: content,
    );
  }
}

extension ReplyToParagraphTransform on domain_pb.ReplyToParagraph {
  domain.ReplyToParagraph toReplyToParagraphDomain() {
    return domain.ReplyToParagraph(
      id: id,
      authorName: authorName,
      preview: preview,
    );
  }
}

extension LinkParagraphTransform on domain_pb.LinkParagraph {
  domain.LinkParagraph toLinkParagraphDomain() {
    return domain.LinkParagraph(
      content: content,
    );
  }
}

extension ExtensionTransform on domain_pb.Extension {
  domain.Extension toExtensionDomain() {
    return domain.Extension(
      pkgName: pkgName,
      displayName: displayName,
      version: version,
      pythonVersion: pythonVersion,
      lang: hasLang() ? lang : null,
      isNsfw: isNsfw,
    );
  }
}

extension RemoteExtensionTransform on domain_pb.RemoteExtension {
  domain.RemoteExtension toRemoteExtensionDomain() {
    return domain.RemoteExtension(
      pkgName: base.pkgName,
      displayName: base.displayName,
      version: base.version,
      pythonVersion: base.pythonVersion,
      lang: base.hasLang() ? base.lang : null,
      isNsfw: base.isNsfw,
      iconUrl: iconUrl,
      repoUrl: repoUrl,
    );
  }
}

extension RepoTransform on domain_pb.ExtensionRepo {
  domain.Repo toRepoDomain() {
    return domain.Repo(
      baseUrl: url,
      displayName: displayName.isNotEmpty ? displayName : url,
      website: website.isNotEmpty ? website : url,
      signingKeyFingerprint: signingKeyFingerprint,
      icon: icon.isNotEmpty ? icon : null,
    );
  }
}

extension HealthCheckResTransform on pb.HealthCheckRes {
  domain.HealthCheckResult toHealthCheckResultDomain() {
    final _status = switch (status.value) {
      0 => domain.ServingStatus.unknown,
      1 => domain.ServingStatus.serving,
      2 => domain.ServingStatus.notServing,
      3 => domain.ServingStatus.serviceUnknown,
      _ => throw Exception('Unknown status value: ${status.value}'),
    };
    return domain.HealthCheckResult(
      status: _status,
      message: message,
    );
  }
}

extension LogEntryTransform on domain_pb.LogEntry {
  domain.LogEntry toLogEntryDomain() {
    return domain.LogEntry(
      timestamp: timestamp.toDateTime(),
      level: switch (level.value) {
        0 => domain.LogLevel.debug,
        1 => domain.LogLevel.info,
        2 => domain.LogLevel.warn,
        3 => domain.LogLevel.error,
        4 => domain.LogLevel.critical,
        _ => throw Exception('Unknown log level value: ${level.value}'),
      },
      loggerName: loggerName,
      message: message,
      exception: exception,
    );
  }
}

extension DomainLogLevelTransform on domain.LogLevel {
  domain_pb.LogLevel toPbLogLevel() {
    return switch (this) {
      domain.LogLevel.debug => domain_pb.LogLevel.DEBUG,
      domain.LogLevel.info => domain_pb.LogLevel.INFO,
      domain.LogLevel.warn => domain_pb.LogLevel.WARNING,
      domain.LogLevel.error => domain_pb.LogLevel.ERROR,
      domain.LogLevel.critical => domain_pb.LogLevel.CRITICAL,
    };
  }
}
