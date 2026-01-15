// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtensionImpl _$$ExtensionImplFromJson(Map<String, dynamic> json) =>
    _$ExtensionImpl(
      pkgName: json['pkgName'] as String,
      displayName: json['displayName'] as String,
      version: (json['version'] as num).toInt(),
      pythonVersion: (json['pythonVersion'] as num).toInt(),
      lang: json['lang'] as String?,
      isNsfw: json['isNsfw'] as bool,
    );

Map<String, dynamic> _$$ExtensionImplToJson(_$ExtensionImpl instance) =>
    <String, dynamic>{
      'pkgName': instance.pkgName,
      'displayName': instance.displayName,
      'version': instance.version,
      'pythonVersion': instance.pythonVersion,
      'lang': instance.lang,
      'isNsfw': instance.isNsfw,
    };
