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

@JsonSerializable()
class UserProfile {
  final String userId;
  final String? avatar;
  final String? bio;
  final UserGender gender;
  final int? birthday;

  const UserProfile({
    required this.userId,
    this.avatar,
    this.bio,
    this.gender = UserGender.unknown,
    this.birthday,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  toJson() => _$UserProfileToJson(this);

  const UserProfile.empty() : this(userId: '');

  /// Copy with new [UserProfile]
  UserProfile copyWith({
    String? avatar,
    String? bio,
    UserGender? gender,
    int? birthday,
  }) {
    return UserProfile(
      userId: userId,
      avatar: avatar ?? this.avatar,
      bio: bio ?? this.bio,
      gender: gender ?? this.gender,
      birthday: birthday ?? this.birthday,
    );
  }
}
