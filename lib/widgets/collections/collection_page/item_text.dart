import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/widgets/collections/collection_entry.dart';

class ItemText extends StatelessWidget {
  final Widget leading;
  final String text;
  final VoidCallback? onClick;
  final VoidCallback? leadingOnClick;

  const ItemText({
    super.key,
    this.onClick,
    this.leadingOnClick,
    required this.leading,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: UIColors.primary,
      padding: const EdgeInsets.symmetric(
        vertical: CollectionLayout.itemTextVerticalPadding,
      ),
      child: CollectionEntry(
        index: 0,
        reorderEnabled: false,
        divider: false,
        slidable: false,
        reversed: true,
        wrap: true,
        content: text,
        leading: leading,
        onClick: onClick,
        leadingOnClick: leadingOnClick,
      ),
    );
  }
}
