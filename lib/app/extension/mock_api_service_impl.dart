import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/model.dart';
import 'package:news_hub/domain/extension/index.dart';
import 'package:news_hub/domain/model/index.dart';

final _mockPost = Post(
  extensionPkgName: 'twkevinzhang_beeceptor',
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

@LazySingleton(as: ExtensionApiService)
class MockExtensionApiServiceImpl extends ExtensionApiService {
  @override
  Future<void> run(Extension extension) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<void> ping(Extension extension) async {
    await Future.delayed(const Duration(seconds: 1));
  }

  @override
  Future<List<Board>> boards({
    Pagination? page,
    required Extension extension,
    required String siteId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '1',
        name: '八卦版',
        icon: 'beeceptor.png',
        largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
        url: 'https://beeceptor.com/goss',
        supportedThreadsSorting: {'newest', 'popular'},
      ),
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '2',
        name: '遊戲版',
        icon: 'beeceptor.png',
        largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
        url: 'https://beeceptor.com/game',
        supportedThreadsSorting: {'newest', 'popular'},
      ),
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '3',
        name: '電蝦版',
        icon: 'beeceptor.png',
        largeWelcomeImage: 'https://dummyimage.com/200x300/000/fff',
        url: 'https://beeceptor.com/work',
        supportedThreadsSorting: {'newest', 'popular'},
      ),
    ];
  }

  @override
  Future<List<Thread>> threads({
    Pagination? pagination,
    String? sortBy,
    String? keywords,
    required Extension extension,
    required String siteId,
    required String boardId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (boardId == '1') {
      return [
        Thread(
          extensionPkgName: 'twkevinzhang_beeceptor',
          siteId: '1',
          boardId: '1',
          boardName: '八卦版',
          id: '1',
          url: 'https://beeceptor.com/threads/1',
          masterPost: _mockPost,
        ),
      ];
    } else {
      return [];
    }
  }

  @override
  Future<Thread> thread({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return Thread(
      extensionPkgName: 'twkevinzhang_beeceptor',
      siteId: '1',
      boardId: '1',
      boardName: '八卦版',
      id: '1',
      url: 'https://beeceptor.com/',
      masterPost: _mockPost,
    );
  }

  @override
  Future<List<Post>> slavePosts({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return List<Post>.generate(3, (index) => _mockPost);
  }

  @override
  Future<Post> post({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockPost;
  }

  @override
  Future<List<Comment>> comments({
    Pagination? page,
    required Extension extension,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Comment(id: "1", contents: [ApiText("this is a comment")]),
      Comment(id: "2", contents: [ApiText("this is a comment")]),
      Comment(id: "3", contents: [ApiText("this is a comment")]),
    ];
  }
}
