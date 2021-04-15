// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization-token.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthorizationTokenEntity _$AuthorizationTokenEntityFromJson(
    Map<String, dynamic> json) {
  return AuthorizationTokenEntity(
    token: json['token'] as String,
    userId: json['userId'] as String,
    expiredAt: DateTime.parse(json['expiredAt'] as String),
    refreshExpiredAt: DateTime.parse(json['refreshExpiredAt'] as String),
    user: json['user'] == null
        ? null
        : UserEntity.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AuthorizationTokenEntityToJson(
        AuthorizationTokenEntity instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
      'expiredAt': instance.expiredAt.toIso8601String(),
      'refreshExpiredAt': instance.refreshExpiredAt.toIso8601String(),
      'user': instance.user,
    };
