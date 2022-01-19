// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_state.dart';
import 'screens/home/home.dart';
import 'theme.dart';

void main() async {
  await AppState.loadTheme();

  runApp(ChangeNotifierProvider(
    create: (context) => AppState(),
    child: const SocfonyApp(),
  ));
}

class SocfonyApp extends StatelessWidget {
  const SocfonyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SocfonyTheme theme = SocfonyTheme(
      context.select<AppState, Color>((value) => value.themePrimaryColor),
    );
    final ThemeMode mode =
        context.select<AppState, ThemeMode>((value) => value.themeMode);

    return MaterialApp(
      key: context.select<AppState, Key>((value) => value.key),
      title: 'Socfony',
      theme: theme.light,
      darkTheme: theme.dark,
      themeMode: mode,
      home: const HomeScrren(),
    );
  }
}
