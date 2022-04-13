import 'package:json_annotation/json_annotation.dart';

part 'user_security_fields.g.dart';

@JsonEnum(alwaysCreate: true)
enum UserSecurityFields {
  @JsonValue(r'EMAIL')
  email,

  @JsonValue(r'PHONE')
  phone,

  @JsonValue(r'PASSWORD')
  password,
}

const Map<UserSecurityFields, String> $UserSecurityFieldsEnumMap =
    _$UserSecurityFieldsEnumMap;
