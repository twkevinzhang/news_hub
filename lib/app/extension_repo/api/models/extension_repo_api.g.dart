// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_repo_api.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GithubResponseDtoImpl _$$GithubResponseDtoImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'name',
      'path',
      'sha',
      'size',
      'url',
      'html_url',
      'git_url',
      'download_url',
      'type',
      'content',
      'encoding'
    ],
  );
  return _$GithubResponseDtoImpl(
    name: json['name'] as String,
    path: json['path'] as String,
    sha: json['sha'] as String,
    size: (json['size'] as num).toInt(),
    url: json['url'] as String,
    htmlUrl: json['html_url'] as String,
    gitUrl: json['git_url'] as String,
    downloadUrl: json['download_url'] as String,
    type: json['type'] as String,
    content: json['content'] as String,
    encoding: json['encoding'] as String,
  );
}

_$LinksImpl _$$LinksImplFromJson(Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const ['self', 'git', 'html'],
  );
  return _$LinksImpl(
    self: json['self'] as String,
    git: json['git'] as String,
    html: json['html'] as String,
  );
}

_$GetDetailContentDtoImpl _$$GetDetailContentDtoImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'icon',
      'base_url',
      'display_name',
      'website',
      'signing_key_fingerprint'
    ],
  );
  return _$GetDetailContentDtoImpl(
    icon: json['icon'] as String,
    baseUrl: json['base_url'] as String,
    displayName: json['display_name'] as String,
    website: json['website'] as String,
    signingKeyFingerprint: json['signing_key_fingerprint'] as String,
  );
}

_$GetExtensionsContentItemDtoImpl _$$GetExtensionsContentItemDtoImplFromJson(
    Map<String, dynamic> json) {
  $checkKeys(
    json,
    requiredKeys: const [
      'repo_base_url',
      'pkg_name',
      'display_name',
      'zip_name',
      'address',
      'version',
      'python_version',
      'lang',
      'is_nsfw'
    ],
  );
  return _$GetExtensionsContentItemDtoImpl(
    repoBaseUrl: json['repo_base_url'] as String,
    pkgName: json['pkg_name'] as String,
    displayName: json['display_name'] as String,
    zipName: json['zip_name'] as String,
    address: json['address'] as String,
    version: (json['version'] as num).toInt(),
    pythonVersion: (json['python_version'] as num).toInt(),
    lang: json['lang'] as String,
    isNsfw: json['is_nsfw'] as bool,
  );
}
