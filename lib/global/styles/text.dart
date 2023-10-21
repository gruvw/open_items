import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';

abstract class UITexts {
  static const String fontFamily = "Roboto";

  static const TextStyle normalText = TextStyle(
    fontSize: 16,
    color: UIColors.primary,
  );

  static const TextStyle normalBold = TextStyle(
    fontSize: 16,
    color: UIColors.primary,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle titleText = TextStyle(
    fontSize: 18,
    color: UIColors.primary,
  );
}
