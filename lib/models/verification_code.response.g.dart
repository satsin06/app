// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_code.response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerificationCodeResponse _$VerificationCodeResponseFromJson(
        Map<String, dynamic> json) =>
    VerificationCodeResponse(
      expiredAt: json['expiredAt'] == null
          ? null
          : DateTime.parse(json['expiredAt'] as String),
      period: json['period'] as int? ?? 60,
    )..context = json['context'] as String;

Map<String, dynamic> _$VerificationCodeResponseToJson(
        VerificationCodeResponse instance) =>
    <String, dynamic>{
      'context': instance.context,
      'period': instance.period,
      'expiredAt': instance.expiredAt?.toIso8601String(),
    };
