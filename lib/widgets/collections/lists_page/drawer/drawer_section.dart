import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

class DrawerSection extends StatelessWidget {
  final String title;

  const DrawerSection({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: DrawerLayout.titleVerticalPadding,
          ),
          color: UIColors.primary,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: UITexts.titleText.apply(
                  color: UIColors.secondary,
                ),
              ),
            ],
          ),
        ),
        const Divider(
          color: UIColors.background,
          height: DrawerLayout.sectionDividerWidth,
          thickness: DrawerLayout.sectionDividerWidth,
        )
      ],
    );
  }
}
