import 'package:flutter/material.dart';

class SocfonyTheme {
  const SocfonyTheme._();

  static ThemeData dark() {
    return ThemeData.dark();
  }

  static ThemeData light() {
    return ThemeData.light().copyWith(
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(const StadiumBorder()),
        ),
      ),
    );
  }
}
