import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
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
        Icons.dns_outlined,
        color: UIColors.primary,
      ),
      content: CoreValues.onlineServerDefault,
      onPressed: onPressed,
    );
  }
}
