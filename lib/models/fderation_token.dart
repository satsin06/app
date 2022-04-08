import 'package:json_annotation/json_annotation.dart';

part 'fderation_token.g.dart';

@JsonSerializable()
class FederationToken {
  final String expiredAt;
  final List<String> prefix;
  final String secretId;
  final String secretKey;
  final String token;

  const FederationToken({
    required this.expiredAt,
    required this.prefix,
    required this.secretId,
    required this.secretKey,
    required this.token,
  });

  factory FederationToken.fromJson(Map<String, dynamic> json) =>
      _$FederationTokenFromJson(json);

  Map<String, dynamic> toJson() => _$FederationTokenToJson(this);

  @override
  String toString() => toJson().toString();
}
