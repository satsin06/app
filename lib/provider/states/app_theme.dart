import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../hive/hive.dart';
import '../../hive/models/app_theme.dart';

const String _appThemeBoxName = r'app_theme';

class AppThemeState extends ChangeNotifier {
  AppTheme _theme = AppTheme();

  Color get primaryColor => _theme.primaryColor;
  ThemeMode get mode => _theme.mode;

  /// Update [AppTheme] and store it in [Hive].
  /// If [AppTheme] is not stored in [Hive], it will be stored.
  ///
  /// [update] - [AppTheme] to update.
  Future<void> update(void Function(AppTheme) update) async {
    // Get the [Box] for [AppTheme].
    final Box<AppTheme> box = await getHiveBox<AppTheme>(_appThemeBoxName);

    // Create a new [AppTheme] and update it.
    final AppTheme theme = AppTheme()
      ..mode = _theme.mode
      ..primaryColor = _theme.primaryColor;
    update.call(_theme);

    // Update the [Box] with the new [AppTheme].
    await box.put(_appThemeBoxName, _theme = theme);

    // Notify listeners.
    notifyListeners();
  }

  /// Get the [AppThemeState] from [Hive].
  static Future<AppThemeState> create(BuildContext context) async {
    // Create a new [AppThemeState] and initialize it.
    final AppThemeState state = AppThemeState();

    // Get the [Box] for [AppTheme].
    final Box<AppTheme> box = await getHiveBox<AppTheme>(_appThemeBoxName);

    // Get the [AppTheme] from the [Box].
    final AppTheme cachedTheme = box.get(_appThemeBoxName) ?? AppTheme();

    // Update the [AppThemeState] with the [AppTheme].
    state.update((theme) {
      theme
        ..mode = cachedTheme.mode
        ..primaryColor = cachedTheme.primaryColor;
    });

    return state;
  }
}
