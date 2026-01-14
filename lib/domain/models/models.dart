// lib/domain/models/models.dart
//
// Barrel file for all domain models
//
// This file re-exports all models for convenient imports.
// You can import all models with: import 'package:news_hub/domain/models/models.dart';

// Common
export 'common/health_check_result.dart';

// Sidecar
export 'sidecar/log_entry.dart';

// Repo
export 'repo/repo.dart';

// Extension
export 'extension/extension.dart';
export 'extension/remote_extension.dart';
export 'extension/extension_board.dart';
export 'extension/extension_with_boards.dart';

// Collection
export 'collection/board_identity.dart';
export 'collection/collection_board.dart';
export 'collection/collection.dart';

// Thread - Paragraph
export 'thread/paragraph/paragraph.dart';

// Thread - Post
export 'thread/post/post.dart';
export 'thread/post/single_image_post.dart';
export 'thread/post/article_post.dart';
export 'thread/post/single_image_post_with_extension.dart';

// Thread - Other
export 'thread/comment.dart';
export 'thread/board_data_chunk.dart';

// Board
export 'board/board.dart';

// Bookmark
export 'bookmark/bookmark.dart';

// Suggestion
export 'suggestion/suggestion.dart';
