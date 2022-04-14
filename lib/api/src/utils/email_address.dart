abstract class EmailAddress {
  static String? parse(String email) {
    return isEmail(email) ? email : null;
  }

  static bool isEmail(String email) {
    if (email.isEmpty) return false;

    final int at = email.indexOf('@');
    if (at == -1) return false;

    final int dot = email.indexOf('.', at);
    if (dot == -1) return false;

    return true;
  }
}
