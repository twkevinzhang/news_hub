import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestion.freezed.dart';

@freezed
class Suggestion with _$Suggestion {
  const factory Suggestion({
    required String id,
    required String keywords,
    required DateTime latestUsedAt,
  }) = _Suggestion;
}
