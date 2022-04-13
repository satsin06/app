// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_security_health_result.dart';

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

const _$UserSecurityFieldsEnumMap = {
  UserSecurityFields.email: 'EMAIL',
  UserSecurityFields.phone: 'PHONE',
  UserSecurityFields.password: 'PASSWORD',
};
