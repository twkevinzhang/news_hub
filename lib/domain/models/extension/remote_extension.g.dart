// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteExtensionImpl _$$RemoteExtensionImplFromJson(
  Map<String, dynamic> json,
) => _$RemoteExtensionImpl(
  pkgName: json['pkgName'] as String,
  displayName: json['displayName'] as String,
  version: (json['version'] as num).toInt(),
  pythonVersion: (json['pythonVersion'] as num).toInt(),
  lang: json['lang'] as String?,
  isNsfw: json['isNsfw'] as bool,
  repoUrl: json['repoUrl'] as String,
  iconUrl: json['iconUrl'] as String,
);

Map<String, dynamic> _$$RemoteExtensionImplToJson(
  _$RemoteExtensionImpl instance,
) => <String, dynamic>{
  'pkgName': instance.pkgName,
  'displayName': instance.displayName,
  'version': instance.version,
  'pythonVersion': instance.pythonVersion,
  'lang': instance.lang,
  'isNsfw': instance.isNsfw,
  'repoUrl': instance.repoUrl,
  'iconUrl': instance.iconUrl,
};
