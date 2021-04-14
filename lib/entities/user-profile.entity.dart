import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';
import 'user.entity.dart';

part 'user-profile.entity.g.dart';

@JsonSerializable()
class UserProfileEntity extends Entity<UserProfileEntity> {
  UserProfileEntity({
    this.userId,
    this.user,
    this.name,
    this.avatar,
    this.bio,
    this.location,
    this.updatedAt,
  });

  final String userId;
  final UserEntity user;
  String name;
  String avatar;
  String bio;
  String location;
  DateTime updatedAt;

  @override
  String get $id => userId;

  @override
  Map<String, dynamic> toJson() => _$UserProfileEntityToJson(this);

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      Entity.$fromJson(_$UserProfileEntityFromJson, json);
}
