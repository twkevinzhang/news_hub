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
  liked: 0,
  disliked: null,
  comments: null,
  regardingPostsCount: 3,
  contents: [
    TextParagraph(content: 'Text Content Maybe'),
    VideoParagraph(thumb: null, url: 'https://www.youtube.com/watch?v=_m7lYMTNQg8'),
    ImageParagraph(thumb: 'https://dummyimage.com/200x300/000/fff', raw: 'https://picsum.photos/200/300'),
    QuoteParagraph(content: 'i m quote'),
    LinkParagraph(content: 'https://pub.dev/packages/better_player'),
  ],
  tags: null,
);

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
      Board(
        extensionPkgName: 'twkevinzhang_beeceptor',
        siteId: '1',
        id: '3',
        name: 'Board 3',
        icon: 'icon3',
        largeWelcomeImage: 'largeWelcomeImage3',
        url: 'https://example.com/board3',
        supportedThreadsSorting: {'sorting3'},
      ),
    ];
  }

  @override
  Future<List<Post>> threadInfos(GetThreadInfosParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    if (params.boardId == '1') {
      return [_mockPost];
    } else {
      return [
        Post(
          extensionPkgName: 'twkevinzhang_beeceptor',
          siteId: '1',
          boardId: '2',
          threadId: '2',
          id: '2',
          createdAt: DateTime.now(),
          authorId: '2',
          authorName: 'Author 2',
          liked: 0,
          disliked: null,
          comments: null,
          regardingPostsCount: 0,
          contents: [
            TextParagraph(content: 'Text Content 2'),
          ],
          tags: null,
        ),
      ];
    }
  }

  @override
  Future<Post> thread(GetThreadParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockPost;
  }

  @override
  Future<List<Post>> regardingPosts(GetRegardingPostsParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return [
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
        comments: null,
        regardingPostsCount: 3,
        contents: [
          TextParagraph(content: 'Text Content Maybe'),
          VideoParagraph(thumb: null, url: 'https://www.youtube.com/watch?v=_m7lYMTNQg8'),
          ImageParagraph(thumb: 'https://dummyimage.com/200x300/000/fff', raw: 'https://picsum.photos/200/300'),
          QuoteParagraph(content: 'i m quote'),
          LinkParagraph(content: 'https://pub.dev/packages/better_player'),
        ],
        tags: null,
      ),
    ];
  }

  @override
  Future<Post> post(GetPostParams params) async {
    await Future.delayed(const Duration(seconds: 1));
    return _mockPost;
  }

  @override
  Future<List<Comment>> comments(GetCommentsParams params) async {
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
