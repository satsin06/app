import 'dart:async';
import 'dart:convert';

import 'package:authorization_manager/authorization_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import 'graphql.dart' show graphqlBaseLinkProvider;
import 'shared_preferences.dart';

List<Authorization> authorizationsParser(Map<String, dynamic> data) {
  return <Authorization>[
    Authorization.access(
      token: data['token'] as String,
      expiredAt: DateTime.parse(data['expiredAt'] as String),
      payload: data['userId'] as String,
    ),
    Authorization.refresh(
      token: data['token'] as String,
      expiredAt: DateTime.parse(data['refreshExpiredAt']),
      payload: data['userId'] as String,
    ),
  ];
}

const String _refreshAccessTokenDocumment = r'''
mutation RefreshAccessToken {
  refreshAccessToken {
    expiredAt
    refreshExpiredAt
    token
    userId
  }
}
''';

final MutationOptions<List<Authorization>> _refreshAccessTokenOptions =
    MutationOptions<List<Authorization>>(
  document: gql(_refreshAccessTokenDocumment),
  fetchPolicy: FetchPolicy.noCache,
  parserFn: (data) => authorizationsParser(data['refreshAccessToken']),
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
  if (result.hasException) {
    final errors = result.exception?.graphqlErrors;
    for (GraphQLError error in errors ?? []) {
      if (error.message.toUpperCase() == 'Unauthorized'.toUpperCase()) {
        await manager.clear();
        break;
      }
    }

    return;
  }

  // Store result in manager.
  for (Authorization item in result.parsedData ?? []) {
    await manager.store(item);
  }
}

Future<Authorization?> _render(Ref ref, AuthorizationType type) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
  final token = sharedPreferences.getString('${type.name}_token');

  try {
    return Authorization.fromJson(jsonDecode(token!));
  } catch (e) {
    return null;
  }
}

Future<void> _writer(Ref ref, Authorization authorization) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);

  await sharedPreferences.setString(
    '${authorization.type.name}_token',
    jsonEncode(authorization.toJson()),
  );
}

Future<void> _clear(Ref ref) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);

  for (AuthorizationType type in AuthorizationType.values) {
    await sharedPreferences.remove('${type.name}_token');
  }
}

final authorizationManagerProvider = FutureProvider<AuthorizationManager>(
  (Ref ref) async {
    final manager = AuthorizationManager(
      clear: (manager) => _clear(ref),
      refresher: (manager) => _refresher(ref, manager),
      reader: (type) => _render(ref, type),
      writer: (entity) => _writer(ref, entity),
    );
    await manager.init();

    return manager;
  },
);
