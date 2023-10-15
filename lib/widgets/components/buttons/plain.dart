import 'package:flutter/material.dart';
import 'package:open_items/global/styles/text.dart';

class PlainButton extends StatelessWidget {
  final String text;
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
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 2,
            color: borderColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(4)),
        ),
      ),
      child: Text(text, style: TextsTheme.normalText.apply(color: foregroundColor),),
    );
  }
}
