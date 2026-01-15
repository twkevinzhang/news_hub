import 'package:freezed_annotation/freezed_annotation.dart';

part 'board_identity.freezed.dart';
part 'board_identity.g.dart';

/// 看板的核心識別資訊
@freezed
class BoardIdentity with _$BoardIdentity {
  const factory BoardIdentity({
    required String extensionPkgName,
    required String boardId,
    required String boardName,
  }) = _BoardIdentity;

  factory BoardIdentity.fromJson(Map<String, dynamic> json) =>
      _$BoardIdentityFromJson(json);
}
