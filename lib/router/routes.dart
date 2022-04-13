import '../api/api.dart' show UserSecurityFields;
import '../screens/home/home.dart';
import '../screens/login/login.dart';
import '../screens/publish/publish_moment_screen.dart';
import '../screens/setting/edit/edit_account.dart';
import '../screens/setting/security/account_security.dart';
import '../screens/setting/security/account_security_field_update.dart';
import '../screens/setting/setting.dart';
import '../screens/user/profile.dart';
import 'named_route.dart';
import 'route_names.dart' as route_names;

final List<NamedRoute> routes = <NamedRoute>[
  // Home
  NamedRoute(
    route_names.homeTimeline,
    path: '/',
    // Home -> Timeline
    builder: (context, state) =>
        HomeScreen(key: state.pageKey, tab: HomeScreenTab.timeline),
    routes: <NamedRoute>[
      // Home -> Follow
      NamedRoute(
        route_names.homeFollow,
        path: 'follow',
        builder: (context, state) =>
            HomeScreen(key: state.pageKey, tab: HomeScreenTab.follow),
      ),
    ],
  ),
  // Login
  NamedRoute(
    route_names.login,
    path: '/login',
    builder: (context, state) =>
        LoginScreen(state.extra! as LoginCallback, key: state.pageKey),
  ),
  // Publish
  NamedRoute(
    route_names.publish,
    path: '/publish',
    builder: (context, state) => PublishMomentScreen(key: state.pageKey),
  ),
  // User Profile
  NamedRoute(
    route_names.userProfile,
    path: r'/users/:id(\w{64})',
    builder: (context, state) => UserProfileScreen(
      key: state.pageKey,
      userId: state.params['id']!,
    ),
  ),
  // Setting
  NamedRoute(
    route_names.setting,
    path: '/setting',
    builder: (context, state) => SettingScreen(key: state.pageKey),
    routes: <NamedRoute>[
      // Setting -> Edit Account data
      NamedRoute(
        route_names.settingEditAccount,
        path: 'edit',
        builder: (context, state) => EditAccountScreen(key: state.pageKey),
      ),
      // Setting -> Security
      NamedRoute(
        route_names.settingSecurity,
        path: 'security',
        builder: (context, state) => AccountSecurityScreen(key: state.pageKey),
        routes: <NamedRoute>[
          // Setting -> Security -> Password
          NamedRoute(
            route_names.settingSecurityPassword,
            path: 'password',
            builder: (context, state) => AccountSecurityUpdateFieldScreen(
              UserSecurityFields.password,
              key: state.pageKey,
            ),
          ),

          /// Setting -> Security -> Phone
          NamedRoute(
            route_names.settingSecurityPhone,
            path: 'phone',
            builder: (context, state) => AccountSecurityUpdateFieldScreen(
              UserSecurityFields.phone,
              key: state.pageKey,
            ),
          ),

          /// Setting -> Security -> E-Mail
          NamedRoute(
            route_names.settingSecurityEmail,
            path: 'email',
            builder: (context, state) => AccountSecurityUpdateFieldScreen(
              UserSecurityFields.email,
              key: state.pageKey,
            ),
          ),
        ],
      ),
    ],
  ),
];
