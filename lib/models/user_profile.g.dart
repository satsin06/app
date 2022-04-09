// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      userId: json['userId'] as String,
      avatarStorageId: json['avatarStorageId'] as String?,
      bio: json['bio'] as String?,
      gender: $enumDecodeNullable(_$UserGenderEnumMap, json['gender']) ??
          UserGender.unknown,
      birthday: json['birthday'] as int?,
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'avatarStorageId': instance.avatarStorageId,
      'bio': instance.bio,
      'gender': _$UserGenderEnumMap[instance.gender],
      'birthday': instance.birthday,
    };

const _$UserGenderEnumMap = {
  UserGender.main: 'MAN',
  UserGender.woman: 'WOMAN',
  UserGender.unknown: 'UNKNOWN',
};
