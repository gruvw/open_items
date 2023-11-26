import 'package:flutter/material.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
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
    final foregroundColor = selected ? UIColors.secondary : UIColors.primary;
    final backgroundColor = selected ? UIColors.primary : UIColors.secondary;

    final content = Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: UITexts.title.apply(color: foregroundColor),
        ),
        if (selected)
          Icon(
            reversed ? UIIcons.descending : UIIcons.ascending,
            color: foregroundColor,
          ),
      ],
    );

    return InkWell(
      onTap: onPressed,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: [
            const Divider(
              height: DialogLayout.orderingDividerWidth,
              thickness: DialogLayout.orderingDividerWidth,
              color: UIColors.primary,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: DialogLayout.orderingVerticalPadding,
                horizontal: DialogLayout.orderingHorizontalPadding,
              ),
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
