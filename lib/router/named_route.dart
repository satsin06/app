import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

typedef RoutePageBuilder = Page<void> Function(BuildContext, GoRouterState);
typedef RouteWidgetBuilder = Widget Function(BuildContext, GoRouterState);
typedef RouterRedirect = String? Function(GoRouterState);

class NamedRoute extends GoRoute {
  NamedRoute(
    String name, {
    required String path,
    RoutePageBuilder? pageBuilder,
    RouteWidgetBuilder builder = _invalidBuilder,
    List<NamedRoute> routes = const <NamedRoute>[],
    RouterRedirect redirect = _noRedirection,
  }) : super(
          path: path,
          name: name,
          pageBuilder: pageBuilder,
          builder: builder,
          routes: routes,
          redirect: redirect,
        );

  @override
  String get name => super.name!;

  static String? _noRedirection(GoRouterState state) => null;

  static Widget _invalidBuilder(
    BuildContext context,
    GoRouterState state,
  ) =>
      const SizedBox.shrink();
}
