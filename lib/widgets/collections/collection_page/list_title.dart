import 'package:flutter/material.dart';
import 'package:open_items/global/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

class ListTitle extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;

  const ListTitle({
    super.key,
    this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        color: UIColors.primary,
        padding: const EdgeInsets.symmetric(
          vertical: CollectionLayout.titleVerticalPadding,
          horizontal: CollectionLayout.titleHorizontalPadding,
        ),
        child: Column(
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: UITexts.title.copyWith(color: UIColors.secondary),
            ),
          ],
        ),
      ),
    );
  }
}
