import 'package:flutter/material.dart';

enum ThemeType { Blue_Light, Blue_Dark }

/// AppTheme - usado para estilizar o app.
///
/// Use provider para applicar tema atual:
///
///      `AppTheme theme = context.watch();`
///      `return Container(color: theme.accentColor);`
class AppTheme {
  static ThemeType defaultTheme = ThemeType.Blue_Light;
}
