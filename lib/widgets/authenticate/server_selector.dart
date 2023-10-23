import 'package:flutter/material.dart';
import 'package:open_items/global/styles/colors.dart';
import 'package:open_items/global/values.dart';
import 'package:open_items/widgets/components/buttons/outlined.dart';

class ServerSelector extends StatelessWidget {
  const ServerSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const OutlinedButtonPrimary(
      leading: Icon(
        Icons.dns_outlined,
        color: UIColors.primary,
      ),
      content: CoreValues.onlineServerDefault,
    );
  }
}
