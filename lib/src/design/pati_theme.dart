import 'package:flutter/material.dart';

abstract final class PatiColors {
  static const sage = Color(0xFF6F9E86);
  static const peach = Color(0xFFE8A87C);
  static const lightBackground = Color(0xFFF7F7F4);
  static const lightText = Color(0xFF171717);
  static const lightSurface = Color(0xFFFFFFFF);
  static const darkBackground = Color(0xFF111211);
  static const darkSurface = Color(0xFF1B1D1B);
  static const darkText = Color(0xFFF2F3F1);
}

abstract final class PatiSpace {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
}

abstract final class PatiRadius {
  static const small = 14.0;
  static const medium = 20.0;
  static const large = 28.0;
}

abstract final class PatiTheme {
  static ThemeData light() => _theme(Brightness.light);
  static ThemeData dark() => _theme(Brightness.dark);

  static ThemeData _theme(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final scheme = ColorScheme.fromSeed(
      seedColor: PatiColors.sage,
      brightness: brightness,
      surface: dark ? PatiColors.darkSurface : PatiColors.lightSurface,
    );
    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: dark ? PatiColors.darkBackground : PatiColors.lightBackground,
      textTheme: Typography.material2021(platform: TargetPlatform.iOS).black.apply(
        bodyColor: dark ? PatiColors.darkText : PatiColors.lightText,
        displayColor: dark ? PatiColors.darkText : PatiColors.lightText,
      ),
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: dark ? PatiColors.darkSurface : PatiColors.lightSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(PatiRadius.large)),
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 70,
        backgroundColor: dark ? PatiColors.darkSurface : PatiColors.lightSurface,
        indicatorColor: PatiColors.sage.withValues(alpha: .16),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: dark ? PatiColors.darkSurface : PatiColors.lightSurface,
        modalBackgroundColor: dark ? PatiColors.darkSurface : PatiColors.lightSurface,
        showDragHandle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(PatiRadius.large)),
        ),
      ),
    );
  }
}
