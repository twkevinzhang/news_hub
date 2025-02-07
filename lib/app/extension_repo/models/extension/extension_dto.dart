import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/models.dart';

part 'extension_dto.freezed.dart';
part 'extension_dto.g.dart';

@Freezed(toJson: true)
class ExtensionDto with _$ExtensionDto {
  const factory ExtensionDto({
    @JsonKey(name: 'repo_base_url', required: true)
    required String repoBaseUrl,

    @JsonKey(name: 'pkg_name', required: true)
    required String pkgName,

    @JsonKey(name: 'display_name', required: true)
    required String displayName,

    @JsonKey(name: 'zip_name', required: true)
    required String zipName,

    @JsonKey(name: 'address', required: true)
    required String address,

    @JsonKey(name: 'version', required: true)
    required int version,

    @JsonKey(name: 'python_version', required: true)
    required int pythonVersion,

    @JsonKey(name: 'lang', required: true)
    required String lang,

    @JsonKey(name: 'is_nsfw', required: true)
    required bool isNsfw,
  }) = _ExtensionDto;

  factory ExtensionDto.fromJson(Map<String, dynamic> json) =>
      _$ExtensionDtoFromJson(json);
}

extension ExtensionDtoEx on ExtensionDto {
  RemoteExtension toRemoteExtension() {
    return RemoteExtension(
      repoBaseUrl: repoBaseUrl,
      pkgName: pkgName,
      displayName: displayName,
      zipName: zipName,
      address: address,
      version: version,
      pythonVersion: pythonVersion,
      lang: lang,
      isNsfw: isNsfw,
      iconUrl: '',
      repoUrl: '',
    );
  }
}
