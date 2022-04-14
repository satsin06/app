import 'package:json_annotation/json_annotation.dart';

part 'access_token.g.dart';

@JsonSerializable(createToJson: false)
class AccessToken {
  final String token;
  final String userId;
  final DateTime expiredAt;
  final DateTime refreshExpiredAt;
  final DateTime createdAt;

  const AccessToken({
    required this.token,
    required this.userId,
    required this.expiredAt,
    required this.refreshExpiredAt,
    required this.createdAt,
  });

  factory AccessToken.fromJson(Map<String, dynamic> json) =>
      _$AccessTokenFromJson(json);
}
