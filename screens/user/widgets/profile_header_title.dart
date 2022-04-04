import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../hive/models/user.dart';
import '../../../provider/states/users.dart';

class ProfileHeaderTitle extends StatelessWidget {
  const ProfileHeaderTitle({
    Key? key,
    required this.userId,
  }) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    final String? username = _usernameForState(context);

    return Text(username ?? 'User Profile');
  }

  String? _usernameForState(BuildContext context) {
    return context.select<UsersState, String?>(_usernameSelector);
  }

  String? _usernameSelector(UsersState state) {
    final Iterable<User> users = state.find(where: (user) => user.id == userId);

    if (users.isNotEmpty) {
      return users.first.username;
    }

    return null;
  }
}
