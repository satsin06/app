import 'package:flutter/cupertino.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.quote_bubble),
            activeIcon: Icon(CupertinoIcons.quote_bubble_fill),
            label: '动态',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rocket),
            activeIcon: Icon(CupertinoIcons.rocket_fill),
            label: '社区',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.chat_bubble_2),
            activeIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
            label: '消息',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt_circle),
            activeIcon: Icon(CupertinoIcons.person_alt_circle_fill),
            label: '我的',
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return const CupertinoPageScaffold(
          child: Center(
            child: Text('Home'),
          ),
        );
      },
    );
  }
}