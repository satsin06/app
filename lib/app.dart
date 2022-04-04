import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/app_key_provider.dart';
import 'providers/theme_provider.dart';
import 'route/route_names.dart';
import 'route/routes.dart';
import 'theme.dart';

class Application extends ConsumerWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(loadThemeProvider);
    final mode = ref.watch(themeModeProvider);
    final primaryColor = ref.watch(themePrimaryColorProvider);
    final appKey = ref.watch(appKeyProvider);

    final SocfonyTheme theme = SocfonyTheme(primaryColor);

    return MaterialApp(
      key: appKey,
      themeMode: mode,
      theme: theme.light,
      darkTheme: theme.dark,
      routes: routes,
      initialRoute: RouteNames.login,
    );
  }
}
