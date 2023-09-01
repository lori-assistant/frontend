import 'dart:ui';

import 'package:flutter/material.dart';

// Brand Color: Color(0xFF379A5D)

class AppTheme {
  // Private constructor to prevent instantiation.
  AppTheme._();

  // Light ThemeData
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    textTheme: TextTheme(
        bodyText2: TextStyle(
        fontSize: 16.0,
        fontFamily: 'Inter',
        color: Color(0xCC000000),
        fontWeight: FontWeight.w400,
        ),
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
        // Replaces the fontWeight property
        fontVariations: [
          FontVariation(
            'wght',
            ((FontWeight.w400.index + 1) * 100).toDouble(),
          )
        ],
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Color(0xFF245668),
    ),
  );
}
