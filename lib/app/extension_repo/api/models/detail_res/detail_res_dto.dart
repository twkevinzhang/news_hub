import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/extensions.dart';

part 'detail_res_dto.freezed.dart';
part 'detail_res_dto.g.dart';

@Freezed(toJson: true)
class DetailResDto with _$DetailResDto {
  const factory DetailResDto({
    @JsonKey(name: 'name', required: true) required String name,
    @JsonKey(name: 'path', required: true) required String path,
    @JsonKey(name: 'sha', required: true) required String sha,
    @JsonKey(name: 'size', required: true) required int size,
    @JsonKey(name: 'url', required: true) required String url,
    @JsonKey(name: 'html_url', required: true) required String htmlUrl,
    @JsonKey(name: 'git_url', required: true) required String gitUrl,
    @JsonKey(name: 'download_url', required: true) required String downloadUrl,
    @JsonKey(name: 'type', required: true) required String type,
    @JsonKey(name: 'content', required: true) required String content,
    @JsonKey(name: 'encoding', required: true) required String encoding,
    @JsonKey(name: '_links', required: true) required Links links,
  }) = _DetailResDto;

  factory DetailResDto.fromJson(Map<String, dynamic> json) =>
      _$DetailResDtoFromJson(json);
}

@Freezed(toJson: true)
class Links with _$Links {
  const factory Links({
    @JsonKey(name: 'self', required: true) required String self,
    @JsonKey(name: 'git', required: true) required String git,
    @JsonKey(name: 'html', required: true) required String html,
  }) = _Links;

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);
}

extension DetailResDtoEx on DetailResDto {
  T mapContent<T>(T Function(Map<String, dynamic>) toElement) {
    return toElement(
        jsonDecode(utf8.decode(base64Decode(content.remove('\n')))));
  }

  Iterable<T> mapIterableContent<T>(
      T Function(Map<String, dynamic>) toElement) {
    return (jsonDecode(utf8.decode(base64Decode(content.remove('\n'))))
            as Iterable)
        .map((e) => toElement(e));
  }
}
