import 'package:json_annotation/json_annotation.dart';

part 'account_security_health.g.dart';

enum UserSecurityFields {
  @JsonValue(r'EMAIL')
  email,
  @JsonValue(r'PHONE')
  phone,
  @JsonValue(r'PASSWORD')
  password,
}

@JsonSerializable()
class AccountSecurityHealthResult {
  final UserSecurityFields field;
  final bool status;
  final String? message;

  const AccountSecurityHealthResult(this.field,
      {required this.status, this.message});

  factory AccountSecurityHealthResult.fromJson(Map<String, dynamic> json) =>
      _$AccountSecurityHealthResultFromJson(json);
  Map<String, dynamic> toJson() => _$AccountSecurityHealthResultToJson(this);

  AccountSecurityHealthResult copyWith({
    bool? status,
    String? message,
  }) =>
      AccountSecurityHealthResult(
        field,
        status: status ?? this.status,
        message: message ?? this.message,
      );
}
