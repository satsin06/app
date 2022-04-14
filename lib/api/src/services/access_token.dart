import '../api.dart';
import '../authentication.dart';
import '../models/access_token.dart';
import '../utils/email_address.dart';
import '../utils/password.dart';
import '../utils/phone_number.dart';

class AccessTokenService {
  final API api;

  const AccessTokenService(this.api);

  /// Login, Create a access token.
  ///
  /// - [account] The account to login, account allow email/phone/username.
  /// - [password] The password of the account, if [usePhoneOtp] is true,
  /// the password is the phone/email otp.
  /// - [usePhoneOtp] If true, the password is the phone/email otp.
  Future<AccessToken> create({
    required String account,
    required String password,
    bool? usePhoneOtp = false,
  }) async {
    final String parsedPassword =
        usePhoneOtp == true ? password : Password.hash(password);
    final String? parsedAccount = usePhoneOtp == true
        ? PhoneNumber.parse(account)
        : parseAccount(account);

    if (parsedAccount == null) {
      throw const FormatException('Invalid account format.');
    }

    final String query = r'''
      mutation CreateAccessToken (
        $account: String!,
        $password: String!,
        $usePhoneOtp: Boolean,
      ) { 
        login(
          account: $account,
          password: $password,
          usePhoneOTP: $usePhoneOtp,
        ) { ...AccessTokenFields }
      }
    ''' +
        fragment;
    final Map<String, dynamic> variables = <String, dynamic>{
      'account': parsedAccount,
      'password': parsedPassword,
      'usePhoneOtp': usePhoneOtp,
    };

    final Map<String, dynamic> data = await api.request(
      query: query,
      variables: variables,
      operationName: 'CreateAccessToken',
    );

    return AccessToken.fromJson(data['login']);
  }

  Future<AccessToken> refresh([Authentication? auth]) async {
    final API customApiClient = getCustomAuthAPIClient(api, auth);
    final String query = r'''
      mutation RefreshAccessToken { 
        refreshAccessToken { ...AccessTokenFields }
      }
    ''' +
        fragment;

    final Map<String, dynamic> data = await customApiClient.request(
      query: query,
      operationName: 'RefreshAccessToken',
    );

    return AccessToken.fromJson(data['refreshAccessToken']);
  }

  Future<void> revoke([Authentication? auth]) async {
    final API customApiClient = getCustomAuthAPIClient(api, auth);
    const String query = r'''
      mutation RevokeAccessToken { 
        logout
      }
    ''';

    await customApiClient.request(
      query: query,
      operationName: 'RevokeAccessToken',
    );
  }
}

extension _CustomUnauthenticatedAPI on AccessTokenService {
  API getCustomAuthAPIClient(API api, [Authentication? auth]) {
    if (auth is Authentication) {
      return API(
        endpoint: api.endpoint,
        client: api.client,
        auth: auth,
      );
    }

    return api;
  }
}

extension _AccountParser on AccessTokenService {
  /// Parse account.
  String parseAccount(String account) {
    if (EmailAddress.isEmail(account)) return account;
    if (PhoneNumber.isPhone(account)) return PhoneNumber.parse(account)!;

    return account;
  }
}

extension _AccessTokenFieldsFragment on AccessTokenService {
  get fragment => r'''
fragment AccessTokenFields on AccessToken {
  token
  userId
  expiredAt
  refreshExpiredAt
  createdAt
}
''';
}
