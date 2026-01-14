import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_original_post.dart';

class TestDataFactory {
  static const tExtensionPkgName = 'com.example.ext';
  static const tBoardId = 'board_1';
  static const tThreadId = 'thread_1';

  static Extension createExtension({
    String pkgName = tExtensionPkgName,
    String displayName = 'Test Extension',
    int version = 1,
    int pythonVersion = 3,
    bool isNsfw = false,
  }) {
    return Extension(
      pkgName: pkgName,
      displayName: displayName,
      version: version,
      pythonVersion: pythonVersion,
      isNsfw: isNsfw,
    );
  }

  static Board createBoard({
    String extensionPkgName = tExtensionPkgName,
    String id = tBoardId,
    String name = 'Test Board',
    String url = 'http://example.com/board',
    String icon = 'icon.png',
    String largeWelcomeImage = 'welcome.png',
    Set<String> sortOptions = const {},
  }) {
    return Board(
      extensionPkgName: extensionPkgName,
      id: id,
      name: name,
      url: url,
      icon: icon,
      largeWelcomeImage: largeWelcomeImage,
      sortOptions: sortOptions,
    );
  }

  static ArticlePost createArticlePost({
    String extensionPkgName = tExtensionPkgName,
    String boardId = tBoardId,
    String threadId = tThreadId,
    String id = tThreadId,
    String? title = 'Test Thread',
    DateTime? createdAt,
    String authorId = 'author_1',
    String authorName = 'Author Name',
    int? liked = 0,
    int? disliked = 0,
    List<Paragraph> contents = const [],
    List<String>? tags = const [],
  }) {
    return ArticlePost(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      id: id,
      title: title,
      createdAt: createdAt ?? DateTime.now(),
      authorId: authorId,
      authorName: authorName,
      liked: liked,
      disliked: disliked,
      contents: contents,
      tags: tags,
    );
  }

  static ArticlePostWithExtension createArticlePostWithExtension({
    ArticlePost? post,
    Extension? extension,
    Board? board,
  }) {
    return ArticlePostWithExtension(
      post: post ?? createArticlePost(),
      extension: extension ?? createExtension(),
      board: board ?? createBoard(),
    );
  }

  static BoardIdentity createBoardIdentity({
    String extensionPkgName = tExtensionPkgName,
    String boardId = tBoardId,
    String boardName = 'Test Board',
  }) {
    return BoardIdentity(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      boardName: boardName,
    );
  }

  static CollectionBoard createCollectionBoard({
    BoardIdentity? identity,
    String collectionId = 'col_1',
    String? selectedSort,
  }) {
    return CollectionBoard(
      identity: identity ?? createBoardIdentity(),
      collectionId: collectionId,
      selectedSort: selectedSort,
    );
  }

  static Collection createCollection({
    String id = 'col_1',
    String name = 'Test Collection',
    List<CollectionBoard> boards = const [],
  }) {
    return Collection(id: id, name: name, boards: boards);
  }

  static SingleImagePost createSingleImagePost({
    String extensionPkgName = tExtensionPkgName,
    String boardId = tBoardId,
    String threadId = tThreadId,
    String id = tThreadId,
    String? title = 'Test Single Image Post',
    DateTime? createdAt,
    String authorId = 'author_1',
    String authorName = 'Author Name',
    int? liked = 0,
    int? disliked = 0,
    List<Paragraph> contents = const [],
    List<String>? tags = const [],
    ImageParagraph? image,
  }) {
    return SingleImagePost(
      extensionPkgName: extensionPkgName,
      boardId: boardId,
      threadId: threadId,
      id: id,
      title: title,
      createdAt: createdAt ?? DateTime.now(),
      authorId: authorId,
      authorName: authorName,
      liked: liked,
      disliked: disliked,
      contents: contents,
      tags: tags,
      image: image,
    );
  }

  static SingleImagePostWithExtension createSingleImagePostWithExtension({
    SingleImagePost? post,
    Extension? extension,
    Board? board,
  }) {
    return SingleImagePostWithExtension(
      post: post ?? createSingleImagePost(),
      extension: extension ?? createExtension(),
      board: board ?? createBoard(),
    );
  }
}
