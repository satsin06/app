import 'package:graphql/client.dart';
import 'package:hive/hive.dart';

import 'links/auth_link.dart';

const String _cacheKey = r'graphql';
Future<Box> _getBox() async {
  if (Hive.isBoxOpen(_cacheKey)) {
    return Hive.box(_cacheKey);
  }

  return Hive.openBox(_cacheKey);
}

GraphQLCache? _kCache;
Future<GraphQLCache> get _cache async {
  return _kCache ??= GraphQLCache(
    store: HiveStore(await _getBox()),
  );
}

GraphQLClient? _kClient;
Future<GraphQLClient> getGraphQLClient() async {
  return _kClient ??= GraphQLClient(
    cache: await _cache,
    link: graphqlAuthLink,
  );
}
