import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

enum AppThemeMode { light, dark }

final StateProvider<AppThemeMode> themeModeProvider =
    StateProvider<AppThemeMode>((Ref<AppThemeMode> ref) => AppThemeMode.light);

final Provider<ThemeData> themeProvider =
    Provider<ThemeData>((Ref<ThemeData> ref) {
  final AppThemeMode mode = ref.watch(themeModeProvider);
  return mode == AppThemeMode.light ? defaultTheme : darkTheme;
});

final ColorScheme defaultColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromRGBO(234, 43, 121, 1),
  onPrimary: Color.fromRGBO(250, 250, 250, 1),
  secondary: Color.fromRGBO(242, 53, 76, 1),
  onSecondary: Color.fromRGBO(250, 250, 250, 1),
  error: Colors.limeAccent,
  onError: Colors.black,
  surface: Color.fromRGBO(255, 255, 255, 1),
  onSurface: Color.fromRGBO(30, 30, 30, 1),
  tertiary: Color.fromRGBO(242, 53, 76, 1),
  onTertiary: Color.fromRGBO(250, 250, 250, 1),
);

final defaultTextTheme = const TextTheme(
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
  displaySmall: TextStyle(
    fontFamily: "Baloo2",
    fontSize: 18,
    fontWeight: FontWeight.bold,
  ),
  titleLarge: TextStyle(
    fontFamily: "Baloo2",
    fontSize: 24,
    fontWeight: FontWeight.w600,
  ),
  titleMedium: TextStyle(
    fontFamily: "Baloo2",
    fontSize: 22,
    fontWeight: FontWeight.w600,
  ),
  titleSmall: TextStyle(
    fontFamily: "Baloo2",
    fontSize: 20,
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
  bodySmall: TextStyle(
    fontFamily: "IBMPlexSans",
    fontSize: 12,
  ),
  labelLarge: TextStyle(
    fontFamily: "IBMPlexSans",
    fontSize: 12,
    fontStyle: FontStyle.italic,
  ),
);

final InputDecorationTheme defaultInputDecorationTheme = InputDecorationTheme(
    hintStyle: defaultTextTheme.bodyMedium,
    filled: true,
    fillColor: Colors.grey,
    contentPadding:
        const EdgeInsets.only(left: 10, right: 10, bottom: 6, top: 6),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(30)),
    border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(30)),
    errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(30)),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(30),
    ),
    disabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.circular(30),
    ),
    outlineBorder:
        const BorderSide(color: Colors.grey, style: BorderStyle.none));

final ThemeData defaultTheme = ThemeData(
    inputDecorationTheme: defaultInputDecorationTheme,
    colorScheme: defaultColorScheme,
    textTheme: defaultTextTheme.apply(
      bodyColor: defaultColorScheme.onSurface,
      displayColor: defaultColorScheme.onSurface,
    ));

final ColorScheme darkColorScheme = const ColorScheme(
  brightness: Brightness.light,
  primary: Color.fromRGBO(234, 43, 121, 1),
  onPrimary: Color.fromRGBO(250, 250, 250, 1),
  secondary: Color.fromRGBO(242, 53, 76, 1),
  onSecondary: Color.fromRGBO(250, 250, 250, 1),
  error: Colors.limeAccent,
  onError: Colors.black,
  surface: Color.fromRGBO(30, 30, 30, 1),
  onSurface: Color.fromRGBO(255, 255, 255, 1),
  tertiary: Color.fromRGBO(242, 53, 76, 1),
  onTertiary: Color.fromRGBO(250, 250, 250, 1),
);

final ThemeData darkTheme = defaultTheme.copyWith(
    colorScheme: darkColorScheme,
    textTheme: defaultTextTheme.apply(
        bodyColor: darkColorScheme.onSurface,
        displayColor: darkColorScheme.onSurface));
