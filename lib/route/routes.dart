import 'package:flutter/material.dart';

import '../screens/home/home.dart';
import '../screens/login/login.dart';
import 'route_names.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RouteNames.home: (BuildContext context) => const HomeScreen(),
  RouteNames.login: (BuildContext context) => const LoginScreen(),
};
