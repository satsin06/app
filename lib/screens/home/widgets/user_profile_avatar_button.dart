import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../providers/auth.dart';
import '../../../providers/user.dart';
import '../../../widgets/user_avatar.dart';
import '../../../router/route_names.dart' as route_names;

class UserProfileAvatarButton extends ConsumerWidget {
  const UserProfileAvatarButton({Key? key}) : super(key: key);

  /// Icon size, Default is 24.0. See: [IconButton.iconSize].
  static double getIconSize(BuildContext context) =>
      IconTheme.of(context).size ?? 24;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: const _AccountAvatarIconWidget(),
      iconSize: getIconSize(context),
      onPressed: () => onJump(context, ref),
    );
  }

  void onJump(BuildContext context, WidgetRef ref) {
    ref.read(authProvider.notifier).can(context, (String userId) {
      context.pushNamed(route_names.userProfile, params: {
        'id': userId,
      });
    });
  }
}

class _AccountAvatarIconWidget extends ConsumerWidget {
  const _AccountAvatarIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String? userId = ref.watch(authProvider);

    if (userId == null || userId.isEmpty) {
      return const Icon(Icons.account_circle_rounded);
    }

    final loader = ref.watch(loadUserProvider(userId));

    return loader.when(
      data: (_) => UserAvatar(userId, radius: 12),
      loading: () => const Icon(Icons.account_circle_rounded),
      error: (_, __) => const Icon(Icons.account_circle_rounded),
    );
  }
}
