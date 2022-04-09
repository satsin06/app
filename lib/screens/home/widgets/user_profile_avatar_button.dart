import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/auth.dart';
import '../../../providers/user.dart';
import '../../../router/routes.dart';
import '../../../widgets/user_avatar.dart';

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
    loginRoute.canAuthPush(
      context: context,
      ref: ref,
      callback: userProfileRoute.push(context).call,
    );
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

    final provider = loadUserProvider(userId);
    final loader = ref.watch(provider);

    return loader.when(
      data: (_) => UserAvatar(userId, radius: 12),
      loading: () => const Icon(Icons.account_circle_rounded),
      error: (_, __) => const Icon(Icons.account_circle_rounded),
    );
  }
}
