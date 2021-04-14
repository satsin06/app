// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moment.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MomentEntity _$MomentEntityFromJson(Map<String, dynamic> json) {
  return MomentEntity(
    json['id'] as String,
    title: json['title'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    content: json['content'] as String,
    deletedAt: json['deletedAt'] == null
        ? null
        : DateTime.parse(json['deletedAt'] as String),
    owner: json['owner'] == null
        ? null
        : UserEntity.fromJson(json['owner'] as Map<String, dynamic>),
    ownerId: json['ownerId'] as String,
  );
}

Map<String, dynamic> _$MomentEntityToJson(MomentEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'ownerId': instance.ownerId,
      'owner': instance.owner,
      'deletedAt': instance.deletedAt?.toIso8601String(),
    };
