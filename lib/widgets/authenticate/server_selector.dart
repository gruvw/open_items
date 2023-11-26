import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/ui_text.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/widgets/components/buttons/outlined.dart';

class ServerSelector extends StatelessWidget {
  final VoidCallback? onPressed;

  const ServerSelector({
    super.key,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButtonPrimary(
      leading: const Icon(
        UIIcons.server,
        color: UIColors.primary,
      ),
      onPressed: onPressed,
      child: Text(
        CoreValues.onlineServerDefault,
        style: UITexts.normal.apply(color: UIColors.primary),
      ),
    );
  }
}
