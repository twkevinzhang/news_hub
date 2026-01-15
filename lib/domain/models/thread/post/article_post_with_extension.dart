import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/extension/extension.dart';
import 'package:news_hub/domain/models/board/board.dart';
import 'package:news_hub/domain/models/thread/post/post.dart';

part 'article_post_with_extension.freezed.dart';

@freezed
class ArticlePostWithExtension with _$ArticlePostWithExtension {
  const ArticlePostWithExtension._();

  const factory ArticlePostWithExtension({
    required ArticlePost post,
    required Extension extension,
    required Board board,
  }) = _ArticlePostWithExtension;

  // Delegate fields of ArticlePost for convenience
  String get id => post.id;
  String get threadId => post.threadId;
  String get extensionPkgName => post.extensionPkgName;
  String get boardId => post.boardId;
  String? get url => post.url;
  String? get title => post.title;
  String get authorName => post.authorName;
  DateTime get createdAt => post.createdAt;
}
