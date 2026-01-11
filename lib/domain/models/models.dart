import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

enum ServingStatus {
  unknown,
  serving,
  notServing,
  serviceUnknown,
}

class HealthCheckResult {
  final ServingStatus status;
  final String? message;

  HealthCheckResult({
    required this.status,
    this.message,
  });
}

enum LogLevel {
  debug,
  info,
  warn,
  error,
  critical,
}

extension LogLevelEx on String {
  LogLevel toLogLevel() {
    try {
      return LogLevel.values.byName(toLowerCase());
    } catch (e) {
      return LogLevel.info;
    }
  }
}

class LogEntry {
  final DateTime timestamp;
  final LogLevel level;
  final String loggerName;
  final String message;
  final String exception;

  LogEntry({
    required this.timestamp,
    required this.level,
    required this.loggerName,
    required this.message,
    required this.exception,
  });
}

class Repo {
  final String? icon;
  final String baseUrl;
  final String displayName;
  final String website;
  final String signingKeyFingerprint;

  Repo({
    this.icon,
    required this.baseUrl,
    required this.displayName,
    required this.website,
    required this.signingKeyFingerprint,
  });
}

class Extension {
  final String pkgName;
  final String displayName;
  final int version;
  final int pythonVersion;
  final String? lang;
  final bool isNsfw;

  Extension({
    required this.pkgName,
    required this.displayName,
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
    required super.pkgName,
    required super.displayName,
    required super.version,
    required super.pythonVersion,
    required super.lang,
    required super.isNsfw,
    required this.repoUrl,
    required this.iconUrl,
  });
}

extension RemoteExtensionEx on RemoteExtension {
  RemoteExtension copyWith({
    String? pkgName,
    String? displayName,
    int? version,
    int? pythonVersion,
    String? lang,
    bool? isNsfw,
    String? iconUrl,
    String? repoUrl,
    Set<Board> boards = const {},
  }) {
    return RemoteExtension(
      pkgName: pkgName ?? this.pkgName,
      displayName: displayName ?? this.displayName,
      version: version ?? this.version,
      pythonVersion: pythonVersion ?? this.pythonVersion,
      lang: lang ?? this.lang,
      isNsfw: isNsfw ?? this.isNsfw,
      iconUrl: iconUrl ?? this.iconUrl,
      repoUrl: repoUrl ?? this.repoUrl,
    );
  }
}

class Collection {
  final String id;
  final String name;
  final List<Board> boards;

  Collection({
    required this.id,
    required this.name,
    required this.boards,
  });
}

@freezed
class Board with _$Board {
  const factory Board({
    required String extensionPkgName,
    required String id,
    required String name,
    required String icon,
    required String largeWelcomeImage,
    required String url,
    required Set<String> supportedThreadsSorting,
    String? selectedThreadsSorting,
  }) = _Board;
}

class Post {
  final String extensionPkgName;
  final String boardId;
  final String threadId;
  final String id;

  Post({
    required this.extensionPkgName,
    required this.boardId,
    required this.threadId,
    required this.id,
  });
}

class SingleImagePost extends Post {
  final String? title;
  final String? url;
  final DateTime createdAt;
  final String authorId;
  final String authorName;
  final int? liked;
  final int? disliked;
  final List<String>? tags;
  final ImageParagraph? image;
  final List<Paragraph> contents;
  final DateTime? latestReplyCreatedAt;
  final int? repliesCount;

  SingleImagePost({
    required super.extensionPkgName,
    required super.boardId,
    required super.threadId,
    required super.id,
    this.title,
    this.url,
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    required this.liked,
    required this.disliked,
    required this.image,
    required this.contents,
    this.latestReplyCreatedAt,
    this.repliesCount,
    required this.tags,
  });
}

extension SingleImagePostListEx on List<SingleImagePost> {
  Iterable<Post> filterBy({required String replyToId}) {
    return where((post) => post.contents.any((p) {
          if (p is ReplyToParagraph) {
            return p.id == replyToId;
          }
          return false;
        }));
  }
}

class ArticlePost extends Post {
  final String? title;
  final String? url;
  final DateTime createdAt;
  final String authorId;
  final String authorName;
  final int? liked;
  final int? disliked;
  final List<String>? tags;
  final List<Paragraph> contents;
  final DateTime? latestReplyCreatedAt;
  final int? repliesCount;

  ArticlePost({
    required super.extensionPkgName,
    required super.boardId,
    required super.threadId,
    required super.id,
    this.title,
    this.url,
    required this.createdAt,
    required this.authorId,
    required this.authorName,
    required this.liked,
    required this.disliked,
    required this.contents,
    this.latestReplyCreatedAt,
    this.repliesCount,
    required this.tags,
  });
}

extension ArticlePostListEx on List<ArticlePost> {
  Iterable<ArticlePost> filterBy({required String targetId}) {
    return where((post) => post.contents.any((p) {
          if (p is ReplyToParagraph) {
            return p.id == targetId;
          }
          return false;
        }));
  }
}

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

  ImageParagraph({
    String? thumb,
    required this.raw,
  })  : _thumb = thumb,
        super(ParagraphType.image);

  thumb() {
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
    return url.startsWith("https://") && (url.contains('youtube.com') || url.contains('youtu.be'));
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

class Comment {
  final String extensionPkgName;
  final String boardId;
  final String threadId;
  final String postId;
  final String id;
  final String authorId;
  final String authorName;
  final List<Paragraph> contents;

  Comment({
    required this.extensionPkgName,
    required this.boardId,
    required this.threadId,
    required this.postId,
    required this.id,
    required this.contents,
    required this.authorId,
    required this.authorName,
  });
}

class Bookmark {
  final String id;
  final ThreadsFilter filter;
  final ThreadsSorting sorting;

  Bookmark({
    required this.id,
    required this.filter,
    required this.sorting,
  });
}

@Freezed(toJson: true)
class ThreadsFilter with _$ThreadsFilter {
  const factory ThreadsFilter({
    required Map<String, String> boardSorts,
    required String keywords,
  }) = _ThreadsFilter;
}

extension ThreadsFilterEx on ThreadsFilter {
  int boardsTotal() {
    final boardIds = boardSorts.keys.toSet();
    return boardIds.length;
  }

  bool get isEmpty {
    return boardSorts.isEmpty && keywords.isEmpty;
  }
}

@Freezed(toJson: true)
class ThreadsSorting with _$ThreadsSorting {
  const factory ThreadsSorting({
    required List<String> boardsOrder,
  }) = _ThreadsSorting;
}

class Suggestion {
  final String id;
  final String keywords;
  final DateTime latestUsedAt;

  Suggestion({
    required this.id,
    required this.keywords,
    required this.latestUsedAt,
  });
}
