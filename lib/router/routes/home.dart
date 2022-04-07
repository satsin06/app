import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../screens/home/home.dart';

Widget Function(BuildContext, GoRouterState) _createBuilder(HomeScreenTab tab) {
  return (BuildContext context, GoRouterState state) {
    return HomeScreen(
      tab: tab,
      key: state.pageKey,
    );
  };
}

const Map<HomeScreenTab, String> _homeRoutePathMap = {
  HomeScreenTab.timeline: '/',
  HomeScreenTab.follow: '/follow',
};

class _HomeRoute extends GoRoute {
  _HomeRoute(this.tab)
      : super(
          path: _homeRoutePathMap[tab]!,
          builder: _createBuilder(tab),
        );

  final HomeScreenTab tab;

  @override
  String get name => 'home:${tab.name}';

  void go<T extends Object>(BuildContext context) =>
      GoRouter.of(context).goNamed(name);
}

final _HomeRoute homeTimelineRoute = _HomeRoute(HomeScreenTab.timeline);
final _HomeRoute homeFollowRoute = _HomeRoute(HomeScreenTab.follow);
