import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String? username;

  const User({
    required this.id,
    this.username,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  toJson() => _$UserToJson(this);

  /// Copy with new [User]
  User copyWith({
    String? username,
  }) {
    return User(
      id: id,
      username: username ?? this.username,
    );
  }
}
