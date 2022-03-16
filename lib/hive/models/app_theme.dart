import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'app_theme.g.dart';

@HiveType(typeId: 2)
class AppTheme {
  @HiveField(0)
  int _primaryColor = 0xff5e6ce7;

  Color get primaryColor => Color(_primaryColor);
  set primaryColor(Color primaryColor) => _primaryColor = primaryColor.value;

  @HiveField(1)
  int _mode = 0;

  ThemeMode get mode => ThemeMode.values.elementAt(_mode);
  set mode(ThemeMode mode) => _mode = mode.index;
}
