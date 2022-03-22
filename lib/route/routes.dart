import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/user/profile.dart';
import '../screens/user/setting.dart';
import 'route_names.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RouteNames.home: (BuildContext context) => const HomeScreen(),
  RouteNames.login: (BuildContext context) => const LoginScreen(),
  RouteNames.userProfile: (BuildContext context) => const UserProfileScreen(),
  RouteNames.userSetting: (BuildContext context) => const UserSettingScreen(),
};
