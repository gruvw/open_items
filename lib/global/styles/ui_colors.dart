import 'package:flutter/material.dart';

abstract class UIColors {
  // Named colors
  static const primary = Colors.black;
  static const secondary = Colors.white;

  // Semantic colors
  static const none = Colors.transparent;
  static const danger = Colors.red;
  static final notSelected = Colors.white.withOpacity(0.6);

  // Specific colors
  static const background = Colors.white;
  static const dimmed = Color(0x77000000);
  static const selection = Color(0x44000000);

  // Text colors
  static const hintText = Color(0xFF6b6b6b);

  // Others
  static const disabledOpacity = 0.4;
}
