import 'package:flutter/material.dart';

abstract class UIColors {
  // Named colors
  static const Color primary = Colors.black;
  static const Color secondary = Colors.white;

  // Semantic colors
  static const Color nothing = Colors.transparent;
  static const Color danger = Colors.red;

  // Specific colors
  static const Color background = Colors.white;
  static const Color dimmed = Color(0x77000000);

  // Text colors
  static const Color hintText = Color(0xFF6b6b6b);

  // Others
  static const double disabledOpacity = 0.4;
}
