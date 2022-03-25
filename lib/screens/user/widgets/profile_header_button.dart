import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/states/app_auth.dart';
import '../../../route/route_names.dart';
import 'profile_header_open_more_button.dart';

class ProfileHeaderButton extends StatelessWidget {
  static List<Widget> actions(String userId) {
    return <Widget>[ProfileHeaderButton._(userId)];
  }

  const ProfileHeaderButton._(this.userId, {Key? key}) : super(key: key);

  final String userId;

  @override
  Widget build(BuildContext context) {
    final String? currentAuthenticatedUserId =
        _currentAuthenticatedUserId(context);

    if (currentAuthenticatedUserId == userId) {
      return IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteNames.userSetting);
        },
        icon: const Icon(Icons.crop_square),
      );
    }

    return ProfileHeaderOpenMoreButton(userId);
  }

  String? _currentAuthenticatedUserId(BuildContext context) {
    return context.select<AppAuthState, String?>(_selecotr);
  }

  String? _selecotr(AppAuthState state) => state.userId;
}
