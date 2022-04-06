import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql/client.dart';

import '../authorization_manager/authorization_manager.dart';
import 'authorization_manager.dart';
import 'graphql.dart';

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

MutationOptions<List<Authorization>> _createLoginOptions({
  required String account,
  required String password,
  bool? usePhoneOtp = false,
}) {
  return MutationOptions<List<Authorization>>(
    document: gql(_loginDocument),
    fetchPolicy: FetchPolicy.noCache,
    parserFn: (data) => authorizationsParser(data['login']),
    variables: <String, dynamic>{
      'account': account,
      'password': password,
      'usePhoneOtp': usePhoneOtp,
    },
  );
}

class AuthNotifier extends StateNotifier<String?> {
  AuthNotifier({
    required this.ref,
    String? userId,
  }) : super(userId);

  final Ref ref;

  set userId(String? userId) => state = userId;

  Future<void> login({
    required String account,
    required String password,
    bool? usePhoneOtp,
  }) async {
    final manager = ref.read(authorizationManagerProvider);
    final client = ref.read(graphqlClientProvider);
    final options = _createLoginOptions(
        account: account, password: password, usePhoneOtp: usePhoneOtp);

    final result = await client.mutate(options);
    thenGraphQLResultException(result);

    for (Authorization item in result.parsedData ?? []) {
      manager.store(item);
      if (item.type == AuthorizationType.access) {
        userId = item.payload!;
      }
    }
  }

  Future<void> logout() async {
    final manager = ref.read(authorizationManagerProvider);

    await manager.clear();
    state = null;
  }

  Future<void> load() async {
    final manager = ref.read(authorizationManagerProvider);
    final accessToken = await manager.getAccessToken();
    if (accessToken != null) {
      state = accessToken.payload!;
    }
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, String?>(
  (ref) => AuthNotifier(ref: ref),
);
