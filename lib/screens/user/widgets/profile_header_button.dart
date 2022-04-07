import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/auth.dart';
import '../../../router/routes/settings.dart';
import 'profile_header_open_more_button.dart';

class ProfileHeaderButton extends ConsumerWidget {
  const ProfileHeaderButton(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? auth = ref.read(authProvider);

    if (auth == userId) {
      return IconButton(
        onPressed: () {
          GoRouter.of(context).push(settingsRoute.path);
        },
        icon: const Icon(Icons.crop_square),
      );
    }

    return const ProfileHeaderOpenMoreButton();
  }
}
