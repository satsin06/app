import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/auth.dart';
import '../../../router/route_names.dart' as route_names;

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

  _jump(BuildContext context, WidgetRef ref) {
    ref.read($AuthProvider.notifier).can(context, (String userId) {
      context.pushNamed(route_names.publish);
    });
  }
}
