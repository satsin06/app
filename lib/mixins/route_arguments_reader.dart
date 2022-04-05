import 'package:flutter/material.dart';

mixin RouteArgumentsReader<T extends Object> {
  T getRouteArguments(BuildContext context) =>
      ModalRoute.of(context)?.settings.arguments as T;
}

mixin StateRouteArgumentsReader<T extends Object, W extends StatefulWidget>
    on State<W> {
  T get routeArguments => ModalRoute.of(context)?.settings.arguments as T;
}
