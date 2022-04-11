import 'package:authorization_manager/authorization_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql/client.dart';

import 'authorization_manager.dart';
import 'graphql.dart';
import '../router/route_names.dart' as route_names show login;

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

  Future<String> login({
    required String account,
    required String password,
    bool? usePhoneOtp,
  }) async {
    final manager = await ref.read(authorizationManagerProvider.future);
    final client = ref.read(graphqlClientProvider);
    final options = _createLoginOptions(
        account: account, password: password, usePhoneOtp: usePhoneOtp);

    final result = await client.mutate(options);
    thenGraphQLResultException(result);

    for (Authorization item in result.parsedData ?? []) {
      manager.store(item);
    }

    return userId = result.parsedData!
        .firstWhere((element) => element.type == AuthorizationType.access)
        .payload!;
  }

  Future<void> logout() async {
    final manager = await ref.read(authorizationManagerProvider.future);

    await manager.clear();
    state = null;
  }

  Future<void> load() async {
    final manager = await ref.read(authorizationManagerProvider.future);
    final accessToken = await manager.getAccessToken();
    if (accessToken != null) {
      state = accessToken.payload!;
    }
  }

  void can(BuildContext context, void Function(String) fn) {
    if (state != null) {
      return fn.call(state!);
    }

    context.pushNamed(
      route_names.login,
      extra: (String userId) {
        context.pop();
        fn(userId);
      },
    );
  }

  Future<String?> authorizationTokenReader() async {
    final manager = await ref.read(authorizationManagerProvider.future);
    final accessToken = await manager.getAccessToken();

    return accessToken?.token;
  }
}

final authProvider = StateNotifierProvider<AuthNotifier, String?>(
  (ref) => AuthNotifier(ref: ref),
);
