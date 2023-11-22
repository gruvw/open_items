import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';

class CollectionEntry extends StatelessWidget {
  final Widget? icon;
  final VoidCallback? onIconClick;
  final VoidCallback? onClick;
  final VoidCallback? onDelete;
  final Object? groupTag;
  final bool reorderEnabled;
  final bool fatDividier;
  final int index;
  final String content;

  const CollectionEntry({
    super.key,
    this.onClick,
    this.icon,
    this.onIconClick,
    this.onDelete,
    this.groupTag,
    this.reorderEnabled = true,
    this.fatDividier = false,
    required this.index,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final content = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (icon != null)
            IconButton(
              color: UIColors.primary,
              disabledColor: UIColors.primary,
              onPressed: onIconClick,
              icon: icon!,
            ),
          Expanded(
            child: InkWell(
              hoverColor: UIColors.nothing,
              onTap: onClick,
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      this.content,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: CollectionLayout.contentRightPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    final dividerWidth = fatDividier
        ? CollectionLayout.fatDividerWidth
        : CollectionLayout.dividerWidth;

    return ReorderableDelayedDragStartListener(
      enabled: reorderEnabled,
      index: index,
      child: Column(
        children: [
          Slidable(
            groupTag: groupTag,
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              extentRatio: CollectionLayout.slidableWidth /
                  MediaQuery.sizeOf(context).width,
              children: [
                const VerticalDivider(
                  width: CollectionLayout.dividerWidth,
                  thickness: CollectionLayout.dividerWidth,
                  color: UIColors.primary,
                ),
                SlidableAction(
                  icon: UIIcons.delete,
                  backgroundColor: UIColors.danger,
                  onPressed: (_) => onDelete?.call(),
                )
              ],
            ),
            child: content,
          ),
          Divider(
            height: dividerWidth,
            thickness: dividerWidth,
            color: UIColors.primary,
          ),
        ],
      ),
    );
  }
}
