import 'dart:math';

import 'package:dartx/dartx.dart';

class ExtensionRepo {
  final String baseUrl;
  final String displayName;
  final String website;
  final String signingKeyFingerprint;

  ExtensionRepo({
    required this.baseUrl,
    required this.displayName,
    required this.website,
    required this.signingKeyFingerprint,
  });

  static mock() {
    return ExtensionRepo(
      baseUrl: 'https://example.com',
      displayName: 'Mock Extension Repo',
      website: 'https://example.com',
      signingKeyFingerprint: "signingKeyFingerprint",
    );
  }
}

class Extension {
  final String pkgName;
  final String displayName;
  final String zipName;
  final String address;
  final int version;
  final int pythonVersion;
  final String? lang;
  final bool isNsfw;
  final Site site;
  final Set<Board> boards;

  Extension({
    required this.pkgName,
    required this.displayName,
    required this.zipName,
    required this.address,
    required this.version,
    required this.pythonVersion,
    this.lang,
    required this.isNsfw,
    required this.site,
    required this.boards,
  });

  static Extension mock() {
    final id = Random().nextInt(100);
    return Extension(
      pkgName: 'twkevinzhan_beeceptor$id',
      displayName: 'beeceptor$id',
      zipName: 'beeceptor.zip',
      address: 'http://127.0.0.1:55001',
      version: 1,
      pythonVersion: 1,
      isNsfw: false,
      lang: 'zh_tw',
      site: Site.mock(),
      boards: {
        Board.mock(),
      },
    );
  }
}

class RemoteExtension extends Extension {
  final String iconUrl;
  final String repoUrl;

  RemoteExtension({
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
    required super.site,
    required super.boards,
  });

  static RemoteExtension mock() {
    return RemoteExtension(
      pkgName: 'twkevinzhan_beeceptor',
      displayName: 'beeceptor',
      zipName: 'beeceptor.zip',
      address: 'http://127.0.0.1:55001',
      version: 1,
      pythonVersion: 1,
      isNsfw: false,
      lang: 'zh_tw',
      iconUrl: '',
      repoUrl: '',
      site: Site.mock(),
      boards: {},
    );
  }
}

extension RemoteExtensionEx on RemoteExtension {
  RemoteExtension copyWith({
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
      site: site ?? this.site,
      boards: boards.isNotEmpty ? boards : this.boards,
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

  static mock() {
    final id = Random().nextInt(100);
    return Site(
      extensionPkgName: 'twkevinzhan_beeceptor$id',
      id: '$id',
      name: 'Beeceptor',
      icon: 'beeceptor.png',
      url: 'https://beeceptor.com/',
    );
  }
}

class Board {
  final String extensionPkgName;
  final String siteId;
  final String id;
  final String name;
  final String icon;
  final String largeWelcomeImage;
  final String url;
  final Set<String> supportedSorting;

  Board({
    required this.extensionPkgName,
    required this.siteId,
    required this.id,
    required this.name,
    required this.icon,
    required this.largeWelcomeImage,
    required this.url,
    required this.supportedSorting,
  });

  static Board mock() {
    final id = Random().nextInt(100);
    return Board(
      extensionPkgName: 'twkevinzhan_beeceptor$id',
      siteId: '${Random().nextInt(100)}',
      id: '$id',
      name: 'Beeceptor$id',
      icon: 'beeceptor.png',
      largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
      url: 'https://beeceptor.com/',
      supportedSorting: {'newest', 'popular'},
    );
  }
}

class Thread {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String id;
  final String url;
  final Post masterPost;

  Thread({
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
    required this.id,
    required this.url,
    required this.masterPost,
  });

  static Thread mock() {
    return Thread(
      extensionPkgName: 'twkevinzhan_beeceptor',
      siteId: '1',
      boardId: '1',
      id: '1',
      url: 'https://beeceptor.com/',
      masterPost: Post.mock(),
    );
  }
}

class Post {
  final String extensionPkgName;
  final String siteId;
  final String boardId;
  final String threadId;
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
    required this.extensionPkgName,
    required this.siteId,
    required this.boardId,
    required this.threadId,
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

  static Post mock() {
    return Post(
      extensionPkgName: 'twkevinzhan_beeceptor',
      siteId: '1',
      boardId: '1',
      threadId: '1',
      id: '1',
      createdAt: DateTime.now(),
      posterId: '1',
      posterName: '無名',
      like: 0,
      dislike: 0,
      comments: 0,
      contents: [
        ApiText('Text Content Maybe'),
        ApiVideo(null, 'https://www.youtube.com/watch?v=_m7lYMTNQg8'),
        ApiImage('https://dummyimage.com/200x300/000/fff',
            'https://picsum.photos/200/300'),
        Quote('i m quote'),
        ReplyTo('first-respondent'),
        Link('https://pub.dev/packages/better_player'),
      ],
    );
  }
}

enum ParagraphType { QUOTE, REPLY_TO, TEXT, IMAGE, LINK, VIDEO }

abstract class Paragraph {
  final ParagraphType type;
  Paragraph(this.type);
}

class ApiImage extends Paragraph {
  final String? _thumb;
  final String raw;

  ApiImage(
    this._thumb,
    this.raw,
  ) : super(ParagraphType.IMAGE);

  thumb() {
    return _thumb ?? raw;
  }
}

class ApiVideo extends Paragraph {
  final String? thumb;
  final String url;

  ApiVideo(this.thumb, this.url) : super(ParagraphType.VIDEO);
}

class ApiText extends Paragraph {
  final String content;

  ApiText(this.content) : super(ParagraphType.TEXT);
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

  static mock() {
    return Comment(id: "comment-1", contents: [ApiText("this is a comment")]);
  }
}

class Condition {
  late final String id;
  late final Set<String> enabledExtensionPkgNames;
  late final Set<String> enabledBoardIds;
  late final Map<String, String> threadsSorting; // boardId -> sorting
  late final String? keywords;

  Condition(
      {required this.id,
      required this.enabledExtensionPkgNames,
      required this.enabledBoardIds,
      required this.threadsSorting,
      required this.keywords});

  static Condition empty() {
    return Condition(
        id: "",
        enabledExtensionPkgNames: {},
        enabledBoardIds: {},
        threadsSorting: {},
        keywords: null,
    );
  }

  Condition.mock() {
    id = "mockid";
    enabledExtensionPkgNames = {
      Extension.mock().pkgName,
    };
    enabledBoardIds = {
      Board.mock().id,
    };
    threadsSorting = {
      Board.mock().id: 'newest',
    };
    keywords = null;
  }

  // static mock() {
  //   return Condition(
  //     enabledBoards: {Board.mock()},
  //     threadsSorting: {
  //       Pair(Board.mock(), 'newest'),
  //     },
  //     keywords: '', id: 'mockid',
  //   );
  // }
}
