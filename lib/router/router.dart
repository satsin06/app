import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final GoRouter router = GoRouter(
  routes: <GoRoute>[
    homeTimelineRoute,
    homeFollowRoute,
    loginRoute,
    publishRoute,
    settingsRoute,
    userProfileRoute,
  ],
  debugLogDiagnostics: kDebugMode,
);
