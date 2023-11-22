import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

class MenuElement extends StatelessWidget {
  final String text;
  final IconData? icon;
  final Color color;

  const MenuElement({
    super.key,
    required this.text,
    this.icon,
    Color? color,
  }) : color = color ?? UIColors.primary;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null)
          Row(
            children: [
              Icon(
                icon,
                color: color,
              ),
              const SizedBox(width: UILayout.iconTextHorizontalSpacing)
            ],
          ),
        Text(
          text,
          style: UITexts.normalText.apply(color: color),
        ),
      ],
    );
  }
}
