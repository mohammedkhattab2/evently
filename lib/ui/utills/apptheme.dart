import 'package:evently/ui/utills/appcolor.dart';
import 'package:flutter/material.dart';

abstract final class AppTheme {
  static final TextTheme _lightTextTheme = TextTheme(
    titleSmall: const TextStyle(
      fontSize: 16,
      color: Appcolor.gray,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: Appcolor.blue,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: Appcolor.blue,
      fontWeight: FontWeight.w500,
    ),
  );
  static final TextTheme _darkTextTheme = TextTheme(
    titleSmall: const TextStyle(
      fontSize: 16,
      color: Appcolor.offwhite,
      fontWeight: FontWeight.w500,
    ),
    labelMedium: TextStyle(
      fontSize: 16,
      color: Appcolor.blue,
      fontWeight: FontWeight.w700,
    ),
    titleMedium: TextStyle(
      fontSize: 20,
      color: Appcolor.blue,
      fontWeight: FontWeight.w500,
    ),
  );

  static final lightDefultTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Colors.grey),
  );
  static final darkDefultTextBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: BorderSide(color: Appcolor.blue),
  );
  static ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Appcolor.white,
    primaryColor: Appcolor.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Appcolor.blue),
    textTheme: _lightTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Appcolor.blue),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: lightDefultTextBorder,
      focusedBorder: lightDefultTextBorder,
      enabledBorder: lightDefultTextBorder,
      hintStyle: _lightTextTheme.titleSmall,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolor.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Appcolor.white,
    primaryColor: Appcolor.blue,
    colorScheme: ColorScheme.fromSeed(seedColor: Appcolor.blue),
    textTheme: _darkTextTheme,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(backgroundColor: Appcolor.blue),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Appcolor.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: darkDefultTextBorder,
      focusedBorder: darkDefultTextBorder,
      enabledBorder: darkDefultTextBorder,
      hintStyle: _darkTextTheme.titleSmall,
    ),
  );
}
