import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth.dart';
import 'theme.dart';

final _bootstrapProvider = FutureProvider<void>(
  (Ref ref) => Future.any<void>([
    ref.read(authProvider.notifier).load(),
    ref.read(themeProvider.notifier).load(),
  ]),
);

class AppNotifier extends StateNotifier<Key> {
  AppNotifier(this.ref) : super(UniqueKey());

  final Ref ref;

  void restart() => state = UniqueKey();

  Widget bootstrap({
    required Widget Function() builder,
    required Widget Function(Object, StackTrace?) error,
    required Widget Function() loading,
  }) {
    final AsyncValue<void> bootstrap = ref.watch(_bootstrapProvider);

    return bootstrap.when<Widget>(
      data: (_) => builder(),
      error: error,
      loading: loading,
    );
  }
}

final appProvider = StateNotifierProvider<AppNotifier, Key>(
  (Ref ref) => AppNotifier(ref),
);
