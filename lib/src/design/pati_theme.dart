import 'package:flutter/material.dart';

abstract final class PatiColors {
  static const sage = Color(0xFF6F9E86);
  static const sageDeep = Color(0xFF456B58);
  static const sageSoft = Color(0xFFE8F0EB);
  static const peach = Color(0xFFE8A87C);
  static const lightBackground = Color(0xFFF7F7F4);
  static const lightSurface = Color(0xFFFFFFFF);
  static const lightSurfaceAlt = Color(0xFFF0F2EE);
  static const lightText = Color(0xFF171717);
  static const lightMuted = Color(0xFF6F746F);
  static const darkBackground = Color(0xFF111211);
  static const darkSurface = Color(0xFF1B1D1B);
  static const darkSurfaceAlt = Color(0xFF252825);
  static const darkText = Color(0xFFF2F3F1);
  static const darkMuted = Color(0xFFB1B6B0);
  static const success = Color(0xFF4E8A68);
  static const warning = Color(0xFFC8894D);
}

abstract final class PatiSpace {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;
  static const xxl = 40.0;
}

abstract final class PatiRadius {
  static const small = 14.0;
  static const medium = 20.0;
  static const large = 28.0;
  static const hero = 32.0;
  static const pill = 999.0;
}

abstract final class PatiMotion {
  static const quick = Duration(milliseconds: 180);
  static const standard = Duration(milliseconds: 280);
  static const relaxed = Duration(milliseconds: 420);
}

abstract final class PatiTheme {
  static ThemeData light() => _theme(Brightness.light);
  static ThemeData dark() => _theme(Brightness.dark);

  static ThemeData _theme(Brightness brightness) {
    final dark = brightness == Brightness.dark;
    final background = dark ? PatiColors.darkBackground : PatiColors.lightBackground;
    final surface = dark ? PatiColors.darkSurface : PatiColors.lightSurface;
    final surfaceAlt = dark ? PatiColors.darkSurfaceAlt : PatiColors.lightSurfaceAlt;
    final text = dark ? PatiColors.darkText : PatiColors.lightText;
    final muted = dark ? PatiColors.darkMuted : PatiColors.lightMuted;

    final scheme = ColorScheme(
      brightness: brightness,
      primary: PatiColors.sage,
      onPrimary: Colors.white,
      secondary: PatiColors.peach,
      onSecondary: PatiColors.lightText,
      error: dark ? const Color(0xFFFFB4AB) : const Color(0xFFB3261E),
      onError: dark ? const Color(0xFF690005) : Colors.white,
      surface: surface,
      onSurface: text,
      surfaceContainerHighest: surfaceAlt,
      outline: dark ? const Color(0xFF454A46) : const Color(0xFFD9DDD8),
      outlineVariant: dark ? const Color(0xFF343835) : const Color(0xFFE9ECE8),
      shadow: Colors.black,
      scrim: Colors.black,
      inverseSurface: dark ? PatiColors.lightSurface : PatiColors.darkSurface,
      onInverseSurface: dark ? PatiColors.lightText : PatiColors.darkText,
      inversePrimary: PatiColors.sageSoft,
    );

    final base = ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: background,
    );

    final textTheme = base.textTheme.copyWith(
      displaySmall: base.textTheme.displaySmall?.copyWith(
        fontWeight: FontWeight.w800,
        height: 1.04,
        letterSpacing: -1.1,
      ),
      headlineMedium: base.textTheme.headlineMedium?.copyWith(
        fontWeight: FontWeight.w800,
        height: 1.08,
        letterSpacing: -.5,
      ),
      headlineSmall: base.textTheme.headlineSmall?.copyWith(
        fontWeight: FontWeight.w700,
        height: 1.12,
      ),
      titleLarge: base.textTheme.titleLarge?.copyWith(
        fontWeight: FontWeight.w700,
        letterSpacing: -.25,
      ),
      titleMedium: base.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w700,
      ),
      bodyLarge: base.textTheme.bodyLarge?.copyWith(height: 1.4),
      bodyMedium: base.textTheme.bodyMedium?.copyWith(height: 1.42),
      labelLarge: base.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w700),
    ).apply(bodyColor: text, displayColor: text);

    return base.copyWith(
      textTheme: textTheme,
      cardTheme: CardThemeData(
        elevation: 0,
        margin: EdgeInsets.zero,
        color: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PatiRadius.large),
        ),
      ),
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      iconTheme: IconThemeData(color: text),
      navigationBarTheme: NavigationBarThemeData(
        height: 72,
        backgroundColor: surface,
        indicatorColor: PatiColors.sage.withValues(alpha: dark ? .24 : .14),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return textTheme.labelMedium?.copyWith(
            fontWeight: selected ? FontWeight.w800 : FontWeight.w600,
            color: selected ? PatiColors.sageDeep : muted,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? PatiColors.sage : muted,
            size: 24,
          );
        }),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: surface,
        modalBackgroundColor: surface,
        surfaceTintColor: Colors.transparent,
        showDragHandle: true,
        dragHandleColor: scheme.outline,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(PatiRadius.hero)),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: PatiColors.sageDeep,
          foregroundColor: Colors.white,
          minimumSize: const Size(0, 54),
          textStyle: textTheme.labelLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(PatiRadius.medium),
          ),
        ),
      ),
      chipTheme: base.chipTheme.copyWith(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PatiRadius.small),
          side: BorderSide(color: scheme.outlineVariant),
        ),
        side: BorderSide(color: scheme.outlineVariant),
        selectedColor: PatiColors.sage.withValues(alpha: dark ? .26 : .14),
        backgroundColor: surface,
        labelStyle: textTheme.labelMedium,
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceAlt,
        contentPadding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(PatiRadius.medium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(PatiRadius.medium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(PatiRadius.medium),
          borderSide: const BorderSide(color: PatiColors.sage, width: 1.5),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: dark ? PatiColors.darkText : PatiColors.lightText,
        contentTextStyle: TextStyle(
          color: dark ? PatiColors.lightText : PatiColors.darkText,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(PatiRadius.medium),
        ),
      ),
    );
  }
}
