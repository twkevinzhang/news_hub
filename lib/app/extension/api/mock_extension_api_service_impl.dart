import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';

final _mockPost = Post(
  extensionPkgName: 'twkevinzhang_beeceptor',
  siteId: '1',
  boardId: '1',
  threadId: '1',
  id: '1',
  createdAt: DateTime.now(),
  authorId: '1',
  authorName: '無名',
  like: 0,
  dislike: 0,
  comments: 0,
  contents: [
    TextParagraph(content: 'Text Content Maybe'),
    VideoParagraph(thumb: null, url: 'https://www.youtube.com/watch?v=_m7lYMTNQg8'),
    ImageParagraph(thumb: 'https://dummyimage.com/200x300/000/fff', raw: 'https://picsum.photos/200/300'),
    QuoteParagraph(content: 'i m quote'),
    ReplyToParagraph(id: 'first-respondent'),
    LinkParagraph(content: 'https://pub.dev/packages/better_player'),
  ],
);

@Environment(AppEnv.mockExtension)
@LazySingleton(as: ExtensionApiService)
class MockExtensionApiServiceImpl implements ExtensionApiService {
  @override
  Future<Site> site({
    required String extensionPkgName,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return Site(
      extensionPkgName: 'twkevinzhang_beeceptor',
      id: '1',
      name: 'Beeceptor',
      icon: 'beeceptor.ico',
      url: 'https://beeceptor.com',
    );
  }

  @override
  Future<List<Board>> boards({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '1',
        name: '八卦版',
        icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
        largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
        url: 'https://beeceptor.com/goss',
        supportedThreadsSorting: {'newest', 'popular'},
      ),
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '2',
        name: '遊戲版',
        icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
        largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
        url: 'https://beeceptor.com/game',
        supportedThreadsSorting: {'newest', 'popular'},
      ),
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '3',
        name: '電蝦版',
        icon: 'https://cdn-icons-png.flaticon.com/512/809/809103.png',
        largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
        url: 'https://beeceptor.com/work',
        supportedThreadsSorting: {'newest', 'popular'},
      ),
    ];
  }

  @override
  Future<List<ThreadInfo>> threadInfos({
    Pagination? pagination,
    String? sortBy,
    String? keywords,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (boardId == '1') {
      return [
        ThreadInfo(
          extensionPkgName: 'twkevinzhang_beeceptor',
          siteId: '1',
          boardId: '1',
          id: '1',
          url: 'https://beeceptor.com/threads/1',
          title: 'Thread Title',
          authorName: 'Author',
          createdAt: DateTime.now(),
          latestRegardingPostCreatedAt: DateTime.now(),
          regardingPostCount: 1,
          previewContent: 'Preview Content',
          tags: [],
        ),
      ];
    } else {
      return [];
    }
  }

  @override
  Future<Thread> thread({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String id,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return Thread(
      extensionPkgName: 'twkevinzhang_beeceptor',
      siteId: '1',
      boardId: '1',
      id: '1',
      url: 'https://beeceptor.com/',
      originalPost: _mockPost,
      latestRegardingPostCreatedAt: DateTime.now().millisecondsSinceEpoch,
      regardingPostCount: 1,
      tags: [],
    );
  }

  @override
  Future<List<Post>> regardingPosts({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Post>.generate(3, (index) => _mockPost);
  }

  @override
  Future<Post> post({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String id,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockPost;
  }

  @override
  Future<List<Comment>> comments({
    Pagination? pagination,
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Comment(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        boardId: '1',
        threadId: '1',
        postId: '1',
        id: '1',
        authorId: '1',
        authorName: 'Author',
        contents: [TextParagraph(content: 'this is a comment')],
      ),
      Comment(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        boardId: '1',
        threadId: '1',
        postId: '1',
        id: '2',
        authorId: '1',
        authorName: 'Author',
        contents: [TextParagraph(content: 'this is a comment')],
      ),
      Comment(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        boardId: '1',
        threadId: '1',
        postId: '1',
        id: '3',
        authorId: '1',
        authorName: 'Author',
        contents: [TextParagraph(content: 'this is a comment')],
      ),
    ];
  }
}
