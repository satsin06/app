import 'package:graphql/client.dart';

import '../../../graphql/client.dart';
import '../../../hive/hive.dart';

const _loginDocumentString = r'''
mutation Login($account: String!, $password: String!, $usePhoneOtp: Boolean) {
  login(account: $account, password: $password, usePhoneOTP: $usePhoneOtp) {
    userId
    token
    refreshExpiredAt
    expiredAt
  }
}
''';

MutationOptions _createLoginMutationOptions({
  required String account,
  required String password,
  bool usePhoneOtp = false,
}) {
  return MutationOptions(
    document: gql(_loginDocumentString),
    variables: <String, dynamic>{
      r'account': account,
      r'password': password,
      r'usePhoneOtp': usePhoneOtp
    },
    operationName: r'Login',
  );
}

Future<AccessToken> login({
  required String account,
  required String password,
  bool usePhoneOtp = false,
}) async {
  final GraphQLClient client = await getGraphQLClient();
  final result = await client.mutate(
    _createLoginMutationOptions(
      account: usePhoneOtp ? '+86$account' : account,
      password: password,
      usePhoneOtp: usePhoneOtp,
    ),
  );
  if (result.hasException) {
    throw result.exception!.graphqlErrors.isNotEmpty
        ? result.exception!.graphqlErrors.first.message
        : result.exception!.linkException!;
  }

  final data = result.data!['login'];

  return AccessToken()
    ..expiredAt = DateTime.parse(data['expiredAt'] as String)
    ..refreshExpiredAt = DateTime.parse(data['refreshExpiredAt'] as String)
    ..token = data['token'] as String
    ..userId = data['userId'] as String;
}
