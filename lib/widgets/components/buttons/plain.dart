import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

class PlainButton extends StatelessWidget {
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
    this.horizontalPadding = ButtonLayout.horizontalPadding,
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
          vertical: ButtonLayout.verticalPadding,
          horizontal: horizontalPadding,
        ),
        backgroundColor: backgroundColor,
        disabledForegroundColor:
            foregroundColor.withOpacity(UIColors.disabledOpacity),
        disabledBackgroundColor:
            backgroundColor.withOpacity(UIColors.disabledOpacity),
        side: BorderSide(
          width: ButtonLayout.borderWidth,
          style: borderColor == backgroundColor
              ? BorderStyle.none
              : BorderStyle.solid,
          color: enabled
              ? borderColor
              : borderColor.withOpacity(UIColors.disabledOpacity),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius:
              BorderRadius.all(Radius.circular(ButtonLayout.borderRadius)),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leading != null)
            Padding(
              padding:
                  const EdgeInsets.only(right: ButtonLayout.leadingSpacing),
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
