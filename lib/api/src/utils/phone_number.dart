abstract class PhoneNumber {
  static String? parse(String? phone) {
    /// If [phone] is null or empty, return null.
    if (phone == null || isPhone(phone) == false) return null;

    /// If [phone] starts with '+\d{1,3}', return [phone].
    if (phone.startsWith(RegExp(r'\+\d{1,3}'), 0)) return phone;

    /// Default add country code '+86'.
    return '+86' + phone;
  }

  static bool isPhone(String phone) {
    if (phone.isEmpty) return false;

    /// If [phone] starts with '+\d{1,3}', return true
    if (phone.startsWith(RegExp(r'\+\d{1,3}'), 0)) return true;

    /// If phone is china phone number, return true
    if (phone.startsWith(RegExp(r'^1[3-9]\d{9}$'), 0)) return true;

    // Default return false
    return false;
  }
}
