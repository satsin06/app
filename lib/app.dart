import 'package:flutter/cupertino.dart';
import 'package:socfony/screens/home/home.screen.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      home: HomeScreen(),
    );
  }

  void run() => runApp(this);
}
