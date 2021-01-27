class Context {
  /// The [Context] instance.
  static Context _instance;

  /// Server HTTP endpoint.
  Uri serverEndpoint;

  /// Create the [Context]
  Context._();

  /// Get Context instance.
  factory Context.get() {
    if (_instance is Context) {
      return _instance;
    }

    return _instance = Context._();
  }
}
