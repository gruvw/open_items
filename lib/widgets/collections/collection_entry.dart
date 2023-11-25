import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:open_items/global/styles/icons/ui_icons.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

class CollectionEntry extends StatelessWidget {
  final Widget? leading;
  final VoidCallback? leadingOnClick;
  final VoidCallback? onClick;
  final VoidCallback? onDelete;
  final Object? groupTag;
  final bool reorderEnabled;
  final bool divider;
  final bool fatDividier;
  final int index;
  final String content;
  final bool isFat;
  final bool slidable;
  final bool reversed;
  final bool wrap;

  const CollectionEntry({
    super.key,
    this.onClick,
    this.leading,
    this.leadingOnClick,
    this.onDelete,
    this.groupTag,
    this.slidable = true,
    this.reorderEnabled = true,
    this.divider = true,
    this.fatDividier = false,
    this.isFat = false,
    this.reversed = false,
    this.wrap = false,
    required this.index,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    final content = IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (leading != null)
            Column(
              children: [
                IconButton(
                  color: UIColors.primary,
                  disabledColor: UIColors.primary,
                  onPressed: leadingOnClick,
                  icon: leading!,
                  style: IconButton.styleFrom(
                    // Reset material padding and boxes
                    padding: const EdgeInsets.only(
                      right: CollectionLayout.contentHorizontalPadding,
                    ),
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          Expanded(
            child: InkWell(
              hoverColor: UIColors.none,
              onTap: onClick,
              child: Text(
                this.content,
                overflow: wrap ? null : TextOverflow.ellipsis,
                style: UITexts.normalText.copyWith(
                  fontWeight: isFat ? FontWeight.w600 : FontWeight.normal,
                  color: reversed ? UIColors.secondary : UIColors.primary,
                ),
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
            enabled: slidable,
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
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: CollectionLayout.contentVerticalPadding,
                horizontal: CollectionLayout.contentHorizontalPadding,
              ),
              child: content,
            ),
          ),
          if (divider)
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
