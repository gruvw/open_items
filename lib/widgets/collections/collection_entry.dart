import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';

class CollectionEntry extends StatelessWidget {
  final Icon? icon;
  final VoidCallback? onIconClick;
  final VoidCallback? onClick;
  final VoidCallback? onDelete;
  final Object? groupTag;
  final bool reorderEnabled;
  final int index;
  final Widget child;

  const CollectionEntry({
    super.key,
    this.onClick,
    this.icon,
    this.onIconClick,
    this.onDelete,
    this.groupTag,
    this.reorderEnabled = true,
    required this.index,
    required this.child,
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
              child: Row(children: [child]),
            ),
          ),
        ],
      ),
    );

    return ReorderableDragStartListener(
      enabled: reorderEnabled,
      index: index,
      child: Column(
        children: [
          Slidable(
            groupTag: groupTag,
            endActionPane: ActionPane(
              motion: const StretchMotion(),
              openThreshold: CollectionLayout.slideThreshold,
              closeThreshold: CollectionLayout.slideThreshold,
              extentRatio: CollectionLayout.slideableWidth /
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
          const Divider(
            height: CollectionLayout.dividerWidth,
            thickness: CollectionLayout.dividerWidth,
            color: UIColors.primary,
          ),
        ],
      ),
    );
  }
}
