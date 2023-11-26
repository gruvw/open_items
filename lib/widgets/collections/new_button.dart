import 'package:flutter/material.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';

class NewButton extends StatelessWidget {
  final VoidCallback? onPressed;

  const NewButton({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: UIColors.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(UILayout.floatingActionButtonRadius),
        ),
      ),
      onPressed: () => onPressed?.call(),
      child: const Icon(
        UIIcons.add,
        size: UILayout.floatingActionButtonSize,
        color: UIColors.secondary,
      ),
    );
  }
}
