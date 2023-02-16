import 'package:flutter/material.dart';

class AppThemes {
  const AppThemes._();

  static ThemeData lightMode() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xFF006D40),
        onPrimary: Color(0xFFFFFFFF),
        primaryContainer: Color(0xFF95F7B9),
        onPrimaryContainer: Color(0xFF002110),
        secondary: Color(0xFF4F6354),
        onSecondary: Color(0xFFFFFFFF),
        secondaryContainer: Color(0xFFD1E8D5),
        onSecondaryContainer: Color(0xFF0C1F14),
        tertiary: Color(0xFF3B6470),
        onTertiary: Color(0xFFFFFFFF),
        tertiaryContainer: Color(0xFFBFE9F8),
        onTertiaryContainer: Color(0xFF001F27),
        error: Color(0xFFBA1A1A),
        errorContainer: Color(0xFFFFDAD6),
        onError: Color(0xFFFFFFFF),
        onErrorContainer: Color(0xFF410002),
        background: Color(0xFFFBFDF8),
        onBackground: Color(0xFF191C1A),
        surface: Color(0xFFFBFDF8),
        onSurface: Color(0xFF191C1A),
        surfaceVariant: Color(0xFFDCE5DB),
        onSurfaceVariant: Color(0xFF414942),
        outline: Color(0xFF717971),
        onInverseSurface: Color(0xFFF0F1EC),
        inverseSurface: Color(0xFF2E312E),
        inversePrimary: Color(0xFF79DA9F),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF006D40),
        outlineVariant: Color(0xFFC0C9C0),
        scrim: Color(0xFF000000),
      ),
    );
  }

  static ThemeData darkMode() {
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xFF79da9f),
        onPrimary: Color(0xFF00391F),
        primaryContainer: Color(0xFF00522F),
        onPrimaryContainer: Color(0xFF95F7B9),
        secondary: Color(0xFFB5CCBA),
        onSecondary: Color(0xFF213528),
        secondaryContainer: Color(0xFF374B3D),
        onSecondaryContainer: Color(0xFFD1E8D5),
        tertiary: Color(0xFFA3CDDB),
        onTertiary: Color(0xFF033641),
        tertiaryContainer: Color(0xFF214C58),
        onTertiaryContainer: Color(0xFFBFE9F8),
        error: Color(0xFFFFB4AB),
        errorContainer: Color(0xFF93000A),
        onError: Color(0xFF690005),
        onErrorContainer: Color(0xFFFFDAD6),
        background: Color(0xFF191C1A),
        onBackground: Color(0xFFE1E3DE),
        surface: Color(0xFF191C1A),
        onSurface: Color(0xFFE1E3DE),
        surfaceVariant: Color(0xFF414942),
        onSurfaceVariant: Color(0xFFC0C9C0),
        outline: Color(0xFF8A938B),
        onInverseSurface: Color(0xFF191C1A),
        inverseSurface: Color(0xFFE1E3DE),
        inversePrimary: Color(0xFF006D40),
        shadow: Color(0xFF000000),
        surfaceTint: Color(0xFF79DA9F),
        outlineVariant: Color(0xFF414942),
        scrim: Color(0xFF000000),
      ),
    );
  }
}
