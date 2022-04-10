// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_security_health.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountSecurityHealthResult _$AccountSecurityHealthResultFromJson(
        Map<String, dynamic> json) =>
    AccountSecurityHealthResult(
      $enumDecode(_$UserSecurityFieldsEnumMap, json['field']),
      status: json['status'] as bool,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AccountSecurityHealthResultToJson(
        AccountSecurityHealthResult instance) =>
    <String, dynamic>{
      'field': _$UserSecurityFieldsEnumMap[instance.field],
      'status': instance.status,
      'message': instance.message,
    };

const _$UserSecurityFieldsEnumMap = {
  UserSecurityFields.email: 'EMAIL',
  UserSecurityFields.phone: 'PHONE',
  UserSecurityFields.password: 'PASSWORD',
};
