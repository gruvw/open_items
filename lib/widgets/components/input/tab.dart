import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';

class IconTab extends StatelessWidget {
  final String text;
  final Icon icon;

  const IconTab({
    super.key,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          icon,
          const SizedBox(width: TabLayout.iconHorizontalSpacing),
          Text(text),
        ],
      ),
    );
  }
}
