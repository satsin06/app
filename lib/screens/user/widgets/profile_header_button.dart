import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/auth.dart';
import '../../../router/route_names.dart' as route_names;
import 'profile_header_open_more_button.dart';

class ProfileHeaderButton extends ConsumerWidget {
  const ProfileHeaderButton(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? auth = ref.read($AuthProvider);

    if (auth == userId) {
      return IconButton(
        onPressed: () {
          context.pushNamed(route_names.setting);
        },
        icon: const Icon(Icons.crop_square),
      );
    }

    return const ProfileHeaderOpenMoreButton();
  }
}
