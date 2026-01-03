import 'package:dartx/dartx.dart';
import 'package:news_hub/domain/models/models.dart' as domain;
import 'package:news_hub/shared/extensions.dart';
import 'sidecar_api.pb.dart' as pb;

extension SiteTransform on pb.Site {
  domain.Site toSiteDomain() {
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
  domain.Board toBoardDomain() {
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
  domain.Post toPostDomain() {
    switch (whichContent()) {
      case pb.Post_Content.articlePost:
        return articlePost.toArticlePostDomain(this);
      case pb.Post_Content.singleImagePost:
        return singleImagePost.toSingleImagePostDomain(this);
      default:
        return articlePost.toArticlePostDomain(this);
    }
  }
}

extension ArticlePostTransform on pb.ArticlePost {
  domain.ArticlePost toArticlePostDomain(pb.Post post) {
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
      contents: contents.map((e) => e.toParagraphDomain()).toList(),
      tags: tags,
      url: url,
      title: title,
      latestRegardingPostCreatedAt: latestRegardingPostCreatedAt.toDateTime(),
      regardingPostsCount: regardingPostsCount,
    );
  }
}

extension SingleImagePostTransform on pb.SingleImagePost {
  domain.SingleImagePost toSingleImagePostDomain(pb.Post post) {
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
      image: image.toImageParagraphDomain(),
      contents: contents.map((e) => e.toParagraphDomain()).toList(),
      tags: tags,
      url: url,
      title: title,
      latestRegardingPostCreatedAt: latestRegardingPostCreatedAt.toDateTime(),
      regardingPostsCount: regardingPostsCount,
    );
  }
}

extension CommentTransform on pb.Comment {
  domain.Comment toCommentDomain() {
    return domain.Comment(
      id: id,
      postId: postId,
      threadId: threadId,
      boardId: boardId,
      siteId: siteId,
      extensionPkgName: pkgName,
      contents: contents.map((e) => e.toParagraphDomain()).toList(),
      authorId: authorId,
      authorName: authorName,
    );
  }
}

extension ParagraphTransform on pb.Paragraph {
  domain.Paragraph toParagraphDomain() {
    switch (whichContent()) {
      case pb.Paragraph_Content.image:
        return image.toImageParagraphDomain();
      case pb.Paragraph_Content.video:
        return video.toVideoParagraphDomain();
      case pb.Paragraph_Content.text:
        return text.toTextParagraphDomain();
      case pb.Paragraph_Content.newLine:
        return newLine.toNewLineParagraphDomain();
      case pb.Paragraph_Content.quote:
        return quote.toQuoteParagraphDomain();
      case pb.Paragraph_Content.replyTo:
        return replyTo.toReplyToParagraphDomain();
      case pb.Paragraph_Content.link:
        return link.toLinkParagraphDomain();
      default:
        return text.toTextParagraphDomain();
    }
  }
}

extension ImageParagraphTransform on pb.ImageParagraph {
  domain.ImageParagraph toImageParagraphDomain() {
    return domain.ImageParagraph(
      thumb: thumb,
      raw: raw,
    );
  }
}

extension VideoParagraphTransform on pb.VideoParagraph {
  domain.VideoParagraph toVideoParagraphDomain() {
    return domain.VideoParagraph(
      thumb: thumb,
      url: url,
    );
  }
}

extension TextParagraphTransform on pb.TextParagraph {
  domain.TextParagraph toTextParagraphDomain() {
    return domain.TextParagraph(
      content: content,
    );
  }
}

extension NewLineParagraphTransform on pb.NewLineParagraph {
  domain.NewLineParagraph toNewLineParagraphDomain() {
    return domain.NewLineParagraph(
      symbol: symbol,
    );
  }
}

extension QuoteParagraphTransform on pb.QuoteParagraph {
  domain.QuoteParagraph toQuoteParagraphDomain() {
    return domain.QuoteParagraph(
      content: content,
    );
  }
}

extension ReplyToParagraphTransform on pb.ReplyToParagraph {
  domain.ReplyToParagraph toReplyToParagraphDomain() {
    return domain.ReplyToParagraph(
      id: id,
      authorName: authorName,
      preview: preview,
    );
  }
}

extension LinkParagraphTransform on pb.LinkParagraph {
  domain.LinkParagraph toLinkParagraphDomain() {
    return domain.LinkParagraph(
      content: content,
    );
  }
}

extension ExtensionTransform on pb.Extension {
  domain.Extension toExtensionDomain() {
    return domain.Extension(
      repoBaseUrl: repoBaseUrl,
      pkgName: pkgName,
      displayName: displayName,
      zipName: zipName,
      version: version,
      pythonVersion: pythonVersion,
      lang: hasLang() ? lang : null,
      isNsfw: isNsfw,
    );
  }
}

extension RemoteExtensionTransform on pb.RemoteExtension {
  domain.RemoteExtension toRemoteExtensionDomain() {
    return domain.RemoteExtension(
      repoBaseUrl: base.repoBaseUrl,
      pkgName: base.pkgName,
      displayName: base.displayName,
      zipName: base.zipName,
      version: base.version,
      pythonVersion: base.pythonVersion,
      lang: base.hasLang() ? base.lang : null,
      isNsfw: base.isNsfw,
      iconUrl: iconUrl,
      repoUrl: repoUrl,
    );
  }
}

extension ExtensionRepoTransform on pb.ExtensionRepo {
  domain.ExtensionRepo toExtensionRepoDomain() {
    return domain.ExtensionRepo(
      baseUrl: url,
      displayName: url,
      website: url,
      signingKeyFingerprint: '',
      icon: null,
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

extension LogEntryTransform on pb.LogEntry {
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
  pb.LogLevel toPbLogLevel(){
    return switch (this) {
      domain.LogLevel.debug => pb.LogLevel.DEBUG,
      domain.LogLevel.info => pb.LogLevel.INFO,
      domain.LogLevel.warn => pb.LogLevel.WARNING,
      domain.LogLevel.error => pb.LogLevel.ERROR,
      domain.LogLevel.critical => pb.LogLevel.CRITICAL,
    };
  }
}