part of 'index.dart';

@Freezed(toJson: true)
class BoardsDto with _$BoardsDto {
  const factory BoardsDto({
    @JsonKey(name: 'total_page', required: true)
    required int totalPage,

    @JsonKey(name: 'current_page', required: true)
    required int currentPage,

    @JsonKey(name: 'boards', required: true)
    required List<BoardDto> boards
  }) = _BoardsDto;

  factory BoardsDto.fromJson(Map<String, Object?> json) =>
      _$BoardsDtoFromJson(json);
}

@Freezed(toJson: true)
class BoardDto with _$BoardDto {
  const factory BoardDto({
    @JsonKey(name: 'extension_pkg_name', required: true)
    required String extensionPkgName,

    @JsonKey(name: 'site_id', required: true)
    required String siteId,

    @JsonKey(name: 'id', required: true)
    required String id,

    @JsonKey(name: 'name', required: true)
    required String name,

    @JsonKey(name: 'icon', required: true)
    required String icon,

    @JsonKey(name: 'large_welcome_image', required: true)
    required String largeWelcomeImage,

    @JsonKey(name: 'url', required: true)
    required String url,

    @JsonKey(name: 'supported_sorting', required: true)
    required Set<String> supportedSorting,
  }) = _BoardDto;

  factory BoardDto.fromJson(Map<String, dynamic> json) => _$BoardDtoFromJson(json);
}

extension BoardDtoEx on BoardDto {
  Board toBoard() {
    return Board(
      extensionPkgName: extensionPkgName,
      siteId: siteId,
      id: id,
      name: name,
      icon: icon,
      largeWelcomeImage: largeWelcomeImage,
      url: url,
      supportedSorting: supportedSorting,
    );
  }
}
