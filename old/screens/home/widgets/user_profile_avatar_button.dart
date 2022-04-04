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
      icon: Hero(
        tag: 'currentUserAvatar',
        child: _AccountAvatarIconWidget(isAuthenticated: isAuthenticated),
      ),
      iconSize: getIconSize(context),
      onPressed: () => onJump(context, isAuthenticated),
    );
  }

  Future<void> onJump(BuildContext context, bool isAuthenticated) async {
    if (!isAuthenticated) {
      await Navigator.of(context).pushNamed(RouteNames.login);
    }

    final AppAuthState state = context.read<AppAuthState>();
    if (state.isAuthenticated && state.userId != null) {
      jump(context, state.userId!);
    }
  }

  void jump(BuildContext context, String userId) {
    Navigator.of(context).pushNamed(
      RouteNames.userProfile,
      arguments: userId,
    );
  }
}

class _AccountAvatarIconWidget extends StatelessWidget {
  const _AccountAvatarIconWidget({
    Key? key,
    required this.isAuthenticated,
  }) : super(key: key);

  final bool isAuthenticated;

  @override
  Widget build(BuildContext context) {
    final String? userId = context.select<AppAuthState, String?>(
      (AppAuthState state) => state.userId,
    );

    if (userId == null || isAuthenticated == false) {
      return const Icon(Icons.account_circle_rounded);
    }

    // TODO: Get user avatar.
    return CircleAvatar(
      backgroundColor: IconTheme.of(context).color,
      radius: UserProfileAvatarButton.getIconSize(context) / 2,
    );
  }
}
