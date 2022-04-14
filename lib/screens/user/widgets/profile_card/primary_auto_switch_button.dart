import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../providers/auth.dart';
import '../../../../router/route_names.dart' as route_names;

class PrimaryAuthSwitchButton extends ConsumerWidget {
  const PrimaryAuthSwitchButton(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? auth = ref.watch($AuthProvider);

    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 64, vertical: 8),
        ),
        elevation: MaterialStateProperty.all(12),
      ),
      onPressed: buildAutoSwitchOnPressed(context, auth),
      child: buildButtonText(context, auth),
    );
  }

  Widget buildButtonText(BuildContext context, String? auth) {
    if (auth == userId) return const Text('编辑资料');

    // TODO: Load user follow status
    return const Text('关注');
  }

  VoidCallback buildAutoSwitchOnPressed(BuildContext context, String? auth) {
    if (auth == userId) return () => jumpEditUserScreen(context);

    return () {
      // TODO: Follow/Unfollow user
    };
  }

  void jumpEditUserScreen(BuildContext context) {
    context.pushNamed(route_names.settingEditAccount);
  }
}
