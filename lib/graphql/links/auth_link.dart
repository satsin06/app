import 'package:graphql/client.dart';

import '../auth/get_access_token.dart';
import '../constants.dart';
import 'base_link.dart';

final Link graphqlAuthLink = AuthLink(
  headerKey: authHeaderKey,
  getToken: () async => (await getAccessTokenWithRefresh())?.token,
).concat(graphqlBaseLink);
