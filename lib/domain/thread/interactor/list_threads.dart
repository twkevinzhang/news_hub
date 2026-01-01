import 'package:dartx/dartx.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:news_hub/domain/extension/extension_api_service.dart';
import 'package:news_hub/domain/extension/interactor/list_installed_extensions.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/domain/thread/interactor/get_thread.dart';
import 'package:news_hub/shared/models.dart';

@lazySingleton
class ListThreads {
  final ExtensionApiService _apiService;
  final ListInstalledExtensions _listInstalledExtensions;

  ListThreads({
    required ExtensionApiService apiService,
    required ListInstalledExtensions listInstalledExtensions,
  })  : _apiService = apiService,
        _listInstalledExtensions = listInstalledExtensions;

  Future<List<SingleImagePostWithExtension>> call({
    Pagination? pagination,
    ThreadsFilter? filter,
    ThreadsSorting? sorting,
  }) async {
    final extensions = await _listInstalledExtensions.withBoards();
    final threads = (await Future.wait(extensions.map((e) => _apiService.threadList(
              extensionPkgName: e.pkgName,
              siteId: e.site.id,
              boardsSorting: filter?.boardsSorting,
              pagination: pagination,
              keywords: filter?.keywords,
            ))))
        .flatten();

    return threads.map((t) {
      final e = extensions.firstWhere((e) => e.pkgName == t.extensionPkgName);
      final b = e.boards.firstWhere((b) => b.id == t.boardId);
      return SingleImagePostWithExtension(post: t as SingleImagePost, board: b, extension: e, site: e.site);
    }).toList();
  }
}

class SingleImagePostWithExtension extends SingleImagePost {
  final Extension extension;
  final Site site;
  final Board board;

  SingleImagePostWithExtension({
    required SingleImagePost post,
    required this.site,
    required this.extension,
    required this.board,
  }) : super(
          extensionPkgName: post.extensionPkgName,
          siteId: post.siteId,
          boardId: post.boardId,
          threadId: post.threadId,
          id: post.id,
          title: post.title,
          url: post.url,
          createdAt: post.createdAt,
          authorId: post.authorId,
          authorName: post.authorName,
          liked: post.liked,
          disliked: post.disliked,
          image: post.image,
          contents: post.contents,
          tags: post.tags,
          latestRegardingPostCreatedAt: post.latestRegardingPostCreatedAt,
          regardingPostsCount: post.regardingPostsCount,
        );
}
