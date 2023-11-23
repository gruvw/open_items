import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';

abstract class UIThemes {
  // Material 3 color scheme
  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: UIColors.background,
    onPrimary: UIColors.secondary,
    secondary: UIColors.background,
    onSecondary: UIColors.secondary,
    error: UIColors.background,
    onError: UIColors.danger,
    background: UIColors.background,
    onBackground: UIColors.secondary,
    surface: UIColors.background,
    onSurface: UIColors.secondary,
    surfaceTint: UIColors.none,
    surfaceVariant: UIColors.none,
  );

  static const textSelectionTheme = TextSelectionThemeData(
    cursorColor: UIColors.primary,
    selectionColor: UIColors.selection,
    selectionHandleColor: UIColors.selection,
  );
}
