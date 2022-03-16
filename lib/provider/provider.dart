import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'states/app_key.dart';
import 'states/app_theme.dart';

class ProviderWrapper extends StatelessWidget {
  const ProviderWrapper({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: child,
    );
  }

  List<SingleChildWidget> get providers {
    return [
      ChangeNotifierProvider(create: (_) => AppKeyState()),
      FutureProvider(
        create: AppThemeState.create,
        initialData: AppThemeState(),
        catchError: (_, e) {
          print(e);
        },
      )
    ];
  }
}
