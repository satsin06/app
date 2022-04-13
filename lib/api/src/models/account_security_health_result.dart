import 'package:json_annotation/json_annotation.dart';

import 'user_security_fields.dart';

part 'account_security_health_result.g.dart';

@JsonSerializable(createToJson: false)
class AccountSecurityHealthResult {
  final UserSecurityFields field;
  final bool status;
  final String? message;

  const AccountSecurityHealthResult(this.field,
      {required this.status, this.message});

  factory AccountSecurityHealthResult.fromJson(Map<String, dynamic> json) =>
      _$AccountSecurityHealthResultFromJson(json);
}
