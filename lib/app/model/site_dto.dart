part of 'index.dart';

@Freezed(toJson: true)
class SiteDto with _$SiteDto {
  const factory SiteDto({
    @JsonKey(name: 'extension_pkg_name', required: true)
    required String extensionPkgName,

    @JsonKey(name: 'id', required: true)
    required String id,

    @JsonKey(name: 'name', required: true)
    required String name,

    @JsonKey(name: 'icon', required: true)
    required String icon,

    @JsonKey(name: 'url', required: true)
    required String url,
  }) = _SiteDto;

  factory SiteDto.fromJson(Map<String, dynamic> json) => _$SiteDtoFromJson(json);
}

extension SiteDtoEx on SiteDto {
  Site toSite() {
    return Site(
      extensionPkgName: extensionPkgName,
      id: id,
      name: name,
      icon: icon,
      url: url,
    );
  }
}
