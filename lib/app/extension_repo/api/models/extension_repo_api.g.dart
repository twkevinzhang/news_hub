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

Map<String, dynamic> _$$GithubResponseDtoImplToJson(
        _$GithubResponseDtoImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'sha': instance.sha,
      'size': instance.size,
      'url': instance.url,
      'html_url': instance.htmlUrl,
      'git_url': instance.gitUrl,
      'download_url': instance.downloadUrl,
      'type': instance.type,
      'content': instance.content,
      'encoding': instance.encoding,
    };

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

Map<String, dynamic> _$$LinksImplToJson(_$LinksImpl instance) =>
    <String, dynamic>{
      'self': instance.self,
      'git': instance.git,
      'html': instance.html,
    };

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

Map<String, dynamic> _$$GetDetailContentDtoImplToJson(
        _$GetDetailContentDtoImpl instance) =>
    <String, dynamic>{
      'icon': instance.icon,
      'base_url': instance.baseUrl,
      'display_name': instance.displayName,
      'website': instance.website,
      'signing_key_fingerprint': instance.signingKeyFingerprint,
    };

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

Map<String, dynamic> _$$GetExtensionsContentItemDtoImplToJson(
        _$GetExtensionsContentItemDtoImpl instance) =>
    <String, dynamic>{
      'repo_base_url': instance.repoBaseUrl,
      'pkg_name': instance.pkgName,
      'display_name': instance.displayName,
      'zip_name': instance.zipName,
      'address': instance.address,
      'version': instance.version,
      'python_version': instance.pythonVersion,
      'lang': instance.lang,
      'is_nsfw': instance.isNsfw,
    };
