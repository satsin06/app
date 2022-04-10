import 'package:go_router/go_router.dart';

import '../../../screens/settings/account_security/account_security.dart';

final settingsAccountSecurityRoute = GoRoute(
  path: 'ecurity',
  name: 'Account Security',
  builder: (context, state) => AccountSecurityScreen(key: state.pageKey),
);
