import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:open_items/global/styles/ui_colors.dart';

abstract class UITexts {
  static final TextStyle _base = GoogleFonts.roboto(
    color: UIColors.primary,
  );

  static final TextStyle title = _base.copyWith(
    fontSize: 18,
  );

  static final TextStyle titleBold = title.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle normal = _base.copyWith(
    fontSize: 15,
  );
  static final TextStyle normalBold = normal.copyWith(
    fontWeight: FontWeight.w600,
  );

  static final TextStyle sub = _base.copyWith(
    fontSize: 13,
  );
}
