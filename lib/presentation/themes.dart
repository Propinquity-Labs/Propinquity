import "package:flutter/material.dart";

final ThemeData defaultTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color.fromRGBO(255, 255, 255, 1),
    onPrimary: Color.fromRGBO(30, 30, 30, 1),
    secondary: Color.fromRGBO(234, 43, 121, 1),
    onSecondary: Color.fromRGBO(250, 250, 250, 1),
    error: Colors.limeAccent,
    onError: Colors.black,
    surface: Color.fromRGBO(255, 255, 255, 1),
    onSurface: Color.fromRGBO(30, 30, 30, 1),
    tertiary: Color.fromRGBO(242, 53, 76, 1),
    onTertiary: Color.fromRGBO(250, 250, 250, 1),
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontFamily: "Baloo2",
      fontSize: 32,
      fontWeight: FontWeight.bold,
    ),
    displayMedium: TextStyle(
      fontFamily: "Baloo2",
      fontSize: 28,
      fontWeight: FontWeight.bold,
    ),
    titleLarge: TextStyle(
      fontFamily: "Baloo2",
      fontSize: 22,
      fontWeight: FontWeight.w600,
    ),
    bodyLarge: TextStyle(
      fontFamily: "IBMPlexSans",
      fontSize: 16,
    ),
    bodyMedium: TextStyle(
      fontFamily: "IBMPlexSans",
      fontSize: 14,
    ),
    labelLarge: TextStyle(
      fontFamily: "IBMPlexSans",
      fontSize: 12,
      fontStyle: FontStyle.italic,
    ),
  ),
);

final darkTheme = ThemeData();
