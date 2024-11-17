import 'package:flutter/material.dart';

class ThemeConfig {
  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'Helvetica',
      textTheme: const TextTheme(
        bodyLarge: TextStyle(fontFamily: 'Helvetica', fontSize: 24, fontWeight: FontWeight.normal, color: Colors.black),
        bodyMedium: TextStyle(fontFamily: 'Helvetica', fontSize: 18, fontWeight: FontWeight.normal, color: Colors.black),
        bodySmall: TextStyle(fontFamily: 'Helvetica', fontSize: 14, fontWeight: FontWeight.normal, color: Colors.black),
        headlineLarge: TextStyle(fontFamily: 'Helvetica', fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
        headlineMedium: TextStyle(fontFamily: 'Helvetica', fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        headlineSmall: TextStyle(fontFamily: 'Helvetica', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        titleLarge: TextStyle(fontFamily: 'Helvetica', fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        titleMedium: TextStyle(fontFamily: 'Helvetica', fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
        titleSmall: TextStyle(fontFamily: 'Helvetica', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
        displayLarge: TextStyle(fontFamily: 'Helvetica', fontSize: 48, fontWeight: FontWeight.bold, color: Colors.black),
        displayMedium: TextStyle(fontFamily: 'Helvetica', fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
        displaySmall: TextStyle(fontFamily: 'Helvetica', fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }
}
