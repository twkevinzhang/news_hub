import 'dart:async';
import 'package:dartx/dartx.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/shared/constants.dart';
import 'package:news_hub/shared/models.dart';
import 'package:news_hub/domain/extension/extension.dart';
import 'package:news_hub/domain/models/models.dart';

final _mockBoard1Posts = [
  // only this one post in board 1
  Post(
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
    comments: _mockPost1Comments.length,
    regardingPostsCount: _mockPost1RegardingPosts.length,
    contents: [
      TextParagraph(content: 'Text Content Maybe'),
      QuoteParagraph(content: 'i m quote'),
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
  Post(
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
    comments: null,
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

@Environment(AppEnv.mockExtension)
@LazySingleton(as: ExtensionApiService)
class MockExtensionApiServiceImpl implements ExtensionApiService {
  @override
  Future<Site> site(GetSiteParams params) async {
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
  Future<List<Board>> boards(GetBoardsParams params) async {
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
  Future<List<Post>> threadInfos(GetThreadInfosParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    if (params.boardId == '1') {
      return _mockBoard1Posts;
    } else {
      return [];
    }
  }

  @override
  Future<Post> thread(GetThreadParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockBoard1Posts.firstWhere((post) => post.id == params.threadId);
  }

  @override
  Future<List<Post>> regardingPosts(GetRegardingPostsParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    if (params.threadId == '1' && params.replyToId == null) {
      return _mockPost1RegardingPosts;
    } else {
      return [];
    }
  }

  @override
  Future<Post> post(GetPostParams params) async {
    throw UnimplementedError();
  }

  @override
  Future<List<Comment>> comments(GetCommentsParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockPost1Comments;
  }
}
