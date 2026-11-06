import 'package:flutter/material.dart';
import 'dart:ui';

class TxaTheme {
  // Baoyu Design System — Warm Obsidian & Editorial Ivory Palette
  static const Color primaryBg = Color(0xFF0B0B0A);
  static const Color secondaryBg = Color(0xFF141413);
  static const Color cardBg = Color(0xFF1A1918);
  static const Color surfaceElevated = Color(0xFF232220);
  static const Color accent = Color(0xFF8B7DFF);
  static const Color purple = Color(0xFFA855F7);
  static const Color pink = Color(0xFFEC4899);
  static const Color terracotta = Color(0xFFD97757);
  static const Color warmGold = Color(0xFFE8B959);

  static const Gradient brandGradient = LinearGradient(
    colors: [accent, purple],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Warm Editorial Text Hierarchy (>= 4.5:1 WCAG contrast on dark surfaces)
  static const Color textPrimary = Color(0xFFFAF9F5);
  static const Color textSecondary = Color(0xFFC2C0B6);
  static const Color textMuted = Color(0xFF8F8D84);

  static const Color primaryColor = accent;
  static const Color secondaryColor = purple;

  static const TextStyle headingStyle = TextStyle(
    color: textPrimary,
    fontSize: 18,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.3,
  );

  static const Color glassBg = Color(0xB8141413);
  static const double glassBlur = 24.0;
  static const Color glassBorder = Color(0x1AFAF9F5);

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryBg,
      primaryColor: accent,
      colorScheme: const ColorScheme.dark(
        primary: accent,
        secondary: purple,
        surface: cardBg,
        onSurface: textPrimary,
      ),
      cardTheme: CardThemeData(
        color: cardBg,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: glassBorder, width: 0.8),
        ),
        elevation: 0,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          letterSpacing: -0.3,
        ),
        iconTheme: IconThemeData(color: textPrimary),
      ),
    );
  }

  // Premium Liquid Glass Pill helper for Floating Navbar & Cards (Baoyu Hairline + Specular Highlight)
  static Widget liquidGlassPill({
    required Widget child,
    double radius = 999.0,
    EdgeInsets padding = EdgeInsets.zero,
    Color? borderGlowColor,
    bool useBlur = true,
  }) {
    final Widget container = Container(
      padding: padding,
      decoration: BoxDecoration(
        color: const Color(0xFF141413).withValues(alpha: 0.58),
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(
          color: borderGlowColor ?? const Color(0xFFFAF9F5).withValues(alpha: 0.10),
          width: 0.9,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.42),
            blurRadius: 18,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFFFAF9F5).withValues(alpha: 0.06),
              const Color(0xFFFAF9F5).withValues(alpha: 0.01),
            ],
          ),
        ),
        child: child,
      ),
    );

    if (!useBlur) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: container,
      );
    }

    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 30.0, sigmaY: 30.0),
        child: container,
      ),
    );
  }
}
