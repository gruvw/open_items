import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';

class CollectionEntry extends StatelessWidget {
  final Icon? icon;
  final VoidCallback? onIconClick;
  final Widget child;
  final VoidCallback? onClick;
  final VoidCallback? onDelete;
  final Object? groupTag;

  const CollectionEntry({
    super.key,
    this.onClick,
    this.icon,
    this.onIconClick,
    this.onDelete,
    this.groupTag,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slidable(
          groupTag: groupTag,
          endActionPane: ActionPane(
            motion: const StretchMotion(),
            extentRatio: CollectionLayout.slideableWidth /
                MediaQuery.of(context).size.width,
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
          child: IntrinsicHeight(
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
          ),
        ),
        const Divider(
          height: CollectionLayout.dividerWidth,
          thickness: CollectionLayout.dividerWidth,
          color: UIColors.primary,
        ),
      ],
    );
  }
}
