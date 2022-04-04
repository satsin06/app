class AuthorizationType {
  const AuthorizationType._(this.value);

  static const AuthorizationType access = AuthorizationType._('Access');
  static const AuthorizationType refresh = AuthorizationType._('Refresh');

  final String value;

  @override
  String toString() => value;
}
