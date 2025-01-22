part of 'index.dart';

@Freezed(toJson: true)
class ExtensionDto with _$ExtensionDto {
  const factory ExtensionDto({
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

    @JsonKey(name: 'site', required: true)
    required SiteDto site,

    @JsonKey(name: 'boards', required: true)
    required List<BoardDto> boards,
  }) = _ExtensionDto;

  factory ExtensionDto.fromJson(Map<String, dynamic> json) =>
      _$ExtensionDtoFromJson(json);
}

extension ExtensionDtoEx on ExtensionDto {
  RemoteExtension toRemoteExtension() {
    return RemoteExtension(
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
      site: site.toSite(),
      boards: boards.map((e) => e.toBoard()).toSet(),
    );
  }
}
