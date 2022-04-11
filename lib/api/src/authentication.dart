typedef AuthenticationTokenReader = Future<String?> Function();

class Authentication {
  final AuthenticationTokenReader reader;

  const Authentication(this.reader);
  const Authentication.anonymous() : reader = _nullableRender;
  factory Authentication.withToken(String token) =>
      Authentication(() => Future.value(token));

  static Future<String?> _nullableRender() async => null;
}
