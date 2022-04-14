import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../api/api.dart';
import '../../../providers/api.dart';
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
    final double iconSize = getIconSize(context);
    final String? userId = ref.watch($AuthProvider);
    if (userId == null || userId.isEmpty) {
      return IconButton(
        icon: UserAvatar(radius: iconSize / 2, userId: userId),
        iconSize: iconSize,
        onPressed: () => onJump(context, ref),
      );
    }

    final User user = ref.read($UserProvider(userId));
    return FutureBuilder<User>(
      builder: _createBuilder(ref),
      initialData: user,
      future: _createFuture(ref, user),
    );
  }

  IconButton Function(BuildContext, AsyncSnapshot<User>) _createBuilder(
      WidgetRef ref) {
    return (BuildContext context, AsyncSnapshot<User> snapshot) {
      final double iconSize = getIconSize(context);
      return IconButton(
        icon: UserAvatar(radius: iconSize / 2, userId: snapshot.data?.id),
        iconSize: iconSize,
        onPressed: () => onJump(context, ref),
      );
    };
  }

  Future<User> _createFuture(WidgetRef ref, User user) async {
    if (user is InitProviderCreatedUser) {
      final UserService service = ref.read($APIProvider).user;
      final User result = await service.findUnique(
        UserWhereUniqueInput.id(user.id),
      );

      return ref
          .read($UserProvider(user.id).notifier)
          .update((state) => result);
    }

    return user;
  }

  void onJump(BuildContext context, WidgetRef ref) {
    ref.read($AuthProvider.notifier).can(context, (String userId) {
      context.pushNamed(route_names.userProfile, params: {
        'id': userId,
      });
    });
  }
}
