// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fderation_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FederationToken _$FederationTokenFromJson(Map<String, dynamic> json) =>
    FederationToken(
      expiredAt: json['expiredAt'] as String,
      prefix:
          (json['prefix'] as List<dynamic>).map((e) => e as String).toList(),
      secretId: json['secretId'] as String,
      secretKey: json['secretKey'] as String,
      token: json['token'] as String,
    );

Map<String, dynamic> _$FederationTokenToJson(FederationToken instance) =>
    <String, dynamic>{
      'expiredAt': instance.expiredAt,
      'prefix': instance.prefix,
      'secretId': instance.secretId,
      'secretKey': instance.secretKey,
      'token': instance.token,
    };
