import 'package:isar/isar.dart';

enum AuthorizationType {
  access,
  refresh,
}

class AuthorizationTypeConverter extends TypeConverter<AuthorizationType, int> {
  const AuthorizationTypeConverter();

  @override
  AuthorizationType fromIsar(int object) {
    return AuthorizationType.values[object];
  }

  @override
  int toIsar(AuthorizationType object) {
    return object.index;
  }
}
