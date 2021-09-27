import 'package:flutter/material.dart';

import 'router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socfony',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFF5E6CE7),
        appBarTheme: const AppBarTheme(
          color: Color(0xFF5E6CE7),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF5E6CE7),
          ),
        ),
      ),
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
