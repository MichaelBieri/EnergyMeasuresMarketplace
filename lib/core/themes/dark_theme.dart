import 'package:flutter/material.dart';

ThemeData getDarkTheme() {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.dark),
    useMaterial3: true,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.deepPurple.shade900,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 50),
        elevation: 7,
      ),
    ),
    appBarTheme: AppBarTheme(
      //appBarTheme ist das Attribut, AppBarTheme ist das Objekt
      color: Colors.deepPurple.shade200,
      elevation: 4,
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.deepPurple.shade500,
      elevation: 3,
    ),
    brightness: Brightness.dark
  );
}
