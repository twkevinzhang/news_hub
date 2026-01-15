import 'package:freezed_annotation/freezed_annotation.dart';

part 'remote_extension.freezed.dart';
part 'remote_extension.g.dart';

@freezed
class RemoteExtension with _$RemoteExtension {
  const factory RemoteExtension({
    required String pkgName,
    required String displayName,
    required int version,
    required int pythonVersion,
    String? lang,
    required bool isNsfw,
    required String repoUrl,
    required String iconUrl,
  }) = _RemoteExtension;

  factory RemoteExtension.fromJson(Map<String, dynamic> json) =>
      _$RemoteExtensionFromJson(json);
}
