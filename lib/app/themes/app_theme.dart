import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {

  static const Color primary = Color(0xFF0F4C81); // deep blue
  static const Color accent = Color(0xFFFF8A00); // warm orange
  static const Color bg = Color(0xFFF6F8FB);

  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: bg,
    primaryColor: primary,
    colorScheme: ColorScheme.fromSeed(seedColor: primary),
    textTheme: GoogleFonts.poppinsTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12)
        ),
        elevation: 2,
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),

  );
}
