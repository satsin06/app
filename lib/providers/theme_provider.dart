import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

import '../models/setting.dart';
import 'isar_provider.dart';

final themeModeProvider = StateProvider(
  (ref) => ThemeMode.system,
  name: 'Theme Mode',
);

final themePrimaryColorProvider = StateProvider(
  (ref) => const Color(0xff5e6ce7),
  name: 'Theme Primary Color',
);

final loadThemeProvider = FutureProvider<void>(
  (Ref ref) async {
    final isar = await ref.read(isarProvider.future);

    isar.settings
        .where()
        .keyEqualTo(themeModeProvider.name!)
        .or()
        .keyEqualTo(themePrimaryColorProvider.name!)
        .build()
        .watch(initialReturn: true)
        .listen((event) {
      for (Setting setting in event) {
        if (setting.key == themeModeProvider.name) {
          ref.read(themeModeProvider.notifier).state =
              ThemeMode.values[setting.value as int];
        } else if (setting.key == themePrimaryColorProvider.name) {
          ref.read(themePrimaryColorProvider.notifier).state =
              Color(setting.value as int);
        }
      }
    });
  },
);
