// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExtensionBoardImpl _$$ExtensionBoardImplFromJson(Map<String, dynamic> json) =>
    _$ExtensionBoardImpl(
      identity: BoardIdentity.fromJson(
        json['identity'] as Map<String, dynamic>,
      ),
      icon: json['icon'] as String,
      largeWelcomeImage: json['largeWelcomeImage'] as String,
      url: json['url'] as String,
      sortOptions: (json['sortOptions'] as List<dynamic>)
          .map((e) => e as String)
          .toSet(),
    );

Map<String, dynamic> _$$ExtensionBoardImplToJson(
  _$ExtensionBoardImpl instance,
) => <String, dynamic>{
  'identity': instance.identity,
  'icon': instance.icon,
  'largeWelcomeImage': instance.largeWelcomeImage,
  'url': instance.url,
  'sortOptions': instance.sortOptions.toList(),
};
