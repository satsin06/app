import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../screens/publish/publish_moment_screen.dart';

Page<void> _builder(BuildContext context, GoRouterState state) {
  return MaterialPage(
    key: state.pageKey,
    child: const PublishMomentScreen(),
    fullscreenDialog: true,
  );
}

class _PublishRoute extends GoRoute {
  _PublishRoute() : super(path: '/publish', pageBuilder: _builder);

  @override
  String get name => 'publish';

  void push(BuildContext context) => GoRouter.of(context).pushNamed(name);
}

final _PublishRoute publishRoute = _PublishRoute();
