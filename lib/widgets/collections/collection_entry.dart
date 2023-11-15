import 'package:flutter/material.dart';
import 'package:open_items/global/styles/ui_colors.dart';

class CollectionEntry extends StatelessWidget {
  final Icon? icon;
  final VoidCallback? onIconClick;
  final Widget child;
  final VoidCallback? onClick;

  const CollectionEntry({
    super.key,
    this.onClick,
    this.icon,
    this.onIconClick,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IntrinsicHeight(
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
                  onTap: onClick,
                  child: Row(children: [child]),
                ),
              ),
            ],
          ),
        ),
        Divider(),
      ],
    );
  }
}
