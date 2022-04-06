// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authorization.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Authorization _$AuthorizationFromJson(Map<String, dynamic> json) =>
    Authorization(
      type: $enumDecode(_$AuthorizationTypeEnumMap, json['type']),
      token: json['token'] as String,
      expiredAt: DateTime.parse(json['expiredAt'] as String),
      payload: json['payload'] as String?,
    );

Map<String, dynamic> _$AuthorizationToJson(Authorization instance) =>
    <String, dynamic>{
      'type': _$AuthorizationTypeEnumMap[instance.type],
      'token': instance.token,
      'expiredAt': instance.expiredAt.toIso8601String(),
      'payload': instance.payload,
    };

const _$AuthorizationTypeEnumMap = {
  AuthorizationType.access: 'access',
  AuthorizationType.refresh: 'refresh',
};
