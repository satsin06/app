import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../configure.dart';
import 'authorization_manager_provider.dart';

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
