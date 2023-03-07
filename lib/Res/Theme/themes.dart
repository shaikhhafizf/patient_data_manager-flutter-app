import 'package:flutter/material.dart';

class Themes {
  static const Color primaryColor = Color(0xFF023E73);
  static const Color accentColor = Color(0xFF88DFF2);
  static const Color backgroundColor = Color(0xFFF5F5F5);

  static final ThemeData lightTheme = ThemeData.light().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      secondary: accentColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ).copyWith(background: backgroundColor),
  );

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white, fontSize: 32.0),
      bodyMedium: TextStyle(color: Colors.white, fontSize: 24.0),
      bodySmall: TextStyle(color: Colors.white, fontSize: 16.0),
    ),
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: accentColor,
      onPrimary: Colors.white,
      onSecondary: Colors.black,
    ).copyWith(background: backgroundColor),
  );
}
