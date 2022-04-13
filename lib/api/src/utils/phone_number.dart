abstract class PhoneNumber {
  static String? parse(String? phone) {
    /// If [phone] is null or empty, return null.
    if (phone == null || phone.isEmpty) return null;

    /// If [phone] starts with '+\d{1,3}', return [phone].
    if (phone.startsWith(RegExp(r'\+\d{1,3}'), 0)) return phone;

    /// Default add country code '+86'.
    return '+86' + phone;
  }
}
