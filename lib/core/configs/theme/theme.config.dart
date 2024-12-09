import 'package:flutter/material.dart';

class AppThemeConfig {
  AppThemeConfig._();

  // *** Colors ***
  static const Color _lightModePrimaryTextColor = Colors.black;
  static const Color _lightModeSecondaryTextColor = Colors.grey;

  static const Color _darkModePrimaryTextColor = Colors.white;
  static const Color _darkModeSecondaryTextColor = Colors.grey;

  static final Color _lightModeBackgroundColor = Colors.grey.shade50;
  static final Color _darkModeBackgroundColor = Colors.grey.shade900;

  static final Color _lightModeAppBarBackgroundColor = Colors.grey.shade100;
  static final Color _darkModeAppBarBackgroundColor = Colors.grey.shade800;

  // *** Text Styles ***
  // HeadlineLarge
  static const TextStyle _32normalLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _32boldLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _32normalDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 32,
    fontWeight: FontWeight.normal,
    color: _darkModePrimaryTextColor,
  );

  static const TextStyle _32boldDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: _darkModePrimaryTextColor,
  );

  // BodyLarge
  static const TextStyle _20normalLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _20boldLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _20normalDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: FontWeight.normal,
    color: _darkModePrimaryTextColor,
  );

  static const TextStyle _20boldDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: _darkModePrimaryTextColor,
  );

  // BodyMedium
  static const TextStyle _16normalLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _16boldLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _16normalDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: _darkModePrimaryTextColor,
  );

  static const TextStyle _16boldDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 16,
    fontWeight: FontWeight.bold,
    color: _darkModePrimaryTextColor,
  );

  // BodySmall
  static const TextStyle _14normalLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _14boldLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _14normalDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: _darkModePrimaryTextColor,
  );

  static const TextStyle _14boldDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 14,
    fontWeight: FontWeight.bold,
    color: _darkModePrimaryTextColor,
  );

  // HeadlineMedium
  static const TextStyle _24normalLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _24boldLightModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: _lightModePrimaryTextColor,
  );

  static const TextStyle _24normalDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 24,
    fontWeight: FontWeight.normal,
    color: _darkModePrimaryTextColor,
  );

  static const TextStyle _24boldDarkModeTextStyle = TextStyle(
    fontFamily: 'Helvetica',
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: _darkModePrimaryTextColor,
  );

  // TextField Style
  static const InputDecoration _lightModeTextFieldDecoration = InputDecoration(
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person_outline, color: _lightModePrimaryTextColor),
  );

  static const InputDecoration _darkModeTextFieldDecoration = InputDecoration(
    border: OutlineInputBorder(),
    prefixIcon: Icon(Icons.person_outline, color: _darkModePrimaryTextColor),
  );

  // *** Theme ***
  static ThemeData get lightTheme => ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: _lightModeAppBarBackgroundColor,
          titleTextStyle: const TextStyle(
            color: _lightModePrimaryTextColor,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: _lightModePrimaryTextColor,
          secondary: _darkModePrimaryTextColor,
        ),
        scaffoldBackgroundColor: _lightModeBackgroundColor,
        textTheme: const TextTheme(
          headlineLarge: _32normalLightModeTextStyle,
          headlineMedium: _24normalLightModeTextStyle,
          bodyLarge: _20normalLightModeTextStyle,
          bodyMedium: _16normalLightModeTextStyle,
          bodySmall: _14normalLightModeTextStyle,
          labelMedium: _16boldLightModeTextStyle,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(Colors.blue),
          trackColor: WidgetStateProperty.all(Colors.grey),
        ),
        iconTheme: const IconThemeData(
          color: _lightModePrimaryTextColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                color: _lightModePrimaryTextColor,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: _lightModePrimaryTextColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: _lightModePrimaryTextColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          prefixIconColor: _lightModePrimaryTextColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        primaryColor: _lightModeBackgroundColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: Colors.grey,
          color: _lightModePrimaryTextColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: _lightModeBackgroundColor,
          modalBackgroundColor: _lightModeBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        appBarTheme: AppBarTheme(
            backgroundColor: _darkModeAppBarBackgroundColor,
            titleTextStyle: const TextStyle(
              color: _darkModePrimaryTextColor,
            )),
        colorScheme: const ColorScheme.light(
          primary: _darkModePrimaryTextColor,
          secondary: _lightModePrimaryTextColor,
        ),
        scaffoldBackgroundColor: _darkModeBackgroundColor,
        textTheme: const TextTheme(
          headlineLarge: _32boldDarkModeTextStyle,
          headlineMedium: _24boldDarkModeTextStyle,
          bodyLarge: _20normalDarkModeTextStyle,
          bodyMedium: _16normalDarkModeTextStyle,
          bodySmall: _14normalDarkModeTextStyle,
          labelMedium: _16boldDarkModeTextStyle,
        ),
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.all(Colors.blue),
          trackColor: WidgetStateProperty.all(Colors.grey),
        ),
        iconTheme: const IconThemeData(
          color: _darkModePrimaryTextColor,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.all(
              const TextStyle(
                color: _darkModePrimaryTextColor,
              ),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: _darkModePrimaryTextColor,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: _darkModePrimaryTextColor,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(32.0),
          ),
          prefixIconColor: _darkModePrimaryTextColor,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        primaryColor: _darkModeBackgroundColor,
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          circularTrackColor: Colors.grey,
          color: _darkModePrimaryTextColor,
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: _darkModeBackgroundColor,
          modalBackgroundColor: _darkModeBackgroundColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
        ),
      );
}
