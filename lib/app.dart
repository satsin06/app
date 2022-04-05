import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/app_key_provider.dart';
import 'providers/auth_provider.dart';
import 'providers/theme_provider.dart';
import 'route/route_names.dart';
import 'route/routes.dart';
import 'theme.dart';

class Application extends ConsumerStatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends ConsumerState<Application> {
  @override
  void initState() {
    super.initState();
    ref.read(loadThemeProvider);
    ref.read(loadAuthProvider);
  }

  @override
  Widget build(BuildContext context) {
    final SocfonyTheme theme =
        SocfonyTheme(ref.watch(themePrimaryColorProvider));

    return MaterialApp(
      key: ref.watch(appKeyProvider),
      themeMode: ref.watch(themeModeProvider),
      theme: theme.light,
      darkTheme: theme.dark,
      routes: routes,
      initialRoute: RouteNames.home,
      debugShowCheckedModeBanner: kDebugMode,
    );
  }
}
