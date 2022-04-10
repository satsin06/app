import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

enum UserGender {
  @JsonValue('MAN')
  main,
  @JsonValue('WOMAN')
  woman,
  @JsonValue('UNKNOWN')
  unknown,
}

// ignore: constant_identifier_names
const Map<UserGender, String> UserGenderEnumMap = _$UserGenderEnumMap;

@JsonSerializable()
class UserProfile {
  final String userId;
  final String? avatarStorageId;
  final String? bio;
  final UserGender gender;
  final int? birthday;

  const UserProfile({
    required this.userId,
    this.avatarStorageId,
    this.bio,
    this.gender = UserGender.unknown,
    this.birthday,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  toJson() => _$UserProfileToJson(this);

  /// Copy with new [UserProfile]
  UserProfile copyWith({
    String? avatarStorageId,
    String? bio,
    UserGender? gender,
    int? birthday,
  }) {
    return UserProfile(
      userId: userId,
      avatarStorageId: avatarStorageId ?? this.avatarStorageId,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
    );
  }
}
