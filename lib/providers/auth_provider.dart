import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../authorization_manager/authorization_manager.dart';
import 'authorization_manager_provider.dart';
import 'graphql_provider.dart';

const String _loginDocument = r'''
mutation Login($account: String!, $password: String!, $usePhoneOtp: Boolean) {
  login(account: $account, password: $password, usePhoneOTP: $usePhoneOtp) {
    expiredAt
    refreshExpiredAt
    token
    userId
  }
}
''';

final MutationOptions<List<Authorization>> _loginOptions =
    MutationOptions<List<Authorization>>(
  document: gql(_loginDocument),
  fetchPolicy: FetchPolicy.noCache,
  parserFn: authorizationsParser,
);

class AuthNotifier extends StateNotifier<String?> {
  AuthNotifier({
    required this.ref,
    String? userId,
  }) : super(userId);

  final Ref ref;

  Future<void> login() async {
    final manager = ref.read(authorizationManagerProvider);
    final client = ref.read(graphqlClientProvider);

    final result = await client.mutate(_loginOptions);

    for (Authorization item in result.parsedData ?? []) {
      await manager.store(item.$type, item);
      if (item.$type == AuthorizationType.access) {
        state = item.payload;
      }
    }
  }

  Future<void> logout() async {
    final manager = ref.read(authorizationManagerProvider);

    await manager.clear();
    state = null;
  }
}

final authProvider = StateProvider((ref) => AuthNotifier(ref: ref));
