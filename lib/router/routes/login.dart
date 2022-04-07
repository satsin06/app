import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../providers/auth.dart';
import '../../screens/login/login.dart';

Widget _builder(BuildContext context, GoRouterState state) {
  return LoginScreen(state.extra! as LoginCallback, key: state.pageKey);
}

class _LoginRoute extends GoRoute {
  _LoginRoute() : super(path: '/login', builder: _builder);

  @override
  String get name => 'Login';

  void Function(LoginCallback) of(BuildContext context) =>
      (void Function(String) fn) {
        GoRouter.of(context).pushNamed(name, extra: fn);
      };

  void canAuthPush({
    required BuildContext context,
    required WidgetRef ref,
    required LoginCallback callback,
  }) {
    final String? auth = ref.read(authProvider);
    if (auth == null) {
      return of(context).call((String userId) {
        GoRouter.of(context).pop();
        callback.call(userId);
      });
    }

    return callback.call(auth);
  }
}

final _LoginRoute loginRoute = _LoginRoute();
