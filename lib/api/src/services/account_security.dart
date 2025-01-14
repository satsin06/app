import '../api.dart';
import '../models/account_security_health_result.dart';
import '../models/user_security_fields.dart';
import '../utils/email_address.dart';
import '../utils/password.dart';
import '../utils/phone_number.dart';

class AccountSecurityService {
  final API api;

  const AccountSecurityService(this.api);

  /// Health check account security status.
  Future<List<AccountSecurityHealthResult>> health() async {
    const String query = '''
query AccountSecurityHealth {
  accountSecurityHealth {
    field
    message
    status
  }
}
    ''';
    final Map<String, dynamic>? data =
        await api.request(query: query, operationName: 'AccountSecurityHealth');
    final List<dynamic> healths = data!['accountSecurityHealth'];

    return healths
        .map<AccountSecurityHealthResult>((dynamic health) =>
            AccountSecurityHealthResult.fromJson(
                health as Map<String, dynamic>))
        .toList();
  }

  /// Update account password.
  ///
  /// [password] - New password.
  /// [verificationField] - Verification field.
  /// [verificationValue] - Verification value.
  Future<void> updatePassword({
    required String password,
    required UserSecurityFields verificationField,
    required String verificationValue,
  }) =>
      _updateAccountSecurity(
        field: UserSecurityFields.password,
        value: password,
        verificationField: verificationField,
        verificationValue: verificationValue,
      );

  /// Update account binding phone.
  ///
  /// [phone] - New phone.
  /// [otp] - New phone One-Time Password.
  /// [verificationField] - Verification field.
  /// [verificationValue] - Verification value.
  Future<void> updatePhone({
    required String phone,
    required String otp,
    required UserSecurityFields verificationField,
    required String verificationValue,
  }) {
    final parsedPhoneNumber = PhoneNumber.parse(phone);
    if (parsedPhoneNumber == null) {
      throw const FormatException('Invalid phone number.');
    }

    return _updateAccountSecurity(
      field: UserSecurityFields.phone,
      value: parsedPhoneNumber,
      otp: otp,
      verificationField: verificationField,
      verificationValue: verificationValue,
    );
  }

  /// Update account binding email.
  ///
  /// [email] - New email.
  /// [otp] - New email One-Time Password.
  /// [verificationField] - Verification field.
  /// [verificationValue] - Verification value.
  Future<void> updateEmail({
    required String email,
    required String otp,
    required UserSecurityFields verificationField,
    required String verificationValue,
  }) {
    final String? emailAddress = EmailAddress.parse(email);
    if (emailAddress == null) {
      throw const FormatException('Invalid email address');
    }

    return _updateAccountSecurity(
      field: UserSecurityFields.email,
      value: emailAddress,
      otp: otp,
      verificationField: verificationField,
      verificationValue: verificationValue,
    );
  }
}

extension _UpdateUserSecurityRequest on AccountSecurityService {
  Future<void> _updateAccountSecurity({
    String? otp,
    required UserSecurityFields field,
    required String value,
    required UserSecurityFields verificationField,
    required String verificationValue,
  }) async {
    const String query = r'''
mutation UpdateUserSecurity($field: UserSecurityFields!, $value: String!, $verifyField: UserSecurityFields!, $verifyValue: String!, $otp: String) {
  updateUserSecurity(
    field: $field, 
    value: $value, 
    verifyField: $verifyField,
    verifyValue: $verifyValue,
    otp: $otp
  ) { id }
}
''';
    final String? parsedPhoneNumber = PhoneNumber.parse(value);
    if (parsedPhoneNumber != null &&
        verificationField == UserSecurityFields.phone) {
      throw const FormatException('Invalid phone number');
    }

    await api.request(
      query: query,
      variables: {
        'field': $UserSecurityFieldsEnumMap[field],
        'value':
            field == UserSecurityFields.password ? Password.hash(value) : value,
        'verifyField': $UserSecurityFieldsEnumMap[verificationField],
        'verifyValue': verificationField == UserSecurityFields.password
            ? Password.hash(verificationValue)
            : verificationValue,
        'otp': otp,
      },
      operationName: 'UpdateUserSecurity',
    );
  }
}
