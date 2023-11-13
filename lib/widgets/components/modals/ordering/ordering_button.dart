import 'package:flutter/material.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

class OrderingButton extends StatelessWidget {
  final String label;
  final bool selected;
  final bool reversed;
  final VoidCallback onPressed;

  const OrderingButton({
    super.key,
    required this.label,
    required this.selected,
    required this.reversed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final fgColor = selected ? UIColors.secondary : UIColors.primary;
    final bgColor = selected ? UIColors.primary : UIColors.secondary;

    final content = Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: UITexts.titleText.apply(color: fgColor),
            ),
            if (selected)
              Icon(
                reversed ? UIIcons.descending : UIIcons.ascending,
                color: fgColor,
              ),
          ],
        ),
        const Divider(
          height: 1,
          thickness: 1,
          color: UIColors.primary,
        )
      ],
    );

    return InkWell(
        onTap: onPressed,
        child: Container(
          color: bgColor,
          child: content,
        ));
  }
}
