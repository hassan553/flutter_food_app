import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.cyan.shade800,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 0,
          selectedItemColor: AppColors.red,
          unselectedItemColor: Colors.white,
        ),
        primaryColor: AppColors.black,
        textTheme: TextTheme(
          titleSmall: GoogleFonts.roboto(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.roboto(
            color: Colors.white,
          ),
          displayLarge: GoogleFonts.roboto(
            color: Colors.red,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.cyan.shade800,
          elevation: 0,
          iconTheme: IconThemeData(
            color: AppColors.pink,
          ),
        ),
        iconTheme: IconThemeData(color: AppColors.white),
        scaffoldBackgroundColor: Colors.cyan.shade800);
  }

  static ThemeData darkTheme() {
    return ThemeData(
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: const Color(0xFF00001a),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: 0,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.grey,
      ),
      primaryColor: AppColors.black,
      textTheme: TextTheme(
        titleSmall: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: 15,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: GoogleFonts.roboto(
          color: Colors.white,
        ),
        displayLarge: GoogleFonts.roboto(
          color: Colors.red,
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
      ),
      iconTheme: IconThemeData(color: AppColors.white),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF00001a),
        elevation: 0,
        iconTheme: IconThemeData(
          color: AppColors.white,
        ),
      ),
      scaffoldBackgroundColor: const Color(0xFF00001a),
    );
  }
}
