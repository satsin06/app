import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/auth_provider.dart';
import '../../../route/route_names.dart';

class JumpPublishButton extends ConsumerWidget {
  const JumpPublishButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: _createJumpHandler(context, ref),
      child: const Icon(Icons.add),
    );
  }

  VoidCallback _createJumpHandler(BuildContext context, WidgetRef ref) {
    return () => _jump(context, ref);
  }

  _jump(BuildContext context, WidgetRef ref) async {
    final String? userId = ref.read(authProvider);
    if (userId == null) {
      await Navigator.pushNamed(context, RouteNames.login);

      final String? userId = ref.read(authProvider);
      if (userId != null) {
        return Navigator.pushNamed(context, RouteNames.publish);
      }
    }

    return Navigator.pushNamed(context, RouteNames.publish);
  }
}
