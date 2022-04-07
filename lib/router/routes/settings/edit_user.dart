import 'package:go_router/go_router.dart';

import '../../../screens/settings/edit_user_screen.dart';

final settingEditUserRoute = GoRoute(
  path: 'edit',
  name: 'Current Auth User Edit',
  builder: (context, state) => EditUserScreen(key: state.pageKey),
);
