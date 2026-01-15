// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_board.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionBoardImpl _$$CollectionBoardImplFromJson(
  Map<String, dynamic> json,
) => _$CollectionBoardImpl(
  identity: BoardIdentity.fromJson(json['identity'] as Map<String, dynamic>),
  collectionId: json['collectionId'] as String,
  selectedSort: json['selectedSort'] as String?,
);

Map<String, dynamic> _$$CollectionBoardImplToJson(
  _$CollectionBoardImpl instance,
) => <String, dynamic>{
  'identity': instance.identity,
  'collectionId': instance.collectionId,
  'selectedSort': instance.selectedSort,
};
