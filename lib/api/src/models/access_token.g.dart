// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      token: json['token'] as String,
      userId: json['userId'] as String,
      expiredAt: DateTime.parse(json['expiredAt'] as String),
      refreshExpiredAt: DateTime.parse(json['refreshExpiredAt'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );
