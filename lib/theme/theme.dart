import 'dart:convert';

import 'package:flutter/material.dart' hide Theme;
import 'package:json_annotation/json_annotation.dart';

part 'theme.g.dart';

class _ColorConverter implements JsonConverter<Color, int> {
  const _ColorConverter();

  @override
  Color fromJson(int json) {
    return Color(json);
  }

  @override
  int toJson(Color object) {
    return object.value;
  }
}

ColorScheme _colorSchemeGenerator(Brightness brightness, Color primaryColor) {
  final bool isDark = brightness == Brightness.dark;
  final bool primaruIsDark =
      ThemeData.estimateBrightnessForColor(primaryColor) == Brightness.dark;
  final Color onPrimaryColor = primaruIsDark ? Colors.white : Colors.black;
  final Color onDarkColor = isDark ? Colors.white : Colors.black;

  return ColorScheme(
    brightness: brightness,
    primary: primaryColor,
    secondary: primaryColor,
    surface: isDark ? const Color(0xFF1A1A1C) : Colors.white,
    background: isDark ? Colors.black : const Color(0xFFF0F0F6),
    error: Colors.red,
    onBackground: onDarkColor,
    onError: onDarkColor,
    onPrimary: onPrimaryColor,
    onSecondary: onPrimaryColor,
    onSurface: onDarkColor,
  );
}

ThemeData _themeDateGenerator(Brightness brightness, Color primaryColor) {
  final ColorScheme colorScheme =
      _colorSchemeGenerator(brightness, primaryColor);

  return ThemeData(
    fontFamily: "MiSans",
    brightness: brightness,
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    backgroundColor: colorScheme.background,
    scaffoldBackgroundColor: colorScheme.background,
    cardColor: colorScheme.surface,
    toggleableActiveColor: colorScheme.primary,
    appBarTheme: AppBarTheme(
      elevation: 0,
      backgroundColor: colorScheme.surface,
      foregroundColor: colorScheme.onSurface,
      centerTitle: true,
      iconTheme: IconThemeData(color: colorScheme.onSurface),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: colorScheme.onSurface,
      unselectedLabelColor: colorScheme.onSurface,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: colorScheme.primary,
            width: 2,
          ),
        ),
        shape: BoxShape.rectangle,
      ),
      indicatorSize: TabBarIndicatorSize.label,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.surface,
      selectedItemColor: colorScheme.primary,
      unselectedItemColor: colorScheme.onSurface,
      type: BottomNavigationBarType.shifting,
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: MaterialStateProperty.all<Color>(colorScheme.onPrimary),
      fillColor: MaterialStateProperty.all<Color>(colorScheme.primary),
    ),
    cardTheme: CardTheme(
      color: colorScheme.surface,
      shadowColor: colorScheme.onSurface,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    ),
  );
}

@JsonSerializable()
class Theme {
  final ThemeMode mode;

  @_ColorConverter()
  final Color primaryColor;

  const Theme({
    this.mode = ThemeMode.system,
    this.primaryColor = const Color(0xff5e6ce7),
  });

  factory Theme.fromJson(Map<String, dynamic> json) => _$ThemeFromJson(json);

  // From string
  factory Theme.fromString(String? json) {
    try {
      return Theme.fromJson(jsonDecode(json!));
    } catch (e) {
      return const Theme();
    }
  }

  Map<String, dynamic> toJson() => _$ThemeToJson(this);

  @override
  String toString() => jsonEncode(toJson());

  Theme copyWith({
    ThemeMode? mode,
    Color? primaryColor,
  }) =>
      Theme(
        mode: mode ?? this.mode,
        primaryColor: primaryColor ?? this.primaryColor,
      );

  @override
  int get hashCode => mode.hashCode ^ primaryColor.value.hashCode;

  @override
  bool operator ==(Object other) => hashCode == other.hashCode;

  // Light theme data
  ThemeData get lightThemeData =>
      _themeDateGenerator(Brightness.light, primaryColor);

  // Dark theme data
  ThemeData get darkThemeData =>
      _themeDateGenerator(Brightness.dark, primaryColor);
}
