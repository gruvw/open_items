import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';

class TileButton extends StatelessWidget {
  final Widget? leading;
  final Widget? content;
  final Widget? trailing;
  final VoidCallback? onPressed;

  const TileButton({
    super.key,
    this.leading,
    this.content,
    this.trailing,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(
        foregroundColor: UIColors.primary,
        padding: const EdgeInsets.symmetric(
          vertical: DrawerLayout.tileVerticalPadding,
          horizontal: DrawerLayout.tileHorizontalPadding,
        ),
        // Reset material padding and boxes
        minimumSize: Size.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Row(
        children: [
          if (leading != null)
            Row(children: [
              leading!,
              const SizedBox(width: DrawerLayout.tileButtonSpacing),
            ]),
          if (content != null) content!,
          if (trailing != null) trailing!,
        ],
      ),
    );
  }
}
