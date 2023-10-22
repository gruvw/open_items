import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_items/global/styles/colors.dart';

abstract class UITexts {
  static final TextStyle base = GoogleFonts.roboto(
    color: UIColors.primary,
  );

  static final TextStyle titleText = base.copyWith(
    fontSize: 18,
  );

  static final TextStyle normalText = base.copyWith(
    fontSize: 16,
  );

  static final TextStyle normalBold = base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );
}
