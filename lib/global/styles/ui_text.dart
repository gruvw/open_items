import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_items/global/styles/ui_colors.dart';

abstract class UITexts {
  static final TextStyle _base = GoogleFonts.roboto(
    color: UIColors.primary,
  );

  static final TextStyle titleText = _base.copyWith(
    fontSize: 18,
  );

  static final TextStyle normalText = _base.copyWith(
    fontSize: 15,
  );
  static final TextStyle normalBold = normalText.copyWith(
    fontWeight: FontWeight.bold,
  );

  static final TextStyle subText = _base.copyWith(
    fontSize: 13,
  );
}
