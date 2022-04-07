import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../screens/user/profile.dart';

const String _paramKey = 'userId';

Widget _builder(BuildContext context, GoRouterState state) {
  return UserProfileScreen(
    key: state.pageKey,
    userId: state.params[_paramKey]!,
  );
}

class _UserProfileRoute extends GoRoute {
  _UserProfileRoute()
      : super(
          path: '/users/:$_paramKey',
          builder: _builder,
        );

  @override
  String get name => 'User Profile';

  void Function(String) push(BuildContext context) => (String userId) =>
      GoRouter.of(context).pushNamed(name, params: {_paramKey: userId});
}

final _UserProfileRoute userProfileRoute = _UserProfileRoute();
