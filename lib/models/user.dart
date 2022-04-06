import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String? username;
  final String? phone;
  final String? email;

  const User({
    required this.id,
    this.email,
    this.phone,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  toJson() => _$UserToJson(this);

  /// Copy with new [User]
  User copyWith({
    String? email,
    String? phone,
    String? username,
  }) {
    return User(
      id: id,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
    );
  }
}
