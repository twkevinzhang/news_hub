part of 'index.dart';

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
      displayName: name,
      website: website,
      signingKeyFingerprint: signingKeyFingerprint,
    );
  }
}
