import 'package:flutter/material.dart';

import 'router.dart';
import 'theme_data.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Socfony',
      theme: themeData,
      darkTheme: darkThemeData,
      routes: routes,
      initialRoute: initialRoute,
    );
  }
}
