import 'package:authorization_manager/authorization_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../api/api.dart';
import 'api.dart';
import 'authorization_manager.dart';
import '../router/route_names.dart' as route_names show login;

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
    final AccessTokenService service = ref.read($APIProvider).accessToken;
    final AccessToken accessToken = await service.create(
        account: account, password: password, usePhoneOtp: usePhoneOtp);

    // Write access token to authorization manager.
    final manager = ref.read($AuthorizationManagerProvider);
    await manager.store(Authorization(
      type: AuthorizationType.access,
      token: accessToken.token,
      payload: accessToken.userId,
      expiredAt: accessToken.expiredAt,
    ));
    await manager.store(Authorization(
      type: AuthorizationType.refresh,
      token: accessToken.token,
      payload: accessToken.userId,
      expiredAt: accessToken.refreshExpiredAt,
    ));

    return state = accessToken.userId;
  }

  Future<void> logout() async {
    // Clear authorization manager.
    final manager = ref.read($AuthorizationManagerProvider);
    await manager.clear();

    // Clear user id.
    state = null;

    /// Run revoke token query.
    final AccessTokenService service = ref.read($APIProvider).accessToken;
    service.revoke();
  }

  Future<void> load() async {
    final AuthorizationManager manager =
        ref.read($AuthorizationManagerProvider);
    await manager.init();

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
}

final $AuthProvider = StateNotifierProvider<AuthNotifier, String?>(
  (ref) => AuthNotifier(ref: ref),
);
