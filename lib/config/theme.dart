import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  colorScheme: const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFEB4A5A),
      onPrimary: Color(0xFFF7F8F8),
      secondary: Colors.black,
      onSecondary: Color(0xFFF7F8F8),
      background: Color(0xFFF7F8F8),
      onBackground: Colors.black,
      error: Color(0xFFEB4A5A),
      onError: Color(0xFFF7F8F8),
      surface: Color(0xFFF7F8F8),
      onSurface: Color(0xFFCFCFCF),
  ),
  fontFamily: 'Amiri',
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
        fontSize: 26.0,
        fontWeight: FontWeight.bold,
        color: Colors.black),
    headlineMedium: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: Colors.black),
    bodyLarge: TextStyle(fontSize: 20.0, color: Color(0xFF3C3C3E)),
    bodyMedium: TextStyle(fontSize: 16.0, color: Color(0xFF3C3C3E)),
    bodySmall: TextStyle(fontSize: 12.0, color: Color(0xFF3C3C3E)),
  ),
  scaffoldBackgroundColor: const Color(0xFFF7F8F8),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    color: Color(0xFFF7F8F8),
    elevation: 0,
  ),
  bottomSheetTheme: const BottomSheetThemeData(backgroundColor:Colors.transparent),
  progressIndicatorTheme: const ProgressIndicatorThemeData(color: Color(0xFFEB4A5A)),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(backgroundColor: Color(0xFFEB4A5A))
);