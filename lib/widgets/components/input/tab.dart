import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

class IconTab extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool isActive;

  const IconTab({
    super.key,
    required this.text,
    required this.isActive,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final color = isActive ? UIColors.secondary : UIColors.notSelected;

    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color),
          const SizedBox(width: TabLayout.iconHorizontalSpacing),
          Text(text, style: UITexts.title.copyWith(color: color)),
        ],
      ),
    );
  }
}
