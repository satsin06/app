import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'authorization_type.dart';

part 'authorization.g.dart';

@JsonSerializable()
class Authorization {
  final AuthorizationType type;
  final String token;
  final DateTime expiredAt;
  final String? payload;

  /// Creates a new [Authorization] instance.
  const Authorization({
    required this.type,
    required this.token,
    required this.expiredAt,
    this.payload,
  });

  /// Factory constructor for creating a new [Authorization] instance
  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);

  /// Create a [AuthorizationType.access] authorization instance.
  factory Authorization.access({
    required String token,
    required DateTime expiredAt,
    String? payload,
  }) =>
      Authorization(
        type: AuthorizationType.access,
        token: token,
        expiredAt: expiredAt,
        payload: payload,
      );

  /// Create a [AuthorizationType.refresh] authorization instance.
  factory Authorization.refresh({
    required String token,
    required DateTime expiredAt,
    String? payload,
  }) =>
      Authorization(
        type: AuthorizationType.refresh,
        token: token,
        expiredAt: expiredAt,
        payload: payload,
      );

  /// Create a JSON Object for this [Authorization] instance.
  Map<String, dynamic> toJson() => _$AuthorizationToJson(this);

  /// To String.
  @override
  String toString() => jsonEncode(toJson());

  /// Copy with new values.
  Authorization copyWith({
    String? token,
    DateTime? expiredAt,
    String? payload,
  }) =>
      Authorization(
        type: type,
        token: token ?? this.token,
        expiredAt: expiredAt ?? this.expiredAt,
        payload: payload ?? this.payload,
      );
}
