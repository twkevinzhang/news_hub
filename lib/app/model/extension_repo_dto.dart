part of 'index.dart';

@Freezed(toJson: true)
class ExtensionRepoDto with _$ExtensionRepoDto {
  const factory ExtensionRepoDto({
    @JsonKey(name: 'base_url', required: true) required String baseUrl,
    @JsonKey(name: 'name', required: true) required String name,
    @JsonKey(name: 'website', required: true) required String website,
    @JsonKey(name: 'signing_key_fingerprint', required: true) required String signingKeyFingerprint,
  }) = _ExtensionRepoDto;
  factory ExtensionRepoDto.fromJson(Map<String, dynamic> json) => _$ExtensionRepoDtoFromJson(json);
}

extension ExtensionRepoDtoEx on ExtensionRepoDto {
  ExtensionRepo toExtensionRepo({required String baseUrl}) {
    return ExtensionRepo(
      baseUrl: baseUrl,
      displayName: name,
      website: website,
      signingKeyFingerprint: signingKeyFingerprint,
    );
  }
}
