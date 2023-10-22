import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/styles/text.dart';

class PlainButton extends StatelessWidget {
  final String text;
  final bool enabled;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  const PlainButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: enabled ? onPressed : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        disabledForegroundColor:
            foregroundColor.withOpacity(UIColors.disabledOpacity),
        disabledBackgroundColor:
            backgroundColor.withOpacity(UIColors.disabledOpacity),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
      child: Text(
        text,
        style: UITexts.normalText.apply(color: foregroundColor),
      ),
    );
  }
}
