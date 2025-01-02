part of 'index.dart';

@JsonSerializable(explicitToJson: true)
class ExtensionDto {
  ExtensionDto(
    this.pkgName,
    this.displayName,
    this.zipName,
    this.address,
    this.version,
    this.pythonVersion,
    this.lang,
    this.isNsfw,
    this.site,
    this.boards,
  );

  @JsonKey(name: 'pkg_name', required: true)
  final String pkgName;

  @JsonKey(name: 'display_name', required: true)
  final String displayName;

  @JsonKey(name: 'zip_name', required: true)
  final String zipName;

  @JsonKey(name: 'address', required: true)
  final String address;

  @JsonKey(name: 'version', required: true)
  final int version;

  @JsonKey(name: 'python_version', required: true)
  final int pythonVersion;

  @JsonKey(name: 'lang', required: true)
  final String lang;

  @JsonKey(name: 'is_nsfw', required: true)
  final bool isNsfw;

  @JsonKey(name: 'site', required: true)
  final SiteDto site;

  @JsonKey(name: 'boards', required: true)
  final List<BoardDto> boards;

  factory ExtensionDto.fromJson(Map<String, dynamic> json) =>
      _$ExtensionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionDtoToJson(this);
}

extension ExtensionDtoExtension on ExtensionDto {
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
      boards: boards.map((e) => e.toBoard()).toList(),
    );
  }
}
