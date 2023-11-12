import 'package:flutter/material.dart';
import 'package:open_items/global/styles/layouts.dart';
import 'package:open_items/global/styles/ui_colors.dart';
import 'package:open_items/global/styles/ui_text.dart';

VoidCallback modalOnPressed(VoidCallback? onPressed, BuildContext context) {
  return () {
    onPressed?.call();
    Navigator.pop(context);
  };
}

class PlainDialog extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget actions;

  const PlainDialog({
    super.key,
    required this.title,
    required this.body,
    required this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        side: BorderSide(
          width: DialogLayout.borderWidth,
          color: UIColors.primary,
        ),
        borderRadius:
            BorderRadius.all(Radius.circular(DialogLayout.borderRadius)),
      ),
      insetPadding: const EdgeInsets.symmetric(
        horizontal: DialogLayout.outerHorizontalMargin,
      ),
      child: Container(
        constraints: const BoxConstraints(maxWidth: DialogLayout.maxWidth),
        padding: const EdgeInsets.all(DialogLayout.padding),
        child: IntrinsicWidth(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: UITexts.titleText.copyWith(fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: DialogLayout.bodyVerticalPadding,
                ),
                child: body,
              ),
              actions,
            ],
          ),
        ),
      ),
    );
  }
}
