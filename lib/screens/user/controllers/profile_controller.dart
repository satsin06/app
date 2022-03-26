import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../hive/models/user.dart';
import '../../../provider/states/users.dart';

class UserProfileController with ChangeNotifier {
  UserProfileController(this.userId);

  final String userId;

  UserProxyOfUserProfileController createProxy(BuildContext context) =>
      UserProxyOfUserProfileController(context);

  static UserProxyOfUserProfileController proxy(BuildContext context) =>
      of(context).createProxy(context);

  static UserProfileController of(BuildContext context) =>
      context.read<UserProfileController>();
}

class UserProxyOfUserProfileController {
  const UserProxyOfUserProfileController(this.context);

  final BuildContext context;

  UserProfileController get controller => UserProfileController.of(context);

  User read() {
    return context
        .read<UsersState>()
        .find(
          where: (user) => user.id == controller.userId,
        )
        .first;
  }

  T select<T>(T Function(Iterable<User> user) selector) {
    final UserProfileController controller = this.controller;

    return context.select<UsersState, T>((state) {
      final Iterable<User> users = state.find(
        where: (user) => user.id == controller.userId,
      );

      return selector(users);
    });
  }

  // T Function(UsersState) _selectCurrentUsersSelector<T>(
  //     T Function(Iterable<User>) selector) {
  //   return (UsersState state) {
  //     selector.call(state.find(
  //       where: (user) => user.id == controller.userId,
  //     ));
  //   };
  // }

  // T select<T>(T Function(Iterable<User>) selector) =>

  //     context.select<UsersState, T>((state) => selector
  //         .call(state.find(where: (user) => user.id == controller.userId)));
}
