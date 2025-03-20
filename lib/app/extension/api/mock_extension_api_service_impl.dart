import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';

final _mockBoard1Posts = [
  // only this one post in board 1
  ArticlePost(
    extensionPkgName: 'twkevinzhang_beeceptor',
    siteId: '1',
    boardId: '1',
    threadId: '1',
    id: '1',
    createdAt: DateTime.now(),
    authorId: '1',
    authorName: '無名',
    liked: 0,
    disliked: null,
    regardingPostsCount: _mockPost1RegardingPosts.length,
    contents: [
      TextParagraph(content: 'Text Content Maybe'),
      QuoteParagraph(content: 'i m quote'),
      VideoParagraph(thumb: null, url: 'https://user-images.githubusercontent.com/28951144/229373695-22f88f13-d18f-4288-9bf1-c3e078d83722.mp4'),
      VideoParagraph(thumb: null, url: 'https://www.youtube.com/watch?v=_m7lYMTNQg8'),
      ImageParagraph(
        thumb: 'https://dummyimage.com/200x300/000/fff&text=thumb',
        raw: 'https://dummyimage.com/1200x1800/000/fff&text=raw',
      ),
      ImageParagraph(
        thumb: 'https://dummyimage.com/1200x1800/ff5733/ffffff&text=thumb',
        raw: 'https://dummyimage.com/1200x1800/ff5733/ffffff&text=raw',
      ),
      LinkParagraph(content: 'https://pub.dev/packages/better_player'),
    ],
    tags: null,
  ),
];

final _mockPost1RegardingPosts = [
  // The post is a regarding post of the mock post 1
  ArticlePost(
    extensionPkgName: 'twkevinzhang_beeceptor',
    siteId: '1',
    boardId: '1',
    threadId: '1',
    id: '2',
    createdAt: DateTime.now(),
    authorId: '2',
    authorName: '無名',
    liked: 0,
    disliked: null,
    regardingPostsCount: null,
    contents: [
      ReplyToParagraph(id: '1', authorName: '無名', preview: 'Text Content Maybe'),
      TextParagraph(content: 'The post is a regarding post of the mock post 1'),
    ],
    tags: null,
  ),
];

final _mockPost1Comments = [
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

@Environment(AppEnv.mockData)
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
    required String extensionPkgName,
    required String siteId,
    Pagination? pagination,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '1',
        name: 'Board 1',
        icon: 'icon1',
        largeWelcomeImage: 'largeWelcomeImage1',
        url: 'https://example.com/board1',
        supportedThreadsSorting: {'sorting1'},
      ),
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '2',
        name: 'Board 2',
        icon: 'icon2',
        largeWelcomeImage: 'largeWelcomeImage2',
        url: 'https://example.com/board2',
        supportedThreadsSorting: {'sorting2'},
      ),
    ];
  }

  @override
  Future<List<Post>> threadInfos({
    required String extensionPkgName,
    required String siteId,
    required Map<String, String>? boardsSorting,
    Pagination? pagination,
    String? sortBy,
    String? keywords,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (boardsSorting != null) {
      if (boardsSorting.keys.contains("1")) {
        return _mockBoard1Posts.where((post) {
          return post.contents.any((content) {
            if (content is TextParagraph) {
              return content.content.contains(keywords!);
            } else {
              return false;
            }
          });
        }).toList();
      } else if (boardsSorting.keys.isEmpty) {
        return _mockBoard1Posts;
      }
    } else if (boardsSorting == null) {
      return _mockBoard1Posts;
    }
    return [];
  }

  @override
  Future<Post> thread({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? postId,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockBoard1Posts.firstWhere((post) => post.id == threadId);
  }

  @override
  Future<List<Post>> regardingPosts({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    String? replyToId,
    Pagination? pagination,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    if (threadId == '1' && replyToId == null) {
      return _mockPost1RegardingPosts;
    } else {
      return [];
    }
  }

  @override
  Future<List<Comment>> comments({
    required String extensionPkgName,
    required String siteId,
    required String boardId,
    required String threadId,
    required String postId,
    Pagination? pagination,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockPost1Comments;
  }
}
