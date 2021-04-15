import 'package:json_annotation/json_annotation.dart';

import 'user.entity.dart';

part 'authorization-token.entity.g.dart';

@JsonSerializable()
class AuthorizationTokenEntity {
  String token;
  String userId;
  DateTime expiredAt;
  DateTime refreshExpiredAt;
  UserEntity? user;

  AuthorizationTokenEntity({
    required this.token,
    required this.userId,
    required this.expiredAt,
    required this.refreshExpiredAt,
    this.user,
  });

  factory AuthorizationTokenEntity.fromJson(Map<String, dynamic> json) {
    return _$AuthorizationTokenEntityFromJson(json);
  }

  Map<String, dynamic> toJson() => _$AuthorizationTokenEntityToJson(this);
}
