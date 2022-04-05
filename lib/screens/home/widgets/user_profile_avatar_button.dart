import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../providers/auth_provider.dart';
import '../../../route/route_names.dart';

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

  Future<void> onJump(BuildContext context, WidgetRef ref) async {
    final String? userId = ref.read(authProvider);

    if (userId == null || userId.isEmpty) {
      await Navigator.of(context).pushNamed(RouteNames.login);

      final String? userId = ref.read(authProvider);
      if (userId != null && userId.isNotEmpty) {
        jump(context, userId);
      }

      return;
    }

    jump(context, userId);
  }

  void jump(BuildContext context, String userId) {
    Navigator.of(context).pushNamed(
      RouteNames.userProfile,
      arguments: userId,
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

    // TODO: Get user avatar.
    return CircleAvatar(
      backgroundColor: IconTheme.of(context).color,
      radius: UserProfileAvatarButton.getIconSize(context) / 2,
    );
  }
}
