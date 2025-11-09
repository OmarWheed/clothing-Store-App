import 'package:flutter/material.dart';

class AppTextStyle {
  static const Color _white = Colors.white;

  // Text Styles (keep your original styles)
  static const TextStyle _regular12 = TextStyle(
    fontSize: 12,
    color: _white,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle _regular16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: _white,
  );

  static const TextStyle _regular24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: _white,
  );

  static const TextStyle _regular32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w400,
    color: _white,
  );

  static const TextStyle _medium12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  static const TextStyle _medium16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  static const TextStyle _medium24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  static const TextStyle _medium32 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: _white,
  );

  static const TextStyle _bold16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: _white,
  );

  static const TextStyle _bold24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: _white,
  );

  static const TextStyle _bold32 = TextStyle(
    fontSize: 32,
    color: _white,
    fontWeight: FontWeight.w700,
  );

  // Text Theme
  static TextTheme get textTheme => TextTheme(
    // Display Styles (for large headlines)
    displayLarge: _bold32,
    displayMedium: _bold24,
    displaySmall: _bold16,

    // Headline Styles (for page titles)
    headlineLarge: _medium32,
    headlineMedium: _medium24,
    headlineSmall: _medium16,

    // Title Styles (for section titles)
    titleLarge: _regular32,
    titleMedium: _regular24,
    titleSmall: _regular16,

    // Body Styles (for main content)
    bodyLarge: _medium16,
    bodyMedium: _regular16,
    bodySmall: _regular12,

    // Label Styles (for form fields, buttons)
    labelLarge: _medium16,
    labelMedium: _medium12,
    labelSmall: _regular12,
  );
}
