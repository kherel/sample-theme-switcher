import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData.light();

ThemeData darkTheme = ThemeData.dark();

ThemeData nebrassLightTheme = lightTheme.copyWith(
  primaryColor: const Color(0xFF677493),
  accentColor: const Color(0xFF525D76),
  canvasColor: Colors.transparent,
  buttonColor: const Color(0xFF3A455C),
  scaffoldBackgroundColor: Color(0xFFFAF8F0),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF24737c),
    backgroundColor: Color(0xFFA6E0DE),
  ),
  textTheme: const TextTheme(
      headline6: TextStyle(fontFamily: 'IranSansLight', color: Colors.black87),
      caption: TextStyle(fontFamily: 'IranSansLight', color: Colors.black87),
      overline: TextStyle(fontFamily: 'IranSansLight', color: Colors.black87),
  ),
);

ThemeData nebrassDarkTheme = darkTheme.copyWith(
  primaryColor: const Color(0xFF1E1E2C),
  accentColor: const Color(0xFF525D76),
  canvasColor: Colors.transparent,
  buttonColor: const Color(0xFF3A455C),
  scaffoldBackgroundColor: Color(0xFF2D2D44),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    foregroundColor: Color(0xFF24737c),
    backgroundColor: Color(0xFFA6E0DE),
  ),
  textTheme: const TextTheme(
    headline6: TextStyle(fontFamily: 'IranSansLight', color: Colors.black87),
    caption: TextStyle(fontFamily: 'IranSansLight', color: Colors.black87),
    overline: TextStyle(fontFamily: 'IranSansLight', color: Colors.black87),
  ),
);
