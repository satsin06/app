import 'package:flutter/material.dart';

import '../screens/login/login.dart';
import 'route_names.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  RouteNames.login: (BuildContext context) => const LoginScreen(),
};
