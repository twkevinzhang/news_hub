import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/models/models.dart';
import 'package:news_hub/shared/extensions.dart';

part 'extension_repo_api.freezed.dart';
part 'extension_repo_api.g.dart';

@freezed
class GithubResponseDto with _$GithubResponseDto {
  const factory GithubResponseDto({
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
    // @JsonKey(name: '_links', required: true) required Links links,
  }) = _GithubResponseDto;
  factory GithubResponseDto.fromJson(Map<String, Object?> json) => _$GithubResponseDtoFromJson(json);
}

@freezed
class Links with _$Links {
  const factory Links({
    @JsonKey(name: 'self', required: true) required String self,
    @JsonKey(name: 'git', required: true) required String git,
    @JsonKey(name: 'html', required: true) required String html,
  }) = _Links;
  factory Links.fromJson(Map<String, Object?> json) => _$LinksFromJson(json);
}

extension GithubResponseDtoEx on GithubResponseDto {
  Map<String, dynamic> decodedContent() {
    return jsonDecode(utf8.decode(base64Decode(content.remove('\n'))));
  }
}

@freezed
class GetDetailContentDto with _$GetDetailContentDto {
  const factory GetDetailContentDto({
    @JsonKey(name: 'icon', required: true) required String icon,
    @JsonKey(name: 'base_url', required: true) required String baseUrl,
    @JsonKey(name: 'display_name', required: true) required String displayName,
    @JsonKey(name: 'website', required: true) required String website,
    @JsonKey(name: 'signing_key_fingerprint', required: true)
    required String signingKeyFingerprint,
  }) = _GetDetailContentDto;
  factory GetDetailContentDto.fromJson(Map<String, dynamic> json) =>
      _$GetDetailContentDtoFromJson(json);
}

extension GetDetailContentDtoEx on GetDetailContentDto {
  ExtensionRepo toExtensionRepo({required String baseUrl}) {
    return ExtensionRepo(
      icon: icon,
      baseUrl: baseUrl,
      displayName: displayName,
      website: website,
      signingKeyFingerprint: signingKeyFingerprint,
    );
  }
}


@freezed
class GetExtensionsContentItemDto with _$GetExtensionsContentItemDto {
  const factory GetExtensionsContentItemDto({
    @JsonKey(name: 'repo_base_url', required: true) required String repoBaseUrl,
    @JsonKey(name: 'pkg_name', required: true) required String pkgName,
    @JsonKey(name: 'display_name', required: true) required String displayName,
    @JsonKey(name: 'zip_name', required: true) required String zipName,
    @JsonKey(name: 'address', required: true) required String address,
    @JsonKey(name: 'version', required: true) required int version,
    @JsonKey(name: 'python_version', required: true) required int pythonVersion,
    @JsonKey(name: 'lang', required: true) required String lang,
    @JsonKey(name: 'is_nsfw', required: true) required bool isNsfw,
  }) = _GetExtensionsContentItemDto;
  factory GetExtensionsContentItemDto.fromJson(Map<String, Object?> json) =>
      _$GetExtensionsContentItemDtoFromJson(json);
}

extension GetExtensionsContentItemDtoEx on GetExtensionsContentItemDto {
  RemoteExtension toRemoteExtension() {
    return RemoteExtension(
      repoBaseUrl: repoBaseUrl,
      pkgName: pkgName,
      displayName: displayName,
      zipName: zipName,
      version: version,
      pythonVersion: pythonVersion,
      lang: lang,
      isNsfw: isNsfw,
      iconUrl: '',
      repoUrl: '',
    );
  }
}

