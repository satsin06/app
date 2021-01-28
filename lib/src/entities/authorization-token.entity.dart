import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

import 'user.entity.dart';

part 'authorization-token.entity.g.dart';

@JsonSerializable()
class AuthorizationTokenEntity {
  String token;
  String userId;
  DateTime expiredAt;
  DateTime refreshExpiredAt;
  UserEntity user;

  AuthorizationTokenEntity({
    this.token,
    this.userId,
    this.expiredAt,
    this.refreshExpiredAt,
    this.user,
  });

  factory AuthorizationTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationTokenEntityFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorizationTokenEntityToJson(this);
}
