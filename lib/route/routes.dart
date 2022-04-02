import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/publish/publish_moment_screen.dart';
import '../screens/user/edit_user_screen.dart';
import '../screens/user/profile.dart';
import '../screens/user/setting.dart';
import 'route_names.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RouteNames.home: (BuildContext context) => const HomeScreen(),
  RouteNames.login: (BuildContext context) => const LoginScreen(),
  RouteNames.publish: (BuildContext context) => const PublishMomentScreen(),
  RouteNames.userProfile: (BuildContext context) => const UserProfileScreen(),
  RouteNames.userSetting: (BuildContext context) => const UserSettingScreen(),
  RouteNames.userEdit: (BuildContext context) => const EditUserScreen(),
};
