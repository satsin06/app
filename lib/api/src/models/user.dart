import 'package:json_annotation/json_annotation.dart';

import '../utils/phone_number.dart';

part 'user.g.dart';

enum UserGender {
  @JsonValue('MAN')
  man,

  @JsonValue('WOMAN')
  woman,

  @JsonValue('UNKNOWN')
  unknown,
}

const Map<UserGender, String> $UserGenderEnumMap = _$UserGenderEnumMap;

@JsonSerializable(createToJson: false)
class User {
  final String id;
  final String? username;
  final String? avatarStorageId;
  final String? bio;
  final int? birthday;
  final UserGender gender;

  const User({
    required this.id,
    this.username,
    this.avatarStorageId,
    this.bio,
    this.birthday,
    this.gender = UserGender.unknown,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

class UserWhereUniqueInput {
  final String? id;
  final String? email;
  final String? phone;
  final String? username;

  const UserWhereUniqueInput.id(this.id)
      : email = null,
        phone = null,
        username = null;

  const UserWhereUniqueInput.email(this.email)
      : id = null,
        phone = null,
        username = null;

  const UserWhereUniqueInput.phone(this.phone)
      : id = null,
        email = null,
        username = null;

  const UserWhereUniqueInput.username(this.username)
      : id = null,
        email = null,
        phone = null;

  Map<String, String> toJson() {
    return {
      if (id != null) 'id': id!,
      if (email != null) 'email': email!,
      if (phone != null) 'phone': PhoneNumber.parse(phone)!,
      if (username != null) 'username': username!,
    };
  }
}
