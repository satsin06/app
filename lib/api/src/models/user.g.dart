// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as String,
      username: json['username'] as String?,
      avatarStorageId: json['avatarStorageId'] as String?,
      bio: json['bio'] as String?,
      birthday: json['birthday'] as int?,
      gender: $enumDecodeNullable(_$UserGenderEnumMap, json['gender']) ??
          UserGender.unknown,
    );

const _$UserGenderEnumMap = {
  UserGender.man: 'MAN',
  UserGender.woman: 'WOMAN',
  UserGender.unknown: 'UNKNOWN',
};
