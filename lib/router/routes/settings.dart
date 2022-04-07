import 'package:go_router/go_router.dart';

import '../../screens/settings/settings.dart';
import 'settings/edit_user.dart';

export 'settings/edit_user.dart';

final GoRoute settingsRoute = GoRoute(
  name: 'Settings',
  path: '/settings',
  builder: (context, state) => SettingsScreen(key: state.pageKey),
  routes: <GoRoute>[
    settingEditUserRoute,
  ],
);
