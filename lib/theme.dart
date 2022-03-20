// Copyright (c) 2021, Odroe Inc. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class SocfonyTheme {
  const SocfonyTheme(this.primaryColor);

  final Color primaryColor;

  ColorScheme colorSchemeGenerator(Brightness brightness) {
    final bool isDark = brightness == Brightness.dark;
    final bool primaruIsDark =
        ThemeData.estimateBrightnessForColor(primaryColor) == Brightness.dark;
    final Color onPrimaryColor = primaruIsDark ? Colors.white : Colors.black;
    final Color onDarkColor = isDark ? Colors.white : Colors.black;

    return ColorScheme(
      brightness: brightness,
      primary: primaryColor,
      secondary: primaryColor,
      surface: isDark ? Colors.black : Colors.white,
      background: isDark ? Colors.black : Colors.white,
      error: Colors.red,
      onBackground: onDarkColor,
      onError: onDarkColor,
      onPrimary: onPrimaryColor,
      onSecondary: onPrimaryColor,
      onSurface: onDarkColor,
    );
  }

  ThemeData themeGenerator(Brightness brightness) {
    final ColorScheme colorScheme = colorSchemeGenerator(brightness);

    return ThemeData(
      fontFamily: "MiSans",
      brightness: brightness,
      colorScheme: colorScheme,
      primaryColor: colorScheme.primary,
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

  ThemeData get light => themeGenerator(Brightness.light);
  ThemeData get dark => themeGenerator(Brightness.dark);
}
