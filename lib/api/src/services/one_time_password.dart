import '../api.dart';

class OneTimePasswordService {
  final API api;
  const OneTimePasswordService(this.api);

  /// Send a One-time password to [email] or [phone].
  ///
  /// If [email] is provided, the email will be sent to the email address.
  /// If [phone] is provided, the SMS will be sent to the phone number.
  ///
  /// [email] and [phone] are mutually exclusive.
  ///
  /// Send a One-time password to [email] example:
  /// ```dart
  /// api.oneTimePassword.send(email: 'hello@odroe.com');
  /// ```
  ///
  /// Send a One-time password to [phone] example:
  /// ```dart
  /// api.oneTimePassword.send(phone: '+123456789');
  /// ```
  Future<void> send({String? email, String? phone}) async {
    if (email == null || email.isEmpty == true) {
      assert(phone != null && phone.isNotEmpty == true, 'phone is required');
    }
    if (phone == null || phone.isEmpty == true) {
      assert(email != null && email.isNotEmpty == true, 'email is required');
    }

    const String query = r'''
mutation SendOneTimePassword($type: OneTimePasswordType!, $value: String!) {
  sendOTP(type: $type, value: $value)
}
''';
    final Map<String, dynamic> variables = <String, dynamic>{
      'type': email != null ? 'EMAIL' : 'SMS',
      'value': email ?? phone,
    };

    await api.request(
      query: query,
      operationName: 'SendOneTimePassword',
      variables: variables,
    );
  }

  /// Send a One-time password to current authenticated user.
  ///
  /// [email] and [phone] are mutually exclusive.
  Future<void> sendForAuth({bool email = false, bool phone = false}) async {
    assert(email != phone, 'email and phone are mutually exclusive');

    const String query = r'''
mutation SendMeOtp($type: OneTimePasswordType!) {
  sendMeOtp(type: $type)
}
''';
    final Map<String, dynamic> variables = <String, dynamic>{
      'type': email == true ? 'EMAIL' : 'SMS',
    };

    await api.request(
      query: query,
      operationName: 'SendMeOtp',
      variables: variables,
    );
  }
}
