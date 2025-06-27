import 'package:flutter/material.dart';
import 'package:json_app/app/enum/enum.dart';

ThemeData primaryThemeData = ThemeData(
  fontFamily: 'roboto',
  colorScheme: const ColorScheme(
    primary: Colors.black,
    secondary: Colors.black,
    error: Colors.red,
    surface: Colors.black,
    onError: Colors.red,
    outline: Colors.black,
    outlineVariant: Colors.black,
    onPrimary: Colors.black,
    onSecondary: Colors.black,
    onSurface: Colors.black,
    brightness: Brightness.dark,
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.red, // Background branco
    hintStyle: const TextStyle(
      color: Colors.grey,
    ), // Cor do hint (texto de dica)
    labelStyle: const TextStyle(color: Colors.black), // Cor do label (rótulo)
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(20.0),
      borderSide: const BorderSide(color: Colors.black),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black),
    ),
  ),
  scaffoldBackgroundColor: AppColors.background,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Colors.black,

      side: const BorderSide(color: Colors.black), // Borda do botão
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
    ),
  ),
);
