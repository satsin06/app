import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/states/app_auth.dart';
import '../../../route/route_names.dart';

class UserProfileAvatarButton extends StatelessWidget {
  const UserProfileAvatarButton({Key? key}) : super(key: key);

  /// Icon size, Default is 24.0. See: [IconButton.iconSize].
  static double getIconSize(BuildContext context) =>
      IconTheme.of(context).size ?? 24;

  @override
  Widget build(BuildContext context) {
    // Get user login status.
    final bool isAuthenticated = context.select<AppAuthState, bool>(
      (AppAuthState state) => state.isAuthenticated,
    );

    return IconButton(
      icon: const _AccountAvatarIconWidget(),
      iconSize: getIconSize(context),
      onPressed: () => onJump(context, isAuthenticated),
    );
  }

  Future<void> onJump(BuildContext context, bool isAuthenticated) async {
    if (!isAuthenticated) {
      await Navigator.of(context).pushNamed(RouteNames.login);
    }

    final String? userId = context.read<AppAuthState>().userId;
    if (userId != null) {
      jump(context, userId);
    }
  }

  void jump(BuildContext context, String userId) {
    Navigator.of(context).pushNamed(
      RouteNames.login, // TODO：Change to user profile page.
      arguments: userId,
    );
  }
}

class _AccountAvatarIconWidget extends StatelessWidget {
  const _AccountAvatarIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? userId = context.select<AppAuthState, String?>(
      (AppAuthState state) => state.userId,
    );

    if (userId == null) {
      return const Icon(Icons.account_circle_rounded);
    }

    // TODO: Get user avatar.
    return CircleAvatar(
      backgroundColor: IconTheme.of(context).color,
      radius: UserProfileAvatarButton.getIconSize(context) / 2,
    );
  }
}
