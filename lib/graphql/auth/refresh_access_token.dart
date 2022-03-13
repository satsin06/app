import 'dart:async';

import 'package:graphql/client.dart';

import '../../hive/hive.dart';
import '../constants.dart';
import '../links/base_link.dart';
import 'get_access_token.dart';

/// Define the refresh access token GraphQL client link.
final _link = AuthLink(
  headerKey: authHeaderKey,
  getToken: () async => (await getCachedAccessToken())?.token,
).concat(graphqlBaseLink);

/// Define the refresh access token GraphQL client.
final GraphQLClient _client = GraphQLClient(
  cache: GraphQLCache(),
  link: _link,
);

/// Define the refresh access token GraphQL document string.
const String _mutation = r'''
mutation RefreshAccessToken {
  refreshAccessToken {
    token
    userId
    expiredAt
    refreshExpiredAt
  }
}
''';

/// Define the refresh access token GraphQL mutation options.
final MutationOptions _options = MutationOptions(
  document: gql(_mutation),
);

FutureOr<AccessToken?> refreshAccessToken() async {
  final result = await _client.mutate(_options);

  if (result.hasException) {
    return null;
  }

  final data = result.data!['refreshAccessToken']!;

  return AccessToken()
    ..expiredAt = DateTime.parse(data['expiredAt'])
    ..refreshExpiredAt = DateTime.parse(data['refreshExpiredAt'])
    ..token = data['token']
    ..userId = data['userId'];
}
