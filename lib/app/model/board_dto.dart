part of 'index.dart';

@JsonSerializable(explicitToJson: true)
class BoardDto {
  BoardDto(
      this.extensionPkgName,
      this.siteId,
      this.id,
      this.name,
      this.icon,
      this.largeWelcomeImage,
      this.url,
    );

  @JsonKey(name: 'extension_pkg_name', required: true)
  final String extensionPkgName;

  @JsonKey(name: 'site_id', required: true)
  final String siteId;

  @JsonKey(name: 'id', required: true)
  final String id;

  @JsonKey(name: 'name', required: true)
  final String name;

  @JsonKey(name: 'icon', required: true)
  final String icon;

  @JsonKey(name: 'large_welcome_image', required: true)
  final String largeWelcomeImage;

  @JsonKey(name: 'url', required: true)
  final String url;

  factory BoardDto.fromJson(Map<String, dynamic> json) => _$BoardDtoFromJson(json);

  Map<String, dynamic> toJson() => _$BoardDtoToJson(this);
}

extension BoardDtoExtension on BoardDto {
  Board toBoard() {
    return Board(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      id: id,
      name: name,
      icon: icon,
      largeWelcomeImage: largeWelcomeImage,
      url: url,
    );
  }
}
