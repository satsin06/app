import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final Color primaryColor = const Color(0xFF5E6CE7);

final TextTheme _$TextTheme = TextTheme(
  headline1: GoogleFonts.lato(
      fontSize: 101, fontWeight: FontWeight.w300, letterSpacing: -1.5),
  headline2: GoogleFonts.lato(
      fontSize: 63, fontWeight: FontWeight.w300, letterSpacing: -0.5),
  headline3: GoogleFonts.lato(fontSize: 50, fontWeight: FontWeight.w400),
  headline4: GoogleFonts.lato(
      fontSize: 36, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  headline5: GoogleFonts.lato(fontSize: 25, fontWeight: FontWeight.w400),
  headline6: GoogleFonts.lato(
      fontSize: 21, fontWeight: FontWeight.w500, letterSpacing: 0.15),
  subtitle1: GoogleFonts.lato(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.15),
  subtitle2: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 0.1),
  bodyText1: GoogleFonts.lato(
      fontSize: 17, fontWeight: FontWeight.w400, letterSpacing: 0.5),
  bodyText2: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: 0.25),
  button: GoogleFonts.lato(
      fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: 1.25),
  caption: GoogleFonts.lato(
      fontSize: 13, fontWeight: FontWeight.w400, letterSpacing: 0.4),
  overline: GoogleFonts.lato(
      fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
);

final TabBarTheme _tabBarTheme = TabBarTheme(
  labelColor: primaryColor,
  unselectedLabelColor: Colors.black87,
  // indicator: CustomUnderlineTabIndicator(
  //   borderSide: BorderSide(
  //     color: primaryColor,
  //     width: 3.0,
  //   ),
  //   insets: EdgeInsets.only(bottom: 4.0),
  // ),
  indicatorSize: TabBarIndicatorSize.label,
);

final BottomNavigationBarThemeData _$bottomNavigationBarTheme =
    BottomNavigationBarThemeData(
  type: BottomNavigationBarType.fixed,
  selectedItemColor: primaryColor,
);

final ButtonThemeData _$buttonTheme = ButtonThemeData(
  buttonColor: primaryColor,
  textTheme: ButtonTextTheme.primary,
  shape: const StadiumBorder(),
);

class SocfonyTheme {
  const SocfonyTheme._();

  static ThemeData dark() {
    final TextTheme textTheme = _$TextTheme.apply(bodyColor: Colors.white);
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      accentColor: primaryColor,
      buttonColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        brightness: Brightness.dark,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        textTheme: textTheme,
      ),
      buttonTheme: _$buttonTheme,
      tabBarTheme: _tabBarTheme.copyWith(
        unselectedLabelColor: Colors.white,
      ),
      textTheme: textTheme,
      bottomNavigationBarTheme: _$bottomNavigationBarTheme,
    );
  }

  static ThemeData light() {
    final TextTheme textTheme = _$TextTheme.apply(bodyColor: Colors.black);
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        brightness: Brightness.light,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
        textTheme: textTheme,
      ),
      buttonColor: primaryColor,
      buttonTheme: _$buttonTheme,
      tabBarTheme: _tabBarTheme,
      textTheme: textTheme,
      bottomNavigationBarTheme: _$bottomNavigationBarTheme,
    );
  }
}
