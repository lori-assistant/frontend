import 'dart:ui';
import 'package:flutter/material.dart';

// Brand Color: Color(0xFF379A5D)

class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  // Adjusted font sizes for headings
  static const double h1 = 48.0; // 3rem
  static const double h2 = 36.0; // 2.25rem
  static const double h3 = 28.0; // 1.75rem
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
        fontVariations: fontVariationForWeight(FontWeight.w700),
      ),
      headline2: TextStyle(
        fontSize: h2,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontVariations: fontVariationForWeight(FontWeight.w600),
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
        fontVariations: fontVariationForWeight(FontWeight.w700),
      ),
      headline2: TextStyle(
        fontSize: h2,
        fontFamily: 'Inter',
        color: Color(0xFFEEEEEE),
        fontVariations: fontVariationForWeight(FontWeight.w600),
      ),
      // ... [Other styles with fontVariations applied]
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF245668),
    ),
  );
}
