import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';

abstract class UIThemes {
  // Material 3 color scheme
  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: UIColors.background,
    onPrimary: UIColors.primary,
    secondary: UIColors.background,
    onSecondary: UIColors.primary,
    error: UIColors.danger,
    onError: UIColors.secondary,
    background: UIColors.background,
    onBackground: UIColors.primary,
    surface: UIColors.background,
    onSurface: UIColors.primary,
    surfaceTint: UIColors.none,
    surfaceVariant: UIColors.none,
  );

  static const textSelectionTheme = TextSelectionThemeData(
    cursorColor: UIColors.primary,
    selectionColor: UIColors.selection,
    selectionHandleColor: UIColors.primary,
  );
}
