import 'package:json_annotation/json_annotation.dart';

import 'entity.dart';

part 'user.entity.g.dart';

@JsonSerializable()
class UserEntity extends Entity<UserEntity> {
  final String id;
  final DateTime createdAt;
  String phone;
  String username;

  UserEntity({
    this.id,
    this.createdAt,
    this.phone,
    this.username,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      Entity.$fromJson(_$UserEntityFromJson, json);

  @override
  Map<String, dynamic> toJson() => _$UserEntityToJson(this);

  @override
  String get $id => id;
}
