import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'provider/provider.dart';
import 'provider/states/app_key.dart';
import 'provider/states/app_theme.dart';
import 'route/route_names.dart';
import 'route/routes.dart';
import 'theme.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderWrapper(
      child: _ConfiguredApp(),
    );
  }
}

class _ConfiguredApp extends StatelessWidget {
  const _ConfiguredApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Watch the Key value.
    final AppKeyState keyState = context.watch<AppKeyState>();

    // Watch the app theme state.
    final AppThemeState themeState = context.watch<AppThemeState>();

    // Create the app theme.
    final SocfonyTheme theme = SocfonyTheme(themeState.primaryColor);

    return MaterialApp(
      key: keyState.value,
      themeMode: themeState.mode,
      theme: theme.light,
      darkTheme: theme.dark,
      routes: routes,
      initialRoute: RouteNames.home,
    );
  }
}
