abstract class EmailAddress {
  static String? parse(String email) {
    if (email.isEmpty) return null;

    final int at = email.indexOf('@');
    if (at == -1) return null;

    final int dot = email.indexOf('.', at);
    if (dot == -1) return null;

    return email;
  }
}
