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
    assert(email != null && phone != null,
        'email and phone are mutually exclusive');
    assert(email == null && phone == null,
        'Either email or phone must be provided');

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
  Future<void> sendForAuth({bool? email, bool? phone}) async {
    assert(email == null && phone == null,
        'Either email or phone must be provided');
    assert(email == false && phone == false, 'One type must be provided');
    assert(email == true && phone == true, 'Only one type can be provided');

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
