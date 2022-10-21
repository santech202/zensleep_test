import 'package:flutter/material.dart';

class Styles {
  static const Color deepPurpleColor = Color(0xff251c5e);
  static const Color darkPurpleColor = Color(0xff332389);
  static const Color moonColor = Color(0xff4939a8);
  static const Color calmVioletColor = Color(0xffada7ef);
  static const Color blueMistColor = Color(0xff9accef);
  static const Color offWhiteColor = Color(0xfffefdfa);
  static const Color lightTanColor = Color(0xfffff3c8);
  static const Color tanColor = Color(0xffecdca6);
  static const Color sunColor = Color(0xffffe177);
  static const Color lightWhiteColor = Color(0xfffffbf2);
  static const Color smallWhiteColor = Color(0xfff5f5f5);
  static const Color greenColor = Color(0xffC3FD73);
  static const Color lightBlueColor = Color(0xff68C1F9);
  static const Color deepTanColor = Color(0xffED774D);

  static TextTheme darkTextTheme = const TextTheme(
    headline1: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: lightWhiteColor,
        fontSize: 42),
    headline2: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: lightWhiteColor,
        fontSize: 30),
    headline3: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: lightWhiteColor,
      fontSize: 20,
    ),
    headline4: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: lightWhiteColor,
        fontSize: 16),
    bodyText1: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: lightWhiteColor,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: lightWhiteColor,
      fontSize: 10,
    ),
  );

  static TextTheme lightTextTheme = const TextTheme(
    headline1: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: deepPurpleColor,
        fontSize: 42),
    headline2: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: deepPurpleColor,
        fontSize: 30),
    headline3: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: deepPurpleColor,
      fontSize: 20,
    ),
    headline4: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        color: deepPurpleColor,
        fontSize: 16),
    bodyText1: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      color: deepPurpleColor,
      fontSize: 12,
    ),
    bodyText2: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      color: deepPurpleColor,
      fontSize: 10,
    ),
  );

  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
      primaryColor: isDarkTheme ? lightWhiteColor : deepPurpleColor,
      backgroundColor: isDarkTheme ? deepPurpleColor : smallWhiteColor,
      indicatorColor: isDarkTheme ? sunColor : moonColor,
      hintColor: isDarkTheme ? lightWhiteColor : deepPurpleColor,
      disabledColor: Colors.grey,
      canvasColor: isDarkTheme ? deepPurpleColor : lightWhiteColor,
      cardColor: isDarkTheme ? moonColor : sunColor,
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      textTheme: isDarkTheme ? darkTextTheme : lightTextTheme,
    );
  }
}
