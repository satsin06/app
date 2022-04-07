import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide Theme;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'providers/app.dart';
import 'providers/theme.dart';
import 'router/router.dart';
import 'theme/theme.dart';
import 'widgets/ghost_screen.dart';

class Application extends ConsumerWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppNotifier notifier = ref.watch(appProvider.notifier);

    return notifier.bootstrap(
      builder: _MainApp.builder,
      error: _ErrorApp.builder,
      loading: _LoadingApp.builder,
    );
  }
}

class _MainApp extends ConsumerWidget {
  const _MainApp.builder();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Key key = ref.watch(appProvider);
    final Theme theme = ref.watch(themeProvider);
    return MaterialApp.router(
      key: key,
      themeMode: theme.mode,
      theme: theme.lightThemeData,
      darkTheme: theme.darkThemeData,
      debugShowCheckedModeBanner: kDebugMode,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
    );
  }
}

class _DefaultApp extends ConsumerWidget {
  const _DefaultApp({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return MaterialApp(
      themeMode: theme.mode,
      theme: theme.lightThemeData,
      darkTheme: theme.darkThemeData,
      home: child,
    );
  }
}

class _ErrorApp extends StatelessWidget {
  const _ErrorApp.builder(this.error, this.stack);

  final Object error;
  final StackTrace? stack;

  @override
  Widget build(BuildContext context) {
    return const _DefaultApp(
      child: GhostScreen(
        messageText: '应用启动失败',
        buttonText: '关闭应用',
        buttonLocation: FloatingActionButtonLocation.centerDocked,
        onButtonPressed: _exitApp,
      ),
    );
  }

  static Never _exitApp(BuildContext context) {
    exit(0);
  }
}

class _LoadingApp extends StatelessWidget {
  const _LoadingApp.builder();

  @override
  Widget build(BuildContext context) {
    return const _DefaultApp(
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
