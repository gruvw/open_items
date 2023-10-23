import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';

class PlainButton extends StatelessWidget {
  static const _borderWidth = 2.0;
  static const _borderRadius = 4.0;
  static const _leadingSpacing = 8.0;
  static const _verticalPadding = 16.0;
  static const _horizontalPadding = 16.0;

  final String content;
  final Widget? leading;
  final bool enabled;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;
  final double horizontalPadding;

  const PlainButton({
    super.key,
    required this.content,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
    this.leading,
    this.enabled = true,
    this.horizontalPadding = _horizontalPadding,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      // Button disabled when onPressed is null
      onPressed: enabled ? (onPressed ?? () {}) : null,
      style: OutlinedButton.styleFrom(
        foregroundColor: foregroundColor, // used for splash color
        padding: EdgeInsets.symmetric(
          vertical: _verticalPadding,
          horizontal: horizontalPadding,
        ),
        backgroundColor: backgroundColor,
        disabledForegroundColor:
            foregroundColor.withOpacity(UIColors.disabledOpacity),
        disabledBackgroundColor:
            backgroundColor.withOpacity(UIColors.disabledOpacity),
        side: BorderSide(
          width: _borderWidth,
          style: borderColor == backgroundColor
              ? BorderStyle.none
              : BorderStyle.solid,
          color: enabled
              ? borderColor
              : borderColor.withOpacity(UIColors.disabledOpacity),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(_borderRadius)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null)
            Padding(
              padding: const EdgeInsets.only(right: _leadingSpacing),
              child: leading!,
            ),
          Text(
            content,
            style: UITexts.normalText.apply(color: foregroundColor),
          ),
        ],
      ),
    );
  }
}
