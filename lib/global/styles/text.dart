import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';

abstract class TextsTheme {
  static const String fontFamily = "Roboto";
  static const TextStyle normalText = TextStyle(
    fontSize: 16,
    color: ColorTheme.primary,
  );
  static const TextStyle normalBold = TextStyle(
    fontSize: 16,
    color: ColorTheme.primary,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle titleText = TextStyle(
    fontSize: 18,
    color: ColorTheme.primary,
  );
}
