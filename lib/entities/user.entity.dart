import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';
import 'user-profile.entity.dart';

part 'user.entity.g.dart';

@JsonSerializable()
class UserEntity extends Entity<UserEntity> {
  UserEntity({
    this.id,
    this.createdAt,
    this.phone,
    this.username,
    this.profile,
  });

  final String id;
  final DateTime createdAt;
  final UserProfileEntity profile;
  String phone;
  String username;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      Entity.$fromJson(_$UserEntityFromJson, json);

  @override
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String get $id => id;
}
