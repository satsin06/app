import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.entity.g.dart';

@JsonSerializable()
class UserEntity with ChangeNotifier {
  final String id;
  final DateTime createdAt;
  String email;
  String phone;
  String login;

  UserEntity({
    this.id,
    this.createdAt,
    this.email,
    this.phone,
    this.login,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) {
    final user = _$UserEntityFromJson(json);
    return user;
  }

  Map<String, dynamic> toJson() => _$UserEntityToJson(this);
}
