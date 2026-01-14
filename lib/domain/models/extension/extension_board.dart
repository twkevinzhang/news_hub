import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/collection/board_identity.dart';

part 'extension_board.freezed.dart';

/// 從 Extension API 獲取的完整看板資訊
@freezed
class ExtensionBoard with _$ExtensionBoard {
  const factory ExtensionBoard({
    required BoardIdentity identity,
    required String icon,
    required String largeWelcomeImage,
    required String url,
    required Set<String> sortOptions,
  }) = _ExtensionBoard;
}
