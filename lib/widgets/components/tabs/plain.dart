import 'package:flutter/material.dart';
import 'package:open_items/global/styles/text.dart';

class PlainTab extends StatelessWidget {
  final Icon? icon;
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color borderColor;

  const PlainTab({
    super.key,
    required this.text,
    required this.foregroundColor,
    required this.backgroundColor,
    required this.borderColor,
    this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (icon != null) icon!,
                Text(
                  text,
                  style: TextsTheme.titleText.apply(
                    color: foregroundColor,
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 0,
            thickness: 1,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
