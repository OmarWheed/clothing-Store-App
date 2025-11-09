import 'package:clothing_store/core/config/theme/app_theme.dart';
import 'package:flutter/material.dart';

extension AppThemeContext on BuildContext {
  /// Returns the app text-style extension from the current theme.
  ///
  /// Falls back to `AppTextStyleExtension.light` when the extension is not
  /// available to avoid runtime null errors (useful during tests or when
  /// themes are composed differently).
  AppTextStyleExtension get appTheme {
    final ext = Theme.of(this).extension<AppTextStyleExtension>();
    return ext ?? AppTextStyleExtension.light;
  }
}
