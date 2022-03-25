import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/states/app_auth.dart';
import '../../../route/route_names.dart';
import '../controllers/profile_controller.dart';
import 'profile_header_open_more_button.dart';

class ProfileHeaderButton extends StatelessWidget {
  const ProfileHeaderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String? currentAuthenticatedUserId =
        _currentAuthenticatedUserId(context);
    final String userId = _userId(context);

    if (currentAuthenticatedUserId == userId) {
      return IconButton(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteNames.userSetting);
        },
        icon: const Icon(Icons.crop_square),
      );
    }

    return const ProfileHeaderOpenMoreButton();
  }

  String _userId(BuildContext context) {
    return context.read<UserProfileController>().userId;
  }

  String? _currentAuthenticatedUserId(BuildContext context) {
    return context.select<AppAuthState, String?>(_selecotr);
  }

  String? _selecotr(AppAuthState state) => state.userId;
}
