import 'package:clothing_store/core/utils/app_colors.dart';
import 'package:clothing_store/core/utils/app_extension.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: Colors.white,

      colorScheme: ColorScheme.light(
        primary: AppColor.primaryColor,
        onPrimary: Colors.black,

        brightness: Brightness.light,
      ),

      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: context.appTheme.medium16,
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // Borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFF4F4F4)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFF4F4F4)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Color(0xFFF4F4F4)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),

        fillColor: Color(0xFFF4F4F4),
        filled: true,

        hintStyle: context.appTheme.regular16.copyWith(
          color: Colors.grey.shade600,
        ),

        errorStyle: TextStyle(color: Colors.red),

        // Content padding
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        // Prefix/Suffix icon color
        prefixIconColor: Colors.grey.shade600,
        suffixIconColor: Colors.grey.shade600,
      ),
      extensions: [AppTextStyleExtension.dark],
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    return ThemeData(
      scaffoldBackgroundColor: AppColor.bgColor,
      appBarTheme: AppBarTheme(backgroundColor: Colors.transparent,),
      colorScheme: ColorScheme.dark(
        primary: AppColor.primaryColor,
        onPrimary: Colors.white,
        brightness: Brightness.dark,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: context.appTheme.medium16,
          backgroundColor: AppColor.primaryColor,
          foregroundColor: Colors.white,
          minimumSize: const Size(double.infinity, 52),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        // Borders
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.bgColorTextField),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.bgColorTextField),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColor.bgColorTextField),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),

        fillColor: AppColor.bgColorTextField,
        filled: true,

        hintStyle: context.appTheme.regular16.copyWith(
          color: AppColor.textColorTextFieldDark,
        ),

        errorStyle: TextStyle(color: Colors.red),

        // Content padding
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),

        // Prefix/Suffix icon color
        prefixIconColor: Colors.grey.shade600,
        suffixIconColor: Colors.grey.shade600,
      ),
      extensions: [AppTextStyleExtension.light],
    );
  }
}

class AppTextStyleExtension extends ThemeExtension<AppTextStyleExtension> {
  final TextStyle regular12;
  final TextStyle regular16;
  final TextStyle regular24;
  final TextStyle regular32;
  final TextStyle medium12;
  final TextStyle medium16;
  final TextStyle medium24;
  final TextStyle medium32;
  final TextStyle bold16;
  final TextStyle bold24;
  final TextStyle bold32;
  const AppTextStyleExtension({
    required this.regular12,
    required this.regular16,
    required this.regular24,
    required this.regular32,
    required this.medium12,
    required this.medium16,
    required this.medium24,
    required this.medium32,
    required this.bold16,
    required this.bold24,
    required this.bold32,
  });

  @override
  AppTextStyleExtension copyWith({
    TextStyle? regular12,
    TextStyle? regular16,
    TextStyle? regular24,
    TextStyle? regular32,
    TextStyle? medium12,
    TextStyle? medium16,
    TextStyle? medium24,
    TextStyle? medium32,
    TextStyle? bold16,
    TextStyle? bold24,
    TextStyle? bold32,
  }) {
    return AppTextStyleExtension(
      regular12: regular12 ?? this.regular12,
      regular16: regular16 ?? this.regular16,
      regular24: regular24 ?? this.regular24,
      regular32: regular32 ?? this.regular32,
      medium12: medium12 ?? this.medium12,
      medium16: medium16 ?? this.medium16,
      medium24: medium24 ?? this.medium24,
      medium32: medium32 ?? this.medium32,
      bold16: bold16 ?? this.bold16,
      bold24: bold24 ?? this.bold24,
      bold32: bold32 ?? this.bold32,
    );
  }

  @override
  ThemeExtension<AppTextStyleExtension> lerp(
    covariant ThemeExtension<AppTextStyleExtension>? other,
    double t,
  ) {
    if (other is! AppTextStyleExtension) return this;

    return AppTextStyleExtension(
      regular12: TextStyle.lerp(regular12, other.regular12, t)!,
      regular16: TextStyle.lerp(regular16, other.regular16, t)!,
      regular24: TextStyle.lerp(regular24, other.regular24, t)!,
      regular32: TextStyle.lerp(regular32, other.regular32, t)!,
      medium12: TextStyle.lerp(medium12, other.medium12, t)!,
      medium16: TextStyle.lerp(medium16, other.medium16, t)!,
      medium24: TextStyle.lerp(medium24, other.medium24, t)!,
      medium32: TextStyle.lerp(medium32, other.medium32, t)!,
      bold16: TextStyle.lerp(bold16, other.bold16, t)!,
      bold24: TextStyle.lerp(bold24, other.bold24, t)!,
      bold32: TextStyle.lerp(bold32, other.bold32, t)!,
    );
  }

  static final light = AppTextStyleExtension(
    regular12: _regular12,
    regular16: _regular16,
    regular24: _regular24,
    regular32: _regular32,
    medium12: _medium12,
    medium16: _medium16,
    medium24: _medium24,
    medium32: _medium32,
    bold16: _bold16,
    bold24: _bold24,
    bold32: _bold32,
  );
  static final dark = AppTextStyleExtension(
    regular12: _regular12.copyWith(color: _dark),
    regular16: _regular16.copyWith(color: _dark),
    regular24: _regular24.copyWith(color: _dark),
    regular32: _regular32.copyWith(color: _dark),
    medium12: _medium12.copyWith(color: _dark),
    medium16: _medium16.copyWith(color: _dark),
    medium24: _medium24.copyWith(color: _dark),
    medium32: _medium32.copyWith(color: _dark),
    bold16: _bold16.copyWith(color: _dark),
    bold24: _bold24.copyWith(color: _dark),
    bold32: _bold32.copyWith(color: _dark),
  );

  static const Color _white = Colors.white;
  static const Color _dark = Colors.black;

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
}
