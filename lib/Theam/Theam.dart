import 'package:flutter/material.dart';

ThemeData CustomeTheame(){
  return ThemeData(
    scaffoldBackgroundColor: const Color(0xFFFFF0F3),
    primaryColor: const Color(0xFFE91E63),
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFE91E63),
      brightness: Brightness.light,
      secondary: const Color(0xFFF48FB1),
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFE91E63),
      foregroundColor: Colors.white,
      elevation: 0,
    ),
    fontFamily: 'Poppins',
  );
}