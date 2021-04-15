// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserEntity _$UserEntityFromJson(Map<String, dynamic> json) {
  return UserEntity(
    id: json['id'] as String,
    createdAt: DateTime.parse(json['createdAt'] as String),
    phone: json['phone'] as String?,
    username: json['username'] as String?,
    profile: json['profile'] == null
        ? null
        : UserProfileEntity.fromJson(json['profile'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserEntityToJson(UserEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt.toIso8601String(),
      'profile': instance.profile,
      'phone': instance.phone,
      'username': instance.username,
    };
