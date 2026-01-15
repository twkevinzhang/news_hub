import 'package:freezed_annotation/freezed_annotation.dart';

part 'extension.freezed.dart';
part 'extension.g.dart';

@freezed
class Extension with _$Extension {
  const factory Extension({
    required String pkgName,
    required String displayName,
    required int version,
    required int pythonVersion,
    String? lang,
    required bool isNsfw,
  }) = _Extension;

  factory Extension.fromJson(Map<String, dynamic> json) =>
      _$ExtensionFromJson(json);
}
