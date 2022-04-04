import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../authorization_manager/authorization_manager.dart';
import 'graphql_provider.dart' show graphqlBaseLinkProvider;
import 'isar_provider.dart';

List<Authorization> authorizationsParser(Map<String, dynamic> data) {
  print(data);
  return [];
}

const String _refreshAccessTokenDocumment = r'''
mutation refreshAccessToken() {
  expiredAt
  refreshExpiredAt
  token
  userId
}
''';

final MutationOptions<List<Authorization>> _refreshAccessTokenOptions =
    MutationOptions<List<Authorization>>(
  document: gql(_refreshAccessTokenDocumment),
  fetchPolicy: FetchPolicy.noCache,
  parserFn: authorizationsParser,
);

Future<void> _refresher(Ref ref, AuthorizationManager manager) async {
  // Create GraphQL link
  final link = AuthLink(
    headerKey: r'Authorization',
    getToken: () async {
      final accessToken = await manager.getAccessToken();

      return accessToken?.token;
    },
  ).concat(ref.read(graphqlBaseLinkProvider));

  // Create GraphQL client
  final client = GraphQLClient(
    cache: GraphQLCache(),
    link: link,
  );

  final result = await client.mutate(_refreshAccessTokenOptions);

  // Store result in manager.
  for (Authorization item in result.parsedData ?? []) {
    await manager.store(item.$type, item);
  }
}

Future<Authorization?> _render(Ref ref, AuthorizationType type) async {
  final isar = await ref.read(isarProvider.future);

  return isar.authorizations.getBy$type(type);
}

Future<void> _writer(
    Ref ref, AuthorizationType type, Authorization authorization) async {
  // Get Isar instance.
  final isar = await ref.read(isarProvider.future);

  // Get stored authorization.
  final stored = await _render(ref, type);

  // Upset authorization.
  await isar.authorizations.put(
    authorization..$id = stored?.$id ?? authorization.$id,
  );
}

Future<void> _clear(Ref ref) async {
  final isar = await ref.read(isarProvider.future);
  await isar.authorizations.deleteAllBy$type(AuthorizationType.values);
}

final authorizationManagerProvider = Provider(
  (Ref ref) => AuthorizationManager(
    clear: (manager) => _clear(ref),
    refresher: (manager) => _refresher(ref, manager),
    reader: (type) => _render(ref, type),
    writer: (type, entity) => _writer(ref, type, entity),
  ),
);