class ExtensionRepo {
  final String? icon;
  final String baseUrl;
  final String displayName;
  final String website;
  final String signingKeyFingerprint;

  ExtensionRepo({
    this.icon,
    required this.baseUrl,
    required this.displayName,
    required this.website,
    required this.signingKeyFingerprint,
  });
}

class Extension {
  final String repoBaseUrl;
  final String pkgName;
  final String displayName;
  final String zipName;
  final String address;
  final int version;
  final int pythonVersion;
  final String? lang;
  final bool isNsfw;

  Extension({
    required this.repoBaseUrl,
    required this.pkgName,
    required this.displayName,
    required this.zipName,
    required this.address,
    required this.version,
    required this.pythonVersion,
    this.lang,
    required this.isNsfw,
  });
}

class RemoteExtension extends Extension {
  final String iconUrl;
  final String repoUrl;

  RemoteExtension({
    required super.repoBaseUrl,
    required super.pkgName,
    required super.displayName,
    required super.zipName,
    required super.address,
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required this.iconUrl,
    required this.repoUrl,
  });
}

extension RemoteExtensionEx on RemoteExtension {
  RemoteExtension copyWith({
    String? repoBaseUrl,
    String? pkgName,
    String? displayName,
    String? zipName,
    String? address,
    int? version,
    int? pythonVersion,
    String? lang,
    bool? isNsfw,
    String? iconUrl,
    String? repoUrl,
    Site? site,
    Set<Board> boards = const {},
  }) {
    return RemoteExtension(
      repoBaseUrl: repoBaseUrl ?? this.repoBaseUrl,
      pkgName: pkgName ?? this.pkgName,
      displayName: displayName ?? this.displayName,
      zipName: zipName ?? this.zipName,
      address: address ?? this.address,
      version: version ?? this.version,
      pythonVersion: pythonVersion ?? this.pythonVersion,
      lang: lang ?? this.lang,
      isNsfw: isNsfw ?? this.isNsfw,
      iconUrl: iconUrl ?? this.iconUrl,
      repoUrl: repoUrl ?? this.repoUrl,
    );
  }
}

class Site {
  final String extensionPkgName;
  final String id;
  final String name;
  final String icon;
  final String url;

  Site({
    required this.extensionPkgName,
    required this.id,
    required this.name,
    required this.icon,
    required this.url,
  });
}

class Board {
  final String extensionPkgName;
  final String siteId;
  final String id;
  final String name;
  final String icon;
  final String largeWelcomeImage;
  final String url;
  final Set<String> supportedThreadsSorting;

  Board({
    required this.extensionPkgName,
    required this.siteId,
    required this.id,
    required this.name,
    required this.icon,
    required this.largeWelcomeImage,
    required this.url,
    required this.supportedThreadsSorting,
  });
}

class ThreadInfo {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String id;
  final String url;
  final String title;
  final String authorName;
  final int createdAt;
  final int latestRegardingPostCreatedAt;
  final int regardingPostCount;
  final String previewContent;
  final List<String> tags;

  ThreadInfo({
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
    required this.id,
    required this.url,
    required this.title,
    required this.authorName,
    required this.createdAt,
    required this.latestRegardingPostCreatedAt,
    required this.regardingPostCount,
    required this.previewContent,
    required this.tags,
  });
}

class Thread {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String id;
  final String url;
  final int latestRegardingPostCreatedAt;
  final int regardingPostCount;
  final List<String> tags;
  final Post originalPost; // OP

  Thread({
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
    required this.id,
    required this.url,
    required this.latestRegardingPostCreatedAt,
    required this.regardingPostCount,
    required this.tags,
    required this.originalPost,
  });
}

class Post {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String threadId;
  final String? originPostId;
  final String id;
  final String? title;
  final String? url;
  final DateTime createdAt;
  final String authorId;
  final String authorName;
  final int like;
  final int dislike;
  final int comments;
  final List<Paragraph> contents;

  Post({
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
    required this.threadId,
    this.originPostId,
    required this.id,
    this.title,
    this.url,
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    required this.like,
    required this.dislike,
    required this.comments,
    required this.contents,
  });
}

enum ParagraphType { quote, replyTo, text, image, link, video }

abstract class Paragraph {
  final ParagraphType type;
  Paragraph(this.type);
}

class ImageParagraph extends Paragraph {
  final String? _thumb;
  final String raw;

  ImageParagraph({
    String? thumb,
    required this.raw,
  })  : _thumb = thumb,
        super(ParagraphType.image);

  thumb() {
    return _thumb ?? raw;
  }
}

class VideoParagraph extends Paragraph {
  final String? thumb;
  final String url;

  VideoParagraph({this.thumb, required this.url}) : super(ParagraphType.video);
}

class TextParagraph extends Paragraph {
  final String content;

  TextParagraph({required this.content}) : super(ParagraphType.text);
}

class QuoteParagraph extends Paragraph {
  final String content;

  QuoteParagraph({required this.content}) : super(ParagraphType.quote);
}

class ReplyToParagraph extends Paragraph {
  final String id;

  ReplyToParagraph({required this.id}) : super(ParagraphType.replyTo);
}

class LinkParagraph extends Paragraph {
  final String content;

  LinkParagraph({required this.content}) : super(ParagraphType.link);
}

class Comment {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String threadId;
  final String postId;
  final String id;
  final String authorId;
  final String authorName;
  final List<Paragraph> contents;

  Comment({
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
    required this.threadId,
    required this.postId,
    required this.id,
    required this.contents,
    required this.authorId,
    required this.authorName,
  });
}

/// 搜尋條件、排序
class SearchConfig {
  final String id;
  final Set<String> enabledExtensionPkgNames;
  final Set<String> enabledBoardIds;
  final List<String> boardsOrder;
  final Map<String, String> threadsSorting; // boardId -> sorting
  final String? keywords;

  SearchConfig({
    required this.id,
    required this.enabledExtensionPkgNames,
    required this.enabledBoardIds,
    required this.boardsOrder,
    required this.threadsSorting,
    required this.keywords,
  });
}
