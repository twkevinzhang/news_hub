import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_hub/domain/extension/model/index.dart';
import 'package:news_hub/domain/extension_repo/model/index.dart';
import 'package:flutter/foundation.dart';

part 'extension_repo_dto.freezed.dart';
part 'extension_repo_dto.g.dart';

@Freezed(toJson: true)
class ExtensionRepoResDto with _$ExtensionRepoResDto {
  const factory ExtensionRepoResDto({
    required ExtensionRepoDto meta
  }) = _ExtensionRepoResDto;

  factory ExtensionRepoResDto.fromJson(Map<String, Object?> json) => _$ExtensionRepoResDtoFromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ExtensionRepoDto {
  ExtensionRepoDto(
    this.baseUrl,
    this.name,
    this.website,
    this.signingKeyFingerprint,
  );

  @JsonKey(name: 'base_url', required: true)
  final String baseUrl;

  @JsonKey(name: 'name', required: true)
  final String name;

  @JsonKey(name: 'website', required: true)
  final String website;

  @JsonKey(name: 'signing_key_fingerprint', required: true)
  final String signingKeyFingerprint;

  factory ExtensionRepoDto.fromJson(Map<String, dynamic> json) => _$ExtensionRepoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionRepoDtoToJson(this);
}

extension ExtensionRepoDtoExtension on ExtensionRepoDto {
  ExtensionRepo toExtensionRepo({required String baseUrl}) {
    return ExtensionRepo(
      baseUrl: baseUrl,
      name: name,
      website: website,
      signingKeyFingerprint: signingKeyFingerprint,
    );
  }
}

@JsonSerializable(explicitToJson: true)
class ExtensionDto {
  ExtensionDto(
      this.name,
      this.zipName,
      this.address,
      this.versionName,
      this.versionCode,
      this.libVersion,
      this.lang,
      this.isNsfw,
  );

  @JsonKey(name: 'name', required: true)
  final String name;

  @JsonKey(name: 'zip_name', required: true)
  final String zipName;

  @JsonKey(name: 'address', required: true)
  final String address;

  @JsonKey(name: 'version_name', required: true)
  final String versionName;

  @JsonKey(name: 'version_code', required: true)
  final int versionCode;

  @JsonKey(name: 'lib_version', required: true)
  final double libVersion;

  @JsonKey(name: 'lang', required: true)
  final String lang;

  @JsonKey(name: 'is_nsfw', required: true)
  final bool isNsfw;

  factory ExtensionDto.fromJson(Map<String, dynamic> json) => _$ExtensionDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ExtensionDtoToJson(this);
}

extension ExtensionDtoExtension on ExtensionDto {
  AvailableExtension toAvailableExtension() {
    return AvailableExtension(
      name: name,
      zipName: zipName,
      address: address,
      versionName: versionName,
      versionCode: versionCode,
      libVersion: libVersion,
      lang: lang,
      isNsfw: isNsfw,
      iconUrl: '',
      repoUrl: '',
    );
  }
}
