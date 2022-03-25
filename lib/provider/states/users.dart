import 'package:flutter/foundation.dart';

import '../../hive/models/user.dart';

class UsersState extends ChangeNotifier {
  final List<User> _users = [];

  void create(User user) {
    _users.removeWhere((element) => element.id == user.id);
    _users.add(user);
    notifyListeners();
  }

  void update({
    required bool Function(User user) where,
    required void Function(User user) update,
  }) {
    find(where: where).forEach(update);

    notifyListeners();
  }

  void delete({
    required bool Function(User user) where,
  }) {
    _users.removeWhere(where);
    notifyListeners();
  }

  Iterable<User> find({
    required bool Function(User user) where,
  }) =>
      _users.where(where);

  bool exists({
    required bool Function(User user) where,
  }) =>
      find(where: where).isNotEmpty;

  User upsert({
    required bool Function(User user) where,
    required User Function() create,
    required void Function(User user) update,
  }) {
    if (exists(where: where)) {
      this.update(where: where, update: update);

      return find(where: where).single;
    }

    final User user = create.call();
    this.create(user);

    return user;
  }
}
