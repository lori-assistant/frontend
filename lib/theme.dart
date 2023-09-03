import 'dart:ui';
import 'package:flutter/material.dart';

// Brand Color: Color(0xFF379A5D)

class AppColors {
  // Common colors
  static const brandColor = Color(0xFF379A5D);
  static const primaryColor = AppColors.brandColor;
  static const secondaryColor = Color(0xFF8CBE82);
  static const errorColor = Color(0xFFD32F2F);
  static const infoColor = Color(0xFF1976D2);
  static const warningColor = Color(0xFFFFA000);
  static const successColor = Color(0xFF388E3C);

  // Light theme colors
  static const lightBackground = Colors.white;
  static const lightSurface = Color(0xFFF5F5F5);
  static const lightPrimaryText = Color(0xFF212121);
  static const lightSecondaryText = Color(0xFF757575);
  static const lightDivider = Color(0xFFBDBDBD);

  // Dark theme colors
  static const darkBackground = Color(0xFF121212);
  static const darkSurface = Color(0xFF1F1F1F);
  static const darkPrimaryText = Colors.white;
  static const darkSecondaryText = Color(0xFFB0B0B0);
  static const darkDivider = Color(0xFF444444);
}

class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  // Adjusted font sizes for headings
  static const double h1 = 42.0; // 3rem
  static const double h2 = 32.0; // 2.25rem
  static const double h3 = 26.0; // 1.75rem
  static const double h4 = 22.0; // 1.375rem
  static const double h5 = 18.0; // 1.125rem
  static const double h6 = 16.0; // 1rem

  static List<FontVariation> fontVariationForWeight(FontWeight weight) {
    return [
      FontVariation(
        'wght',
        ((weight.index + 1) * 100).toDouble(),
      ),
    ];
  }

  // Light ThemeData
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w400),
      ),
      headline1: TextStyle(
        fontSize: h1,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline2: TextStyle(
        fontSize: h2,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline3: TextStyle(
        fontSize: h3,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline4: TextStyle(
        fontSize: h4,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline5: TextStyle(
        fontSize: h5,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline6: TextStyle(
        fontSize: h6,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      // ... [Other styles with fontVariations applied]
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
    ),
  );

  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    textTheme: TextTheme(
      bodyText2: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w400),
      ),
      headline1: TextStyle(
        fontSize: h1,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline2: TextStyle(
        fontSize: h2,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline3: TextStyle(
        fontSize: h3,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline4: TextStyle(
        fontSize: h4,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline5: TextStyle(
        fontSize: h5,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      headline6: TextStyle(
        fontSize: h6,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w500),
      ),
      // ... [Other styles with fontVariations applied]
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF245668),
    ),
  );
}
