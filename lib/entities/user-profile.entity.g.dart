// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user-profile.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileEntity _$UserProfileEntityFromJson(Map<String, dynamic> json) {
  return UserProfileEntity(
    userId: json['userId'] as String,
    user: json['user'] == null
        ? null
        : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
    name: json['name'] as String,
    avatar: json['avatar'] as String,
    bio: json['bio'] as String,
    location: json['location'] as String,
    updatedAt: json['updatedAt'] == null
        ? null
        : DateTime.parse(json['updatedAt'] as String),
  );
}

Map<String, dynamic> _$UserProfileEntityToJson(UserProfileEntity instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'user': instance.user,
      'name': instance.name,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'location': instance.location,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
