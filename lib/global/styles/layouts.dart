import 'package:flutter/rendering.dart';

abstract class UILayout {
  // static const double formDialogWidthRatio = 0.7;
  static const TextOverflow listTileOverflow = TextOverflow.ellipsis;
}

abstract class AuthenticationPageLayout {
  static const appBarBottomPadding = 8.0;
  static const primaryTabIndicatorWeight = 2.0;
  static const formMaxWidth = 800.0;
  static const formTopMargin = 50.0;
  static const formHorizontalMargin = 40.0;
  static const formVerticalSpacing = 20.0;
}

abstract class ButtonLayout {
  static const borderWidth = 2.0;
  static const borderRadius = 4.0;
  static const leadingSpacing = 8.0;
  static const verticalPadding = 16.0;
  static const horizontalPadding = 16.0;
}

abstract class TextInputLayout {
  static const borderWidth = 2.0;
}

abstract class TabLayout {
  static const iconHorizontalSpacing = 10.0;
}

abstract class DialogLayout {
  static const maxWidth = 800.0;
  static const borderWidth = 3.0;
  static const borderRadius = 6.0;
  static const padding = 16.0;
  static const bodyVerticalPadding = 14.0;
  static const outerMargin = 25.0;
}
