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

    for (Authorization item in result.parsedData ?? []) {
      final AuthorizationType type =
          item.$type == AuthorizationType.access.value
              ? AuthorizationType.access
              : AuthorizationType.refresh;
      if (type == AuthorizationType.access) {
        await manager.store(AuthorizationType.access, item);
        state = item.payload!;
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
