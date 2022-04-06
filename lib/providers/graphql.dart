import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../configure.dart';
import 'authorization_manager.dart';

final graphqlBaseLinkProvider = Provider((Ref ref) => HttpLink(graphqlApiUrl));

final _graphqlAuthLinkPrvider = Provider(
  (Ref ref) => AuthLink(
    headerKey: r'Authorization',
    getToken: () async {
      final manager = ref.read(authorizationManagerProvider);
      final accessToken = await manager.getAccessToken();

      return accessToken?.token;
    },
  ).concat(ref.read(graphqlBaseLinkProvider)),
);

final graphqlClientProvider = Provider(
  (Ref ref) => GraphQLClient(
    cache: GraphQLCache(),
    link: ref.read(_graphqlAuthLinkPrvider),
  ),
);

void thenGraphQLResultException<T>(QueryResult<T> result) {
  if (result.hasException) {
    if (result.exception!.graphqlErrors.isNotEmpty) {
      throw FormatException(result.exception!.graphqlErrors.first.message);
    }

    throw result.exception!;
  } else if (result.data == null) {
    throw const FormatException('GraphQL result data is null');
  }
}
